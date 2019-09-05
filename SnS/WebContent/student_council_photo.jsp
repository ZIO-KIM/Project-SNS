<%@ page import = "file.FileDTO" %>
<%@ page import = "file.FileDAO" %>
<%@ page import="Gallery.Gallery"%>
<%@ page import="Gallery.GalleryDAO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.UserDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>세종대학교 소프트웨어융합대학 :: 학생회 :: 갤러리</title>
    <link rel="stylesheet" href="css/photo.css">
    <link rel="stylesheet" href="css/PSB.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
  </head>
  <body>
    <header>
      <nav id='first_area'>
        <a href='index.jsp'><img src="imgs/software_convergence_logo.PNG" id='logo' alt="소융대 로고"></a> <!-- 소융대 로고 -->
        <div id="menubar">
          <ul> <!-- 사이트 타이틀 하단 메뉴바 -->
            <li>학생회 <!-- 메뉴바 첫번째 - 학생회 카테고리 -->
              <ul id='submenu'>
                <li><a href='student_council_introduce.jsp'>학생회 소개</a></li>
                <li><a href='student_council_photo.jsp'>갤러리</a></li>
                <li><a href='student_council_events.jsp'>행사</a></li>
                <li><a href='student_council_public_money.jsp'>학생회비 내역</a></li>
              </ul>
            </li>

            <li>민원 <!-- 메뉴바 두번째 - 민원 카테고리 -->
              <ul id='submenu'>
                <li><a href='cmp_to_student_council.jsp'>학생회 건의사항</a></li>
                <li><a href='cmp_to_school.jsp'>학교 건의사항</a></li>
                <li><a href='introduce_cmp.jsp'>민원창구 소개</a></li>
              </ul>
            </li>

            <li>예비 소융인 <!-- 메뉴바 세번째 - 예비 소융인 카테고리 -->
              <ul id='submenu'>
                <li><a href='admission_reviews.jsp'>선배들의 입시 후기</a></li>
                <li><a href='admission_qnas.jsp'>QnA</a></li>
              </ul>
            </li>

            <li>취업&졸업 <!-- 메뉴바 네번째 - 취업&졸업 카테고리 -->
              <ul id='submenu'>
                <li><a href='employ_reviews.jsp'>취창업 후기</a><br></li>
                <li><a href='graduate_interviews.jsp'>졸업생 인터뷰</a><br></li>
                <li><a href='graduate_qnas.jsp'>졸업생 QnA</a><br></li>
              </ul>
            </li>

            <li>홍보 <!-- 메뉴바 다섯번째 - 홍보 카테고리 -->
              <ul id='submenu'>
                <li><a href='school_contests.jsp'>교내 공모전</a><br></li>
                <li><a href='not_school_contests.jsp'>교외 공모전</a><br></li>
              </ul>
            </li>

            <li>QnA <!-- 메뉴바 여섯번째 - QnA 카테고리 -->
              <ul id='submenu'>
                <li><a href='chatbot.jsp'>Chatbot</a><br></li>
                <li><a href='qna.jsp'>QnA</a><br></li>
              </ul>
            </li>
          </ul>
        </div>
        
        <h1 id='language'>한국어 / EN </h1> <!--영어, 한글 버전 바꾸는 버튼-->
        <h1 id='login'><a href="userLogin.jsp">LOGIN</a></h1> <!-- 로그인 버튼-->
      </nav>
    </header>
    
    <div id="container">
    <nav>
      <nav>
        <h2>
          <span></span>
            학생회
        </h2>
        <ul class="lnb_deps2">
             <li>
               <a href='student_council_introduce.jsp' class="jwxe_22350 active">학생회 소개</a>
             </li>
             <li>
               <a href='student_council_photo.jsp' class="jwxe_22351 ">갤러리</a>
            </li>
            <li>
              <a href='student_council_events.jsp' class="jwxe_22351 ">행사</a>
            </li>
            <li>
            	<a href='student_council_public_money.jsp'>학생회비 내역</a>
            </li>
        </ul>
      </nav>
    </nav>
    </div>
    <h1 id='title'>갤러리<br></h1>  
    <nav id='gallery_all'>
      <div class="gallery">
        <a target="_blank" href="imgs/background_img_5.jpeg">
          <img src="imgs/background_img_5.jpeg" alt="ex1" width="600" height="400">
        </a>
        <div class="desc">사진 설명</div>
      </div>

      <div class="gallery">
        <a target="_blank" href="background_img_5.jpeg">
          <img src="imgs/background_img_5.jpeg" alt="ex2" width="600" height="400">
        </a>
        <div class="desc">사진 설명</div>
      </div>

      <div class="gallery">
        <a target="_blank" href="background_img_5.jpeg">
          <img src="imgs/background_img_5.jpeg" alt="ex3" width="600" height="400">
        </a>
        <div class="desc">사진 설명</div>
      </div>

      <div class="gallery">
        <a target="_blank" href="background_img_5.jpeg">
          <img src="imgs/background_img_5.jpeg" alt="ex4" width="600" height="400">
        </a>
        <div class="desc">사진 설명</div>
      </div>
    </nav>
    
    <footer>
   		<p id='footer_content'> 010-0000-0000 | sejongsc3@gmail.com | 학생회관 409호 <br>
   		COPYRIGHT &copy 2019 세종대학교 소프트웨어융합대학 데단한 사람들 All rights reserved.</p>
    </footer>
  </body>
</html>
