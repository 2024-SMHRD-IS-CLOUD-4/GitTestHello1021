<%@page import="java.util.Base64"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.IOException"%>
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
<link rel="stylesheet" href="css/UpdatePage.css">
</head>
<body>
	<%
	MavenMemer memer = (MavenMemer) session.getAttribute("login_user");
	String imageName = request.getParameter("name");
	String content = request.getParameter("content");
	String imagePath = "\\\\DESKTOP-TIB5NGS\\storage\\" + imageName; // 실제 이미지 파일 경로 설정 필요
	File imageFile = new File(imagePath);
	String base64Image = null;

	// 이미지 파일이 존재할 경우 Base64로 인코딩
	if (imageFile.exists() && imageFile.isFile()) {
		try (FileInputStream fileInputStream = new FileInputStream(imageFile)) {
			byte[] imageBytes = new byte[(int) imageFile.length()];
			fileInputStream.read(imageBytes);
			base64Image = Base64.getEncoder().encodeToString(imageBytes);
		} catch (IOException e) {
			out.println("이미지 파일을 읽는 중 오류 발생: " + e.getMessage());
		}
	}
	%>

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
		</section>

		<style>
#btn1, #btn2, #btn3, #btn4, #sg_button, #btn3_h, #btn4_h, #btn5 {
	display: none;
}
</style>

		<form id="postForm" action="UpdatePageController" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="name" value="<%=imageName%>" /> <input
				type="hidden" name="content" value="<%=content%>" />
			<section class="subContainer2">
				<div class="subContainer2-2">
					<div class="subContainer2-2-right" id="subContainer2_2_right"
						align="center">
						<br>
						<div id="image-container">
							<%
							if (base64Image != null) {
							%>
							<img id="imageimage"
								src="data:image/jpeg;base64,<%=base64Image%>" alt="미리보기 이미지" />
							<%
							} else {
							%>
							<img id="imageimage" src="img/test.png" alt="미리보기 이미지" />
							<%
							}
							%>
						</div>
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
								<span id="postDate" style="margin-left: 30px;"></span> 📆 <span
									class="orange-line"></span> <br>
							</p>
						</div>
						<textarea id="textarea" name="textarea" placeholder="글을 작성하세요..."
							style="font-size: 24px; padding: 20px; width: 400px; height: 450px; resize: vertical; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); margin-top: -30px;"><%=content != null ? content : ""%></textarea>
					</div>
					<script>
						const postDate = new Date();
						const formattedDate = postDate.toISOString().split('T')[0];
						document.getElementById("postDate").innerText = formattedDate;
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

	<script src="js/UpdatePage.js"></script>
</body>
</html>
