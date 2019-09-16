<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="complaints.ComplaintsDAO"%>
<%@ page import="complaints.ComplaintsDTO"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
<head>
<meta charset="utf-8">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
<title>세종대학교 소프트웨어융합대학 :: 회원가입</title>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Serif+KR&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Merriweather&display=swap"
	rel="stylesheet">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/PSB.css">
<link rel="stylesheet" href="css/joinpage.css">

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		if (session.getAttribute("userID") != null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그아웃을 해주세요.')");
			script.println("location.href='index.jsp'");
			script.println("</script>");
			script.close();
		}
	%>

	<header>
		<nav id='first_area'>
			<a href='index.jsp'><img src="imgs/software_convergence_logo.PNG"
				id='logo' alt="소융대 로고"></a>
			<!-- 소융대 로고 -->
			<div id="menubar">
				<ul>
					<!-- 사이트 타이틀 하단 메뉴바 -->
					<li><a href='student_council.jsp'>학생회</a> <!-- 메뉴바 첫번째 - 학생회 카테고리 -->
						<ul id='submenu'>
							<li><a href='student_council_introduce.jsp'>학생회 소개</a></li>
							<li><a href='student_council_photo.jsp'>갤러리</a></li>
							<li><a href='student_council_events.jsp'>행사</a></li>
							<li><a href='student_council_public_money.jsp'>학생회비 내역</a></li>
							<li><a href='departments.jsp'>과별 게시판</a></li>
						</ul></li>

					<li><a href='complaints.jsp'>민원</a> <!-- 메뉴바 두번째 - 민원 카테고리 -->
						<ul id='submenu'>
							<li><a href='cmp_to_student_council.jsp'>학생회 건의사항</a></li>
							<li><a href='cmp_to_school.jsp'>학교 건의사항</a></li>
							<li><a href='introduce_cmp.jsp'>민원창구 소개</a></li>
						</ul></li>

					<li><a href='pre_sju_student.jsp'>예비 소융인</a> <!-- 메뉴바 세번째 - 예비 소융인 카테고리 -->
						<ul id='submenu'>
							<li><a href='admission_reviews.jsp'>선배들의 입시 후기</a></li>
							<li><a href='admission_qnas.jsp'>QnA</a></li>
						</ul></li>

					<li><a href='employ_n_grauation.jsp'>취업 & 졸업</a> <!-- 메뉴바 네번째 - 취업&졸업 카테고리 -->
						<ul id='submenu'>
							<li><a href='employ_reviews.jsp'>취창업 후기</a><br></li>
							<li><a href='graduate_interviews.jsp'>졸업생 인터뷰</a><br></li>
							<li><a href='graduate_qnas.jsp'>졸업생 QnA</a><br></li>
						</ul></li>

					<li><a href='contest_promotions.jsp'>홍보</a> <!-- 메뉴바 다섯번째 - 홍보 카테고리 -->
						<ul id='submenu'>
							<li><a href='school_contests.jsp'>교내 공모전</a><br></li>
							<li><a href='not_school_contests.jsp'>교외 공모전</a><br></li>
						</ul></li>

					<li><a href='questions.jsp'>QnA</a> <!-- 메뉴바 여섯번째 - QnA 카테고리 -->
						<ul id='submenu'>
							<li><a href='chatbot.jsp'>Chatbot</a><br></li>
							<li><a href='qna.jsp'>QnA</a><br></li>
						</ul></li>
				</ul>
			</div>
			<h1 id='language'>한국어 / EN</h1>
			<h2 id='login'>
				<a data-toggle="modal" href="#modal-login" style="text-decoration: none; color: #000000">LOGIN</a>
			</h2>
		</nav>
	</header>

	<div id="modal-login" class="modal fade">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">로그인</h4>
					</div>
					<script>
						$(document).ready(function(){
							$('btnLogin').click(function(){
								var action = $('#frmLogin').attr("action");
								var form_data={
										user_id:$('#userID').val(),
										user_pw:$('#userPassword').val()
								};
								$.ajax({
									type:"POST",
									url:action,
									data:form_data,
									success:function(response){
										if(response.trim()=="success"){
										sessionStorage.setItem("user_id",form_data.user_id);
										$('#msg').html("<p style='color:green;font-weight:bold'>로그인 성공!</p>");
									}else{
										$('#msg').html("<p style='color:red'>아이디 또는 비밀번호가 잘못되었습니다.</p>");
									}
								},
								error:function(){
									$('#msg'),html("<h2>Error</h2>");
								}
								});
							});
						});
					</script>
					<div class="modal-body">
						<form action="userLoginAction.jsp" id="frmLogin" method="post">
							<div class="form-group">
								<input type="text" name="userID" id="uid" value=""
									placeholder="아이디" class="form-control" required="">
							</div>
							<div class="form-group">
								<input type="password" name="userPassword" id="upw" value=""
									placeholder="비밀번호" class="form-control" required="">
							</div>
							<div class="checkbox">
								<label for="keep_signed"
									onclick="jQuery('#modal-login input[name=\'keep_signed\']').click();"><input
									type="checkbox" name="keep_signed" value="Y"
									onclick="if(this.checked) return confirm('브라우저를 닫더라도 로그인이 계속 유지될 수 있습니다.\n\n로그인 유지 기능을 사용할 경우 다음 접속부터는 로그인할 필요가 없습니다.\n\n단, 게임방, 학교 등 공공장소에서 이용 시 개인정보가 유출될 수 있으니 꼭 로그아웃을 해주세요.');">
									로그인 유지</label>
							</div>
							<button type="submit" id="btnLogin" class="btn btn-block">
								<i class="fa fa-sign-in" aria-hidden="true"></i> 로그인
							</button>
							<br>
						</form>
					</div>
					<div class="modal-footer">
						<div class="btn-group btn-group-justified">
							<a
								href="userJoin.jsp"
								class="btn btn-default btn-sm"><i class="fa fa-user-plus"
								aria-hidden="true"></i> 회원가입</a> <a
								href="findAccount.jsp"
								class="btn btn-default btn-sm"><i
								class="fa fa-question-circle" aria-hidden="true"></i> ID/PW 찾기</a>

						</div>
					</div>
				</div>
			</div>
		</div>

	<div class="container">
		<div class="jumbotron" style="padding-top: 20px;">
			<div class="cen">
				<h3 style="font-weight: bold;color:#c70027;">아이디/비밀번호 찾기</h3>
				<form method="post" action="findAccountAction.jsp">
					<label for="email"> <em style="color: red">*</em> 이메일 주소로 아이디
						찾기
					</label>
					<div class="form-group col" style="width: 270px;">
						<input type="email" class="form-control" name="userEmail"
							maxlength="20" placeholder="이메일 주소" required> 
						<input id="btn_log" type="submit"
							class="btn btn-primary form-control" value="아이디 찾기">
					</div>
				</form>
				<hr>
				<form method="post" action="findPasswordAction.jsp">
					<label for="id"> <em style="color: red">*</em> 질문/답변으로 비밀번호 찾기
						찾기
					</label>
					<div class="form-group col" style="width: 270px;">
						<input type="text" class="form-control" name="userID"
							maxlength="20" placeholder="아이디" required> 
							<input type="email" class="form-control" name="userEmail"
							maxlength="20" placeholder="이메일 주소" required> 
							<select name="findPwQuestion" class="form-control"
								id="findPwQuestion" style="display: block; margin: 0 0 8px 0"><option
									value="다른 이메일 주소는?">다른 이메일 주소는?</option>
								<option value="나의 보물 1호는?">나의 보물 1호는?</option>
								<option value="나의 출신 초등학교는?">나의 출신 초등학교는?</option>
								<option value="나의 출신 고향은?">나의 출신 고향은?</option>
								<option value="나의 이상형은?">나의 이상형은?</option>
								<option value="어머니 성함은?">어머니 성함은?</option>
								<option value="아버지 성함은?">아버지 성함은?</option>
								<option value="가장 좋아하는 색깔은?">가장 좋아하는 색깔은?</option>
								<option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option></select><input
								type="text" name="findPwAnswer" id="findPwAnswer"
								class="form-control" title="비밀번호 찾기 답변" placeholder="답변" maxlength="50">
						
						<input id="btn_log" type="submit"
							class="btn btn-primary form-control" value="임시 비밀번호 발급">
					</div>
				</form>
			</div>
		</div>
	</div>
		<div class="im_footerWrap">
   	<div class="im_footer" style="width: 1600px;">
      	<div class="im_footer_logo">
	         <a href="index.jsp"><img src="imgs/footer_logo.PNG" alt="logo" border="0" style="width: 250px; margin-left: 20px; margin-right: 20px;"></a>                     </div>
         <div class="im_footer_right">
         	<div class="im_footer_menu">
               <ul>
                  <li class="active"><a href="index.jsp">메인 페이지</a></li><li><a href="http://www.sejong.ac.kr/">세종대학교</a></li><li><a href="http://www.sejongstudent.com/xe/">세종대학교 총학생회</a></li><li><a href="https://ko-kr.facebook.com/sejong1sc/">세종소융 페이스북</a></li>             </ul>
            </div>
            <div class="im_footer_info">
            	<span class="contact">010-0000-0000 | sejongsc3@gmail.com | 학생회관 409호 </span>                              <span class="copyright">COPYRIGHT ⓒ 세종대학교 소프트웨어융합대학 All right reserved.</span>                           </div>
            </div>
         <div class="im_gototop">
         	<a href="#"><span class="icon"><i class="fa fa-chevron-up"></i></span><span class="label">TOP</span></a>
         </div>
      </div>
   </div>
</body>
</html>
