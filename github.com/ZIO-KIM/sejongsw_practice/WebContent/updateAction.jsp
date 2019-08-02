<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%-- <jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/> 왜 빈즈를 안 사용하는지는 모르겠음
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SejongSW</title>
</head>
<body>
	<%	
	String userID =null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	if(userID==null){
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하십시오.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
	int bbsID=0;
	if(request.getParameter("bbsID")!=null){
		bbsID=Integer.parseInt(request.getParameter("bbsID"));
	}
	if(bbsID==0){
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");
	}
	Bbs bbs=new BbsDAO().getBbs(bbsID);
	if(!userID.equals(bbs.getUserID())){
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href='bbs.jsp'");
		script.println("</script>");
	}else{
		if(request.getParameter("bbsTitle")==null||request.getParameter("bbsContent")==null
				||request.getParameter("bbsTitle").equals("")||request.getParameter("bbsContent").equals("")){
			PrintWriter script =response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다..')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			BbsDAO bbsDAO =new BbsDAO();
			int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"),request.getParameter("bbsContent"));
			if(result==-1){
				PrintWriter script =response.getWriter();
				script.println("<script>");
				script.println("alert('글 수정에 실패하였습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script =response.getWriter();
				script.println("<script>");
				script.println("location.href='bbs.jsp'");
				script.println("</script>");
			}
		}	
	}
	%>
	
</body>
</html>