document.addEventListener('DOMContentLoaded', function() {
	const speechContainer = document.querySelector('.speech-container');
	const speechBubble = document.querySelector('.speech-bubble');

	// 버튼별 설명 텍스트 저장 (객체 형태로 관리)
	const buttonTexts = {
		subContainer1: "안녕하세요 !  <br><br> 궁금한 것이 있으면 <br><br> 저를 찾아주세요!❤",
		sg_button: "이 버튼을 <br> 클릭하시면 <br><br>  해당 게시글을  <br> 신고할 수 있어요!",
		btn1: "새로운 글을  <br><br> 작성할 수 있어요!",
		btn2: "내 게시물을 <br> 볼 수 있어요!  <br><br> 편집/ 삭제도 가능!",
		btn3: "게시물을 <br><br> 찾을 수 있어요!",
		btn4: "보류!! <br> 보류!! <br> 보류!!",
		btn5: "활동 종료 <br> 버튼입니다!! <br><br> 로그아웃이 되니 <br> 조심하세요!!",
		btn1_h: "표정을 <br><br> 남길 수 있어요!",
		btn2_h: "댓글을 남길 수도, <br><br> 읽을 수도 있어요!",
		btn3_h: "이전 게시물로 <br><br> 이동하는 버튼",
		btn4_h: "다음 게시물로 <br><br> 이동하는 버튼",
		profile: "나의 프로필",
		image: "안녕하세요 !  <br><br> 궁금한 것이 있으면 <br><br> 저를 찾아주세요!❤",
		search: "검색 버튼 !!",
		success: "비밀번호를 <br> 정확하게 입력하시면 <br> 프로필 수정을 <br> 완료합니다!",
		curiousButton: "이 사진에 대해 <br><br> 궁금하시다면 <br><br> 제가 직접<br><br> 찾아드릴게요!",
		mainPage_img: "게시물 사진",
		targetPost: "게시글"


		// ... 다른 버튼들에 대한 설명 추가
	};

	// 처음에 "안녕하세요" 표시
	speechBubble.innerHTML = "안녕하세요 !  <br><br> 궁금한 것이 있으면 <br><br> 저를 찾아주세요!❤";
	speechContainer.style.opacity = 1;

	// 각 항목에 마우스 올리면 설명 표시 (줄바꿈 처리 추가)
	const items = document.querySelectorAll('#curiousButton, #targetPost, #mainPage_img, #subContainer1, #profile, .image-container, #sg_button, #btn1, #btn2, #btn3, #btn4, #btn5, #btn1_h, #btn2_h, #btn3_h, #btn4_h, .profile');
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
	document.getElementById("profile").addEventListener("click", function() {

		window.location.href = "user_edit.jsp"; // 이동할 URL
	});
});
document.addEventListener("DOMContentLoaded", function() {
	document.getElementById("btn5").addEventListener("click", function() {
		window.location.href = "LogoutController1"; // 이동할 URL
	});
});
document.addEventListener("DOMContentLoaded", function() {
	document.getElementById("btn2").addEventListener("click", function() {
		window.location.href = "My_post.jsp"; // 이동할 URL
	});
});

document.addEventListener("DOMContentLoaded", function() {
	document.getElementById("btn1").addEventListener("click", function() {
		window.location.href = "PostPage.jsp"; // 이동할 URL
	});
});

window.onload = function() {
	var imageElement = document.querySelector("#mainPage_img input[type='image']");

	// 이미지가 존재하고 src 속성이 비어 있을 때 버튼 클릭
	if (imageElement && (imageElement.src === "" || imageElement.src === window.location.href)) {
		document.getElementById("btn4_h").click();
	}
};
document.addEventListener("DOMContentLoaded", function() {
	document.getElementById("btn4_h").addEventListener("click", function() {
		fetch("NextPostController")
			.then(response => response.json())
			.then(data => {
				if (data.base64Image && data.contentType) {
					// 이미지 데이터가 있을 때 src에 데이터 설정
					const imageElement = document.getElementById("targetImage");
					imageElement.src = `data:${data.contentType};base64,${data.base64Image}`;
				} else {
					console.error("이미지를 불러오지 못했습니다.");
				}

				if (data.content) {
					const contentElement = document.getElementById("targetPost");
					contentElement.value = data.content;
					const textElement = document.querySelector('#miniping').nextElementSibling;
					textElement.textContent = data.u_nick + '님';
					console.log(data.u_nick)
					const dateElement = document.getElementById('postDate');
					dateElement.textContent = '📆수정일 : ' + data.updated_at.slice(0, -8);
				} else {
					console.error("컨텐츠를 불러오지 못했습니다.");
				}
			})
			.catch(error => console.error("요청 오류:", error));
	});
});


document.addEventListener("DOMContentLoaded", function() {
	document.getElementById("btn3_h").addEventListener("click", function() {
		fetch("PrePostController")
			.then(response => response.json())
			.then(data => {
				if (data.base64Image && data.contentType) {
					// 이미지 데이터가 있을 때 src에 데이터 설정
					const imageElement = document.getElementById("targetImage");
					imageElement.src = `data:${data.contentType};base64,${data.base64Image}`;
				} else {
					console.error("이미지를 불러오지 못했습니다.");
				}

				if (data.content) {
					const contentElement = document.getElementById("targetPost");
					contentElement.value = data.content;
					const textElement = document.querySelector('#miniping').nextElementSibling;
					textElement.textContent = data.u_nick + '님';
					const dateElement = document.getElementById('postDate');
					dateElement.textContent = '📆수정일 : ' + data.updated_at.slice(0, -8);
				} else {
					console.error("컨텐츠를 불러오지 못했습니다.");
				}
			})
			.catch(error => console.error("요청 오류:", error));
	});
});


//document.addEventListener("DOMContentLoaded", function() {
//	document.getElementById("btn4_h").addEventListener("click", function() {
//		window.location.href = "NextPostController"; // 이동할 URL
//	});
//});
