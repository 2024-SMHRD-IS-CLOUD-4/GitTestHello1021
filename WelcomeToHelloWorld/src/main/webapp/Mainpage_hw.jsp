<%@page import="com.smhrd.model.MavenMemer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/Mainpage_hw.css">
</head>
<%
MavenMemer memer = (MavenMemer) session.getAttribute("login_user");
%>
<body>
	<div class="container" id="container">

		<section class="subContainer3" align="center">
			subContainer3<br>
			<button id="">
				<img id="logo" src="img/로고1.png">
			</button>
			<button id="profile" type="submit">
				<img id="nickname" src="img/P_Ping.png" align="center"><%=memer.getU_nick()%>님
			</button>

			<br>
			<div class="subContainer3-1">
				subContainer3-1
				<%
			if (memer.getU_type().substring(0, 4).equals("USER")) {
			%>
				<button id="btn1" style="border-radius: 30px; cursor: pointer;">글
					작성하기</button>
				<button id="btn2" style="border-radius: 30px; cursor: pointer;">글
					수정하기</button>
				<button id="btn3" style="border-radius: 30px; cursor: pointer;">글
					편집하기</button>
				<button id="btn4" style="border-radius: 30px; cursor: pointer;">보류^^</button>

				<%
				}
				%>
			</div>
			<div class="subContainer3-2">
				subContainer3-2
				<button id="btn5" style="border-radius: 30px; cursor: pointer;">
					활동종료<br>(로그아웃)
				</button>
			</div>
		</section>




		<section class="subContainer2">
			<div class="subContainer2-1">
				subContainer2-1<br>
				<div id="search">
					<input class="search-input" type="text" placeholder="검색어를 입력하세요...">
					<button class="search-button">검색🔍</button>
				</div>


			</div>
			<div class="subContainer2-2">
				<div class="subContainer2-2-right" align="center">
					subContainer2-2-right-이미지<br> <input type="image"
						src="img/음식1.jpg" height="450px"><br>

				</div>
				<div class="subContainer2-2-left">
					subContainer2-2-left-게시글
					<div class="post" style="font-size: 20px; font-weight: bold;">
						<button class="user_profile" type="submit" align="left">@지수핑</button>
						<br> <br> 맛도링 ~ 😀👍<br>


						<button id="sg_button">신고하기</button>
					</div>
				</div>

			</div>


			<div class="subContainer2-5">
				<div class="subContainer2-5-left" id="2-5-l">
					<br>
					<button id="btn1_h">표정짓기 😀</button>
					<button id="btn2_h">댓글달기 💬</button>
				</div>

				<div class="subContainer2-5-right" id="2-5-r">
					<br>
					<button id="btn3_h">◀</button>
					<button id="btn4_h">▶</button>
				</div>
			</div>
		</section>


		<!-- 1번 옮김 -->

		<section class="subContainer1">
			subContainer1 <br>
			<div class="image-container">
				<img src="img/pping.png" width="500px" height="" id="image">
				<div class="speech-container">
					<div class="speech-bubble">여기에 말풍선 내용</div>
					<div class="circle1"></div>
					<div class="circle2"></div>
					<div class="circle3"></div>
				</div>
			</div>
		</section>
	</div>

	<script src="js/Mainpage_hw.js"></script>
</body>
</html>