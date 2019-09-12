package complaints;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import complaints.ComplaintsDAO;
import complaints.ComplaintsDTO;
import java.io.PrintWriter;
import javax.mail.Transport;
import javax.mail.Message;
import javax.mail.Address;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.Session;
import javax.mail.Authenticator;
import java.util.Properties;
import util.Gmail;

public class ComplaintsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		MultipartRequest multi = null;
		int fileMaxSize = 10 * 1024 * 1024;
		String savePath = request.getRealPath("/upload").replaceAll("\\\\","/");
		try {
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
		}catch(Exception e) {
			request.getSession().setAttribute("messageType","���� �޽���");
			request.getSession().setAttribute("mewssageContent", "���� ũ��� 10MB�� ���� �� �����ϴ�.");
			response.sendRedirect("cmp_to_student_council_Write.jsp");
			return;
		}
		HttpSession session = request.getSession();
		String userID = multi.getParameter("userID");
		String cmpTitle = multi.getParameter("cmpTitle");
		String cmpContent = multi.getParameter("cmpContent");
		String cmpDivide = multi.getParameter("cmpDivide");
		String cmpDate = multi.getParameter("cmpDate");
		
		if(cmpTitle==null || cmpContent==null||cmpTitle.equals("")||cmpContent.equals("")) {
			session.setAttribute("messageType", "���� �޽���");
			session.setAttribute("messageContent", "������ ��� ä���ּ���.");
			response.sendRedirect("student_council_photo_Write.jsp");
			return;
		}
		File file = multi.getFile("cmpFile");
		ComplaintsDAO cmpDAO = new ComplaintsDAO();
		String cmpFile = "";
		String cmpRealFile = "";
		
		if(file !=null) {
			cmpFile = multi.getOriginalFileName("cmpFile");
			cmpRealFile = file.getName();
			cmpDAO.write(new ComplaintsDTO(0, cmpTitle,userID,cmpContent,cmpDivide,cmpFile,cmpRealFile,cmpDate,0,0,0,0,0,0),true);
		}else {
			cmpDAO.write(new ComplaintsDTO(0, cmpTitle,userID,cmpContent,cmpDivide,cmpFile,cmpRealFile,cmpDate,0,0,0,0,0,0),true);
		}
		 String host="http://localhost:8080/SnS/";
			String from="sjswsns@gmail.com";
			String to="sseunghun99@naver.com";//�ο� ����� �����ּ�
			String subject ="[��������]�ο��� �����Ǿ����ϴ�."+cmpDAO.getDate();
			String content ="����: "+cmpTitle+"<br>������¥: "+cmpDAO.getDate()+"<br>"+cmpContent+
			"\n<a href='" + host + "cmp_to_student_council_View.jsp?cmpID="+cmpDAO.countCmp(true)+
					"'><br>�ο� �ٷΰ���</a>";
			
			Properties p = new Properties();
			p.put("mail.smtp.user",from);
			p.put("mail.smtp.host","smtp.googlemail.com");
			p.put("mail.smtp.port","465");
			p.put("mail.smtp.starttls.enable","true");
			p.put("mail.smtp.auth","true");
			p.put("mail.smtp.debug","true");
			p.put("mail.smtp.socketFactory.port","465");
			p.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback","false");
			
			try{
				Authenticator auth =new Gmail();
				Session ses=Session.getInstance(p,auth);
				ses.setDebug(true);
				MimeMessage msg=new MimeMessage(ses);
				msg.setSubject(subject);
				Address fromAddr=new InternetAddress(from);
				msg.setFrom(fromAddr);
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO,toAddr);
				msg.setContent(content,"text/html;charset=UTF8");
				Transport.send(msg);
			}catch(Exception e){
				e.printStackTrace();
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('������ �߻��߽��ϴ�.')");
				script.println("history.back();");
				script.println("</script>");
				script.close();
				return;
			}
		
		session.setAttribute("messageType", "���� �޽���");
		session.setAttribute("messageContent", "�ο� �Խð� �Ϸ�Ǿ����ϴ�.");
		response.sendRedirect("cmp_to_student_council.jsp");
		return;
	}
}