<%@page import="com.smhrd.model.MavenMemer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.text-display {
	white-space: pre-line;
	/* 줄바꿈이 적용되도록 설정 */
}
#btn1, #btn2, #btn3, #btn4, #sg_button, #btn3_h, #btn4_h, #btn5 {
	display: none;
}
</style>
<link rel="stylesheet" href="css/PostPage.css">
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

				<%
				if (memer.getU_type().substring(0, 4).equals("USER")) {
				%>
				<button id="btn1" style="border-radius: 30px; cursor: pointer;">글
					작성하기</button>
				<button id="btn2" style="border-radius: 30px; cursor: pointer;">글
					수정하기</button>
				<button id="btn3" style="border-radius: 30px; cursor: pointer;">글
					편집하기</button>

				<%
				}
				%>
			</div>
			<div class="subContainer3-2">
			</div>
		</section>

		<style>
#btn1, #btn2, #btn3, #btn4, #sg_button, #btn3_h, #btn4_h, #btn5 {
	display: none;
}
</style>

		<form id="postForm" action="PostController1" method="post"
			enctype="multipart/form-data">
			<section class="subContainer2">

				<div class="subContainer2-2">
					<div class="subContainer2-2-right" id="subContainer2_2_right" align="center">
						<br>
						<div id="image-container">
							<img id="imageimage" src="img/test.png" alt="미리보기 이미지" />
						</div>

						<!-- 파일 입력 (숨김 처리) -->
						<input type="file" id="imageUpload" name="imageUpload"
							accept="image/*" style="display: none;" />
					</div>

					<div class="subContainer2-2-left">
						<div class="post" style="font-size: 20px; font-weight: bold;">
							<br>
							<p type='text' style="position: relative; top: -50px;">
								<button class="user_profile" type="submit" align="left">
									<img id="miniping" src="img/P_Ping.png" align="center">지숭님
								</button>
								<span id="postDate" style="margin-left: 30px;"></span>
								<!-- 날짜가 표시될 부분 -->
								📆 <span class="orange-line"></span> <br>
							</p>
						</div>


						<!-- 텍스트 입력용 박스 추가 -->


						<textarea id="textarea" name="textarea" placeholder="글을 작성하세요..."
							style=" font-size: 24px; padding: 20px; width: 400px; height: 450px; resize: vertical;
							box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); margin-top: -30px; "></textarea>
					</div>
					<script>
						// 작성 시점의 날짜를 표시하기 위한 JavaScript 코드
						const postDate = new Date(); // 현재 날짜 및 시간 생성
						const formattedDate = postDate.toISOString().split('T')[0]; // 날짜만 가져오도록 포맷
						document.getElementById("postDate").innerText = formattedDate; // 날짜를 HTML에 추가
					</script>
				</div>


				<div class="subContainer2-5">
					<br>
					<button id="btn1_h" type="submit">작성하기 📝</button>
					<button id="btn2_h" type="button">취소하기 ❌</button>
					<button id="btn3_h">◀</button>
					<button id="btn4_h">▶</button>
				</div>
			</section>
		</form>

		<!-- 1번 옮김 -->

		<section class="subContainer1" id="subContainer1">
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

	<script src="js/PostPage.js"></script>
</body>
</html>