<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Photo</title>
    <link rel="stylesheet" href="photo.css">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
  </head>
  <body>
    <header>
      <nav id='first_area'>
        <a href= 'mainpage.html'><img src="software_convergence_logo.PNG" id='logo' alt="������ �ΰ�"></a> <!-- ������ �ΰ� -->
        <div id="menubar">
          <ul> <!-- ����Ʈ Ÿ��Ʋ �ϴ� �޴��� -->
            <li><a href='student_council.html'>�л�ȸ</a> <!-- �޴��� ù��° - �л�ȸ ī�װ� -->
              <ul id='submenu'>
                <li><a href='student_council_introduce.html'>�л�ȸ �Ұ�</a></li>
                <li><a href='student_council_photo.html'>������</a></li>
                <li><a href='student_council_events.html'>���</a></li>
                <li><a href='student_council_public_money.html'>�л�ȸ�� ����</a></li>
              </ul>
            </li>

            <li><a href='complaints.html'>�ο�</a> <!-- �޴��� �ι�° - �ο� ī�װ� -->
              <ul id='submenu'>
                <li><a href='cmp_to_student_council.html'>�л�ȸ ���ǻ���</a></li>
                <li><a href='cmp_to_school.html'>�б� ���ǻ���</a></li>
                <li><a href='cmp_to_etc.html'>��Ÿ �ο�</a></li>
                <li><a href='introduce_cmp.html'>�ο�â�� �Ұ�</a></li>
              </ul>
            </li>

            <li><a href='pre_sju_student.html'>���� ������</a> <!-- �޴��� ����° - ���� ������ ī�װ� -->
              <ul id='submenu'>
                <li><a href='admission_reviews.html'>������� �Խ� �ı�</a></li>
                <li><a href='admission_qnas.html'>QnA</a></li>
              </ul>
            </li>

            <li><a href='employ_n_grauation.html'>��� & ����</a> <!-- �޴��� �׹�° - ���&���� ī�װ� -->
              <ul id='submenu'>
                <li><a href='employ_reviews.html'>��â�� �ı�</a><br></li>
                <li><a href='graduate_interviews.html'>������ ���ͺ�</a><br></li>
                <li><a href='graduate_qnas.html'>������ QnA</a><br></li>
              </ul>
            </li>

            <li><a href='contest_promotions.html'>ȫ��</a> <!-- �޴��� �ټ���° - ȫ�� ī�װ� -->
              <ul id='submenu'>
                <li><a href='school_contests.html'>���� ������</a><br></li>
                <li><a href='not_school_contests.html'>���� ������</a><br></li>
              </ul>
            </li>

            <li><a href='questions.html'>QnA</a> <!-- �޴��� ������° - QnA ī�װ� -->
              <ul id='submenu'>
                <li><a href='chatbot.html'>Chatbot</a><br></li>
                <li><a href='qna.html'>QnA</a><br></li>
              </ul>
            </li>
          </ul>
        </div> <!-- �޴��� -->
        <h2 id='language'>�ѱ��� / EN </h2> <!--����, �ѱ� ���� �ٲٴ� ��ư-->
        <h2 id='login'> LOGIN</h2> <!-- �α��� ��ư-->
      </nav>
    </header>

    <h1 id='title'>������</h1>
    <nav id='gallery_all'>
      <div class="gallery">
        <a target="_blank" href="background_img_5.jpeg">
          <img src="background_img_5.jpeg" alt="ex1" width="600" height="400">
        </a>
        <div class="desc">���� ����</div>
      </div>

      <div class="gallery">
        <a target="_blank" href="background_img_5.jpeg">
          <img src="background_img_5.jpeg" alt="ex2" width="600" height="400">
        </a>
        <div class="desc">���� ����</div>
      </div>

      <div class="gallery">
        <a target="_blank" href="background_img_5.jpeg">
          <img src="background_img_5.jpeg" alt="ex3" width="600" height="400">
        </a>
        <div class="desc">���� ����</div>
      </div>

      <div class="gallery">
        <a target="_blank" href="background_img_5.jpeg">
          <img src="background_img_5.jpeg" alt="ex4" width="600" height="400">
        </a>
        <div class="desc">���� ����</div>
      </div>
    </nav>

  </body>
</html>