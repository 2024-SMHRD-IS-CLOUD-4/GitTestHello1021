document.addEventListener('DOMContentLoaded', function() {
	const speechContainer = document.querySelector('.speech-container');
	const speechBubble = document.querySelector('.speech-bubble');

	// 버튼별 설명 텍스트 저장 (객체 형태로 관리)
	const buttonTexts = {
		sg_button: "신고하기 버튼입니다. <br> 이 버튼을 클릭하시면 <br>  해당 게시글을  <br> 신고할 수 있어요!",
		btn1: "글 작성 버튼입니다. <br> 새로운 글을  <br> 작성할 수 있습니다.",
		btn2: "글 수정 버튼입니다. <br> 작성된 글을  <br> 수정할 수 있습니다.",
		btn3: "보류!! <br> 보류!! <br> 보류!!",
		btn4: "활동 종료 버튼입니다!! <br><br> 로그아웃이 되니 조심하세요!!",
		btn1_h: "표정을 남길 수 있어요!"


		// ... 다른 버튼들에 대한 설명 추가
	};

	// 처음에 "안녕하세요" 표시
	speechBubble.innerHTML = '안녕하세요  <br> 궁금한 것이 있으면 <br> 저를 찾아주세요!❤';
	speechContainer.style.opacity = 1;

	// 각 항목에 마우스 올리면 설명 표시 (줄바꿈 처리 추가)
	const items = document.querySelectorAll('.image-container, #sg_button, #btn1, #btn2, #btn3, #btn4, #btn1_h, .profile');
	items.forEach(item => {
		item.addEventListener('mouseenter', function() {
			const buttonId = item.id;
			if (buttonTexts[buttonId]) {
				const textWithBr = buttonTexts[buttonId].replace(/\n/g, '<br>');
				speechBubble.innerHTML = textWithBr;
			}
			speechContainer.style.opacity = 1;
		});

		item.addEventListener('mouseleave', function() {
			speechContainer.style.opacity = 0;
		});
	});
});
document.addEventListener("DOMContentLoaded", function() {
	document.getElementById("btn5").addEventListener("click", function() {
		window.location.href = "LogoutController1"; // 이동할 URL
	});
});

document.addEventListener("DOMContentLoaded", function() {
	document.getElementById("btn1").addEventListener("click", function() {
		window.location.href = "PostPage.jsp"; // 이동할 URL
	});
});
