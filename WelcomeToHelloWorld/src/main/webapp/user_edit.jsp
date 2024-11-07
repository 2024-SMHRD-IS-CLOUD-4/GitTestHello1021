<%@page import="com.smhrd.model.MavenMemer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>내 정보 수정</title>
  <style>
        .text-display {
      white-space: pre-line;
      /* 줄바꿈이 적용되도록 설정 */
    }

  </style>
  <link rel="stylesheet" href="css/user_edit.css">
</head>
<%
MavenMemer memer = (MavenMemer) session.getAttribute("login_user");
%>
<body>
  <div class="container" id="container">

    <section class="subContainer3" align="center"><br>
      <button id=""><img id="logo" src="img/로고1.png"></button>
      <button id="profile" type="submit"><img id="nickname" src="img/P_Ping.png" align="center"><%=memer.getU_nick()%>님</button>

      <div class="subContainer3-1"></div>
      <div class="subContainer3-2"></div>
    </section>

    <section class="subContainer2">
      <div class="subContainer2-1">
        <br>
        <div id="search">
          <input class="search-input" type="text" placeholder="검색어를 입력하세요...">
          <button class="search-button">검색🔍</button>
        </div>
      </div>

      <div class="subContainer2-2">
        
        <div class="subContainer2-2-left">
          <h3>활동가 수정</h3>
          <form id="profileEditForm">
            <div class="form-group">
              <label for="nickname">닉네임</label>
              <input type="text" id="nickname" name="nickname"><br>
            </div>
            <div class="form-group">
              <label for="password">비밀번호</label>
              <input type="password" id="password" name="password"><br>
            </div>
            <div class="form-group">
              <label for="confirmPassword">비밀번호 확인</label>
              <input type="password" id="confirmPassword" name="confirmPassword"><br>
            </div>
            <div class="form-group">
              <label for="confirmPassword">전화번호</label>
              <input type="tel" id="tel" name="tel"><br>
            </div>
          </form>
        </div>
      </div>

      <div class="subContainer2-5">
        <div class="subContainer2-5-left" id="2-5-l"><br>
          <button id="btn1_h">변경하기</button>
          <!-- <button id="btn2_h">댓글달기 💬</button> -->
        </div>
        <div class="subContainer2-5-right" id="2-5-r"><br>
          <button id="btn3_h">돌아가기</button>
          <!-- <button id="btn4_h">▶</button> -->
        </div>
      </div>
    </section>

    <section class="subContainer1" id="subContainer1"><br>
      <div class="image-container">
        <img src="img/pping.png" width="500px" height="" id="image">
        <div class="speech-container">
          <div class="speech-bubble">
            여기에 말풍선 내용
          </div>
          <div class="circle1"></div>
          <div class="circle2"></div>
          <div class="circle3"></div>
        </div>
      </div>
    </section>

  </div>

  <script src="js/user_edit.js"></script>
</body>
</html>
