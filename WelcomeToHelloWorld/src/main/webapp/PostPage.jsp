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
</style>
<link rel="stylesheet" href="css/PostPage.css">
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

			<button id="btn1" style="border-radius: 30px; cursor: pointer;">글
				작성하기</button>
			<button id="btn2" style="border-radius: 30px; cursor: pointer;">글
				수정하기</button>
			<button id="btn3" style="border-radius: 30px; cursor: pointer;">보류^^</button>
			<button id="btn4" style="border-radius: 30px; cursor: pointer;">
				활동종료<br>(로그아웃)
			</button>
		</section>

		<style>
#btn1, #btn2, #btn3, #sg_button, #btn3_h, #btn4_h {
	display: none;
}
</style>


		<form id="postForm" action="PostController1" method="post" enctype="multipart/form-data">
			<section class="subContainer2">
				<div class="subContainer2-1">
					subContainer2-1<br>
					<div class="search">
						<input class="search-input" type="text"
							placeholder="검색어를 입력하세요...">
						<button class="search-button">검색🔍</button>
					</div>


				</div>


				<div class="subContainer2-2">
					<div class="subContainer2-2-right" align="center">
						subContainer2-2-right-이미지<br>
						<div id="image-container">
							<img id="imageimage" src="img/test.png" alt="미리보기 이미지" />
						</div>

						<!-- 파일 입력 (숨김 처리) -->
						<input type="file" id="imageUpload" name="imageUpload" accept="image/*"
							style="display: none;" />
					</div>
					<div class="subContainer2-2-left">
						subContainer2-2-left-게시글
						<div class="post" style="font-size: 20px; font-weight: bold;">

							<div class="subContainer2-2-left">
								<div class="text-box"
									style="border: 1px solid #ddd; padding: 15px; border-radius: 8px; background-color: #f9f9f9; max-width: 400px;">
									<button class="user_profile" type="submit"
										style="font-weight: bold; background: none; border: none; cursor: pointer; color: #007bff;"
										align="left">@지수핑</button>
									<br> <br>
									<textarea id="textarea" name="textarea" placeholder="텍스트를 입력하세요..."
										style="width: 100%; height: 300px; font-size: 16px; padding: 10px; border: 1px solid #ddd; border-radius: 8px; resize: vertical;"></textarea>
								</div>
							</div>


							<button id="sg_button">신고하기</button>
						</div>
					</div>

				</div>


				<div class="subContainer2-5">
					subContainer2-5-하단<br>
					<button id="btn1_h" type="submit">작성하기 📝</button>
					<button id="btn2_h" type="button">취소하기 ❌</button>
					<button id="btn3_h" >◀</button>
					<button id="btn4_h">▶</button>
				</div>
			</section>
		</form>

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

	<script src="js/PostPage.js"></script>
</body>
</html>