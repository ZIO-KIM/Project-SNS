<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>세종대학교 소프트웨어융합대학 :: 민원 :: 학생회 건의사항 :: 글쓰기</title>
    <link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/PSB.css">
    <meta name="viewport" content="device-width, initial-scale=1">
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
        script.println("alert('로그인을 해주세요.');");
        script.println("location.href='userLogin.jsp';");
        script.println("</script>");
        script.close();
        return;
  	}
  	int cmpID=0;
	if(request.getParameter("cmpID")!=null){
		cmpID =Integer.parseInt(request.getParameter("cmpID"));
	}
	if(cmpID==0){
		PrintWriter script =response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='cmp_to_student_council.jsp'");
		script.println("</script>");
	}
  %>  
  
    <header>
      <nav id='first_area'>
        <a href='index.jsp'><img src="imgs/software_convergence_logo.PNG" id='logo' alt="소융대 로고"></a> <!-- 소융대 로고 -->
        <div id="menubar">
          <ul> <!-- 사이트 타이틀 하단 메뉴바 -->
            <li><a href='student_council.jsp'>학생회</a> <!-- 메뉴바 첫번째 - 학생회 카테고리 -->
              <ul id='submenu'>
                <li><a href='student_council_introduce.jsp'>학생회 소개</a></li>
                <li><a href='student_council_photo.jsp'>갤러리</a></li>
                <li><a href='student_council_events.jsp'>행사</a></li>
                <li><a href='student_council_public_money.jsp'>학생회비 내역</a></li>
              </ul>
            </li>

            <li><a href='complaints.jsp'>민원</a> <!-- 메뉴바 두번째 - 민원 카테고리 -->
              <ul id='submenu'>
                <li><a href='cmp_to_student_council.jsp'>학생회 건의사항</a></li>
                <li><a href='cmp_to_school.jsp'>학교 건의사항</a></li>
                <li><a href='introduce_cmp.jsp'>민원창구 소개</a></li>
              </ul>
            </li>

            <li><a href='pre_sju_student.jsp'>예비 소융인</a> <!-- 메뉴바 세번째 - 예비 소융인 카테고리 -->
              <ul id='submenu'>
                <li><a href='admission_reviews.jsp'>선배들의 입시 후기</a></li>
                <li><a href='admission_qnas.jsp'>QnA</a></li>
              </ul>
            </li>

            <li><a href='employ_n_grauation.jsp'>취업 & 졸업</a> <!-- 메뉴바 네번째 - 취업&졸업 카테고리 -->
              <ul id='submenu'>
                <li><a href='employ_reviews.jsp'>취창업 후기</a><br></li>
                <li><a href='graduate_interviews.jsp'>졸업생 인터뷰</a><br></li>
                <li><a href='graduate_qnas.jsp'>졸업생 QnA</a><br></li>
              </ul>
            </li>

            <li><a href='contest_promotions.jsp'>홍보</a> <!-- 메뉴바 다섯번째 - 홍보 카테고리 -->
              <ul id='submenu'>
                <li><a href='school_contests.jsp'>교내 공모전</a><br></li>
                <li><a href='not_school_contests.jsp'>교외 공모전</a><br></li>
              </ul>
            </li>

            <li><a href='questions.jsp'>QnA</a> <!-- 메뉴바 여섯번째 - QnA 카테고리 -->
              <ul id='submenu'>
                <li><a href='chatbot.jsp'>Chatbot</a><br></li>
                <li><a href='qna.jsp'>QnA</a><br></li>
              </ul>
            </li>
          </ul>
        </div>
        <h1 id='language'>한국어 / EN </h1> <!--영어, 한글 버전 바꾸는 버튼-->
        
      	<h2 id='login'><a href="userLogoutAction.jsp" style="text-decoration:none; color:#000000">LOGOUT</a></h2>

      </nav>
    </header>
    <div id="container">
    <nav>
      <nav>
        <h2>
          <span></span>
            민원
        </h2>
        <ul class="lnb_deps2">
             <li>
               <a href='cmp_to_student_council.jsp' class="jwxe_22350 active">학생회 건의사항</a>
             </li>
             <li>
               <a href='cmp_to_school.jsp' class="jwxe_22351 ">학교 건의사항</a>
            </li>
            <li>
              <a href='introduce_cmp.jsp' class="jwxe_22351 ">민원창구 소개</a>
            </li>
        </ul>
      </nav>
    </nav>
    
    
    <section class="content">
      <header>
        <h1>답변 작성</h1>
      </header>
      <form method="post" action="cmp_to_student_council_ReplyAction.jsp">
      <table class="table table-bordered">
        <tbody>
        	<tr>
        		<td style="width:110px;"><h5>아이디</h5></td>
        		<td><h5><%=userID %></h5>
        		<input type="hidden" name="userID" value="<%=userID%>">
        		<input type="hidden" name="cmpID" value="<%=cmpID%>">
        		</td>
        	</tr>
            <tr>
               <th>제목: </th>
               <td><input type="text" placeholder="제목을 입력하세요. " name="cmpTitle" maxlength="50" class="form-control"/></td>
            </tr>
            <tr>
               <th>내용: </th>
               <td><textarea cols="10" placeholder="내용을 입력하세요. " name="cmpContent" maxlength="2048" style="height:350px;" class="form-control"></textarea></td>
            </tr>
            <tr>
               <th>첨부파일: </th>
               <td><input type="file" placeholder="파일을 선택하세요. " name="cmpFile" class="form-control"/></td>
            </tr>
            <tr>
               <td colspan="2">
                 <input type="submit" class="btn btn-primary pull-right" value="글쓰기">
               </td>
             </tr>
          
        </tbody>
      </table>
      </form>
      </section>
    <script src="js/bootstrap.js"></script>
  </body>
</html>
