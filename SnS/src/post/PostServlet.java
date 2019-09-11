package post;

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

import post.PostDAO;
import post.PostDTO;

public class PostServlet extends HttpServlet {
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
			response.sendRedirect("post_to_student_council_Write.jsp");
			return;
		}
		HttpSession session = request.getSession();
		String userID = multi.getParameter("userID");
		String postTitle = multi.getParameter("postTitle");
		String postContent = multi.getParameter("postContent");
		String postDivide = "";
		int boardID=Integer.parseInt(multi.getParameter("boardID"));
		
		if(postTitle==null || postContent==null||postTitle.equals("")||postContent.equals("")) {
			session.setAttribute("messageType", "���� �޽���");
			session.setAttribute("messageContent", "������ ��� ä���ּ���.");
			response.sendRedirect("student_council_photo_Write.jsp");
			return;
		}
		File file = multi.getFile("postFile");
		PostDAO postDAO = new PostDAO();
		String postFile = "";
		String postRealFile = "";
		
		if(file!=null) {
			postFile = multi.getOriginalFileName("postFile");
			postRealFile = file.getName();
		}
		postDAO.write(new PostDTO(0, 0,userID,"", postTitle,postContent,postDivide,postFile,postRealFile,0,0,0,0,0,0),boardID);

		session.setAttribute("messageType", "���� �޽���");
		session.setAttribute("messageContent", "�Խñ� �ۼ��� �Ϸ�Ǿ����ϴ�.");
		response.sendRedirect("school_contests.jsp");
		return;
	}
}
