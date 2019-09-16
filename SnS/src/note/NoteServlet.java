package note;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		HttpSession session = request.getSession();
		String toID = null;
		if(request.getParameter("toID")!=null) {
			toID=request.getParameter("toID");
		}
		String fromID = null;
		if(request.getParameter("fromID")!=null) {
			fromID=request.getParameter("fromID");
		}
		String noteTitle = null;
		if(request.getParameter("noteTitle")!=null) {
			noteTitle=request.getParameter("noteTitle");
		}
		String noteContent = null;
		if(request.getParameter("noteContent")!=null) {
			noteContent=request.getParameter("noteContent");
		}
		if(noteTitle==null ||noteTitle.equals("")) {
			session.setAttribute("messageType", "���� �޽���");
			session.setAttribute("messageContent", "��ĭ�� ��� ä���ּ���.");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('������ �߻��߽��ϴ�.')");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
		NoteDAO noteDAO = new NoteDAO();
		noteDAO.write(new NoteDTO(0,toID,fromID,noteTitle,noteContent,"",0));

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('������ �߼۵Ǿ����ϴ�.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
}
