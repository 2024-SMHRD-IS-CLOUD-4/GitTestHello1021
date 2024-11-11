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

/* 모달 창 스타일 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 300px;
	text-align: center;
	border-radius: 10px;
}

.close-btn {
	background-color: #f44336;
	color: white;
	padding: 10px 20px;
	border: none;
	cursor: pointer;
	border-radius: 5px;
}

.close-btn:hover {
	background-color: #d32f2f;
}


</style>

<link rel="stylesheet" href="css/Mainpage_hw.css">
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
				<button id="btn2" style="border-radius: 30px; cursor: pointer;">내
					게시물 보기</button>
				<button id="btn3" style="border-radius: 30px; cursor: pointer;">글
					검색하기</button>
				<button id="btn4" style="border-radius: 30px; cursor: pointer;">
				</button>

				<%
				}
				%>
			</div>
			<div class="subContainer3-2">
				<button id="btn5" style="border-radius: 30px; cursor: pointer;">
					활동종료<br>(로그아웃)
				</button>
			</div>
		</section>




		<section class="subContainer2">


			<div class="subContainer2-2">
				<div class="subContainer2-2-right" id="mainPage_img" align="center"
					style="position: relative;">
					 <input type="image" id="targetImage" src=""
						height="450px"><br>
					<button id="curiousButton1" onclick="handleCuriousClick()">
					<div class="reaction" id="reactionContainer"></div>
					</button>

				</div>
				<div class="subContainer2-2-left">
					<div class="post" style="font-size: 20px; font-weight: bold;">

						<br>
						<p type='text' style="position: relative; top: -50px;">
							<button class="user_profile" type="submit" align="left">
								<img id="miniping" src="img/P_Ping.png" align="center"><p style="display: inline-block; margin: 0; vertical-align: middle;"></p>
							</button>

							<span id="postDate" style="margin-left: 30px;" ></span>

							<!-- 날짜가 표시될 부분 -->
							<span class="orange-line"></span> <br>
							<input type="text" id="targetPost" placeholder="" readonly >
						</p>
						
						<!-- 신고 모달 창 HTML 추가 -->
						<div id="reportModal" class="modal">
						    <div class="modal-content">
						        <span id="modalContent">모달 창입니다.</span><br><br> <!-- 이 부분의 내용이 JavaScript로 변경됨 -->
						        <button class="close-btn" onclick="closeModal('reportModal')">닫기</button>
						    </div>
						</div>
						<!-- 기존 신고하기 버튼 -->
						<button id="sg_button">신고하기</button>
					</div>
				</div>
			</div>


			<div class="subContainer2-5" style="font-size: 20px; font-weight: bold;">
				<div class="subContainer2-5-left" id="2-5-l">
					<br>
					<button id="btn1_h">표정짓기😀</button>
					<div id="emojiPopup" class="emoji-popup">
			            <button id="emo1" onclick="addReaction(this)">😍</button>
			            <button id="emo2" onclick="addReaction(this)">😄</button>
			            <button id="emo3" onclick="addReaction(this)">😥</button>
			            <button id="emo4" onclick="addReaction(this)">😴</button>
			            <button id="emo5" onclick="addReaction(this)">🤬</button>
					</div>
					
					<!-- 신고 모달 창 HTML 추가 -->
						<div id="reportModal1" class="modal">
						    <div class="modal-content">
						        <span id="modalContent1"></span><br><br> <!-- 이 부분의 내용이 JavaScript로 변경됨 -->
						        <button class="close-btn" onclick="closeModal('reportModal1')">닫기</button>
						    </div>
						</div>
						<!-- 기존 궁금해요 버튼 -->
					<button id="curiousButton" >궁금해요🔍</button>
				</div>
				<div class="subContainer2-5-right" id="2-5-r">
					<br>
					<button id="btn3_h">◀</button>
					<button id="btn4_h">▶</button>
				</div>
			</div>
		</section>


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

	<!-- JavaScript 코드 -->
	<script>
	// 모달 창 열기 함수 (버튼 종류에 따라 다르게 표시)
	function showModal(buttonType) {
    let modal;
    if (buttonType === "sg_button") {
        modal = document.getElementById("reportModal");
    } else if (buttonType === "curiousButton") {
        modal = document.getElementById("reportModal1");
    }

    if (modal) {
        modal.style.display = "block";
    }
}

	// 모달 창 닫기 함수
	function closeModal(modalId) {
	    const modal = document.getElementById(modalId);
	    if (modal) {
	        modal.style.display = "none";
	    }
	}

	// 모달 창 외부 클릭 시 닫기 기능 추가
	window.onclick = function(event) {
	    const modals = document.querySelectorAll(".modal");
	    modals.forEach(function(modal) {
	        if (event.target == modal) {
	            modal.style.display = "none";
	        }
	    });
	}

	// `신고하기` 버튼 클릭 시 모달 창 열기
	document.getElementById("sg_button").addEventListener("click", function() {
	    showModal("sg_button");
	});

	// `궁금해요` 버튼 클릭 시 모달 창 열기
	document.getElementById("curiousButton").addEventListener("click", function() {
	    showModal("curiousButton");
	});

</script>


	<script src="js/Mainpage_hw.js"></script>
</body>
</html>