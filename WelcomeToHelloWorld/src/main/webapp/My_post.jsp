<%@page import="com.smhrd.model.MavenMemer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My_post.html</title>
<style>
.text-display {
	white-space: pre-line;
	/* 줄바꿈이 적용되도록 설정 */
}
</style>
<link rel="stylesheet" href="css/My_post.css">

</head>
<%
MavenMemer memer = (MavenMemer) session.getAttribute("login_user");
%>
<body>
	<div class="container" id="container">

		<section class="subContainer3" align="center">
			<br>
			<div id="logo-wrapper">
				<img src="img/로고1.png" alt="로고 이미지" id="logo-image">
			</div>
			<button id="profile" type="submit">
				<img id="nickname" src="img/P_Ping.png" align="center"><%=memer.getU_nick()%>님
			</button>

			<br>
			<div class="subContainer3-1">
				<!-- <button id="btn1" style="border-radius: 30px; cursor: pointer;" >글 작성하기</button>
        <button id="btn2" style="border-radius: 30px; cursor: pointer;">글 수정하기</button>
        <button id="btn3" style="border-radius: 30px; cursor: pointer;">글 편집하기</button>
        <button id="btn4" style="border-radius: 30px; cursor: pointer;">보류^^</button> -->
			</div>
			<div class="subContainer3-2">
				<!-- <button id="btn5" style="border-radius: 30px; cursor: pointer;">활동종료<br>(로그아웃)</button> -->
			</div>
		</section>




		<section class="subContainer2">

			<div class="subContainer2-2">
				<div class="subContainer2-2-right" id="subContainer2_2_right"align="center">
					<div class="image-feed"></div>
				</div>



				<div class="subContainer2-2-left">
					<div class="post" style="font-size: 20px; font-weight: bold;">

						<br>
						<p type='text' style="position: relative;">
							<button class="user_profile" type="submit" align="left">
								<img id="miniping" src="img/P_Ping.png" align="center">지숭님
							</button>

							<span id="postDate" style="margin-left: 30px;"></span>

							<!-- 날짜가 표시될 부분 -->
							📆 <span class="orange-line"></span> <br> 피곤하당 😴🥱
						</p>
						<div id="pcontent"></div>

						<!--<button id="sg_button">신고하기</button> -->
					</div>
				</div>
				<script>
					// 작성 시점의 날짜를 표시하기 위한 JavaScript 코드
					const postDate = new Date(); // 현재 날짜 및 시간 생성
					const formattedDate = postDate.toISOString().split('T')[0]; // 날짜만 가져오도록 포맷
					document.getElementById("postDate").innerText = formattedDate; // 날짜를 HTML에 추가
				</script>
			</div>




			<div class="subContainer2-5">
				<div class="subContainer2-5-left" id="2-5-l">
					<br>
					<button id="btn1_h">수정하기</button>
					<button id="btn2_h">삭제하기</button>
				</div>

				<div class="subContainer2-5-right" id="2-5-r">
					<br>
					<!--           <button id="btn3_h">◀</button>
 						<button id="btn4_h">▶</button>			 -->
					<button id="btn3_h">뒤로가기</button>
				</div>
			</div>
		</section>


		<!-- 1번 옮김 -->

		<section class="subContainer1">
			<br>
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

	<script src="js/My_post.js"></script>
</body>

</html>