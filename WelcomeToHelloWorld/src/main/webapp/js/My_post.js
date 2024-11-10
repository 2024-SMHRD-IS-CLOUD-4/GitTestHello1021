let globalFileRname = null;

document.addEventListener('DOMContentLoaded', function() {
	const speechContainer = document.querySelector('.speech-container');
	const speechBubble = document.querySelector('.speech-bubble');

	// 버튼별 설명 텍스트 저장 (객체 형태로 관리)
	const buttonTexts = {
		sg_button: "신고하기 버튼입니다. <br> 이 버튼을 클릭하시면 <br>  해당 게시글을  <br> 신고할 수 있어요!",
		btn1: "글 작성 버튼입니다. <br> 새로운 글을  <br> 작성할 수 있습니다.",
		btn2: "글 수정 버튼입니다. <br> 작성된 글을  <br> 수정할 수 있습니다.",
		btn3: "글 편집하기 버튼입니다.?",
		btn4: "보류!! <br> 보류!! <br> 보류!!",
		btn5: "활동 종료 버튼입니다!! <br><br> 로그아웃이 되니 조심하세요!!",
		btn1_h: "이 게시물의 글을 <br> 수정할 수 있어요!!!",
		btn2_h: "이 게시물을 <br> 삭제할 수 있어요!!!",
		btn3_h: "첫 번째 화면으로 <br> (메인 페이지로) <br><br> 이동하는 버튼입니다.",
		btn4_h: "다음 게시물로 <br><br> 이동하는 버튼입니다.",
		profile: "나의 프로필",
		image: "안녕하세요 !  <br><br> 궁금한 것이 있으면 <br><br> 저를 찾아주세요!❤",
		search: "검색 버튼 !!",
		subContainer1: "안녕하세요  <br><br> 궁금한 것이 있으면 <br><br> 저를 찾아주세요!❤",
		subContainer2_2_left: "선택하신 사진에 대해 <br> 작성한 글입니다! <br><br> 글을 수정하거나 <br><br> 삭제할 수 있어요~ ",
		subContainer2_2_right: "내가 올린<br>사진 목록입니다! <br><br> 어떤 글을<br>작성했는지 <br> 확인할 수 있고, <br><br> 글을 수정하거나<br>삭제할 수도 있어요! "

		// ... 다른 버튼들에 대한 설명 추가
	};

	// 처음에 "안녕하세요" 표시
	speechBubble.innerHTML = '안녕하세요  <br> 궁금한 것이 있으면 <br> 저를 찾아주세요!❤';
	speechContainer.style.opacity = 1;

	// 각 항목에 마우스 올리면 설명 표시 (줄바꿈 처리 추가)
	const items = document.querySelectorAll(' .image-container, #sg_button, #btn1, #btn2, #btn3, #btn4, #btn5, #btn1_h, #btn2_h, #btn3_h, #btn4_h, #profile, #image, #search, #subContainer1, #subContainer2_2_left, #subContainer2_2_right ');
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

document.addEventListener('DOMContentLoaded', function() {
	// 텍스트 파일을 로드하는 함수
	function loadText(filename) {
		fetch(filename)
			.then(response => response.text())
			.then(text => {
				// 불러온 텍스트 파일의 내용을 subContainer2-2-left-게시글 영역에 표시
				document.querySelector('.subContainer2-2-left .post').innerHTML = `<p>${text}</p>`;
			})
			.catch(error => console.error('텍스트 파일을 불러오는 중 오류 발생:', error));
	}

	// 각 이미지에 클릭 이벤트 추가
});


function selectImage(selectedId) {
	// 모든 이미지의 'selected' 클래스를 제거하여 흰색 테두리로 초기화
	const images = document.querySelectorAll('.image-feed img');
	images.forEach(img => {
		img.classList.remove('selected'); // 이전 선택된 이미지의 테두리 제거
	});

	// 클릭된 이미지에만 'selected' 클래스를 추가하여 주황색 테두리 적용
	const selectedImage = document.getElementById(selectedId);
	selectedImage.classList.add('selected');  // 'selected' 클래스 추가

	globalFileRname = selectedImage.dataset.fileRname; // 전역 변수에 file_rname 저장

	console.log(`Selected Image ID: ${selectedId}`);
	console.log(`Selected globalFileRname: ${globalFileRname}`); // 디버깅: 선택된 이미지 ID 확인
}

document.addEventListener("DOMContentLoaded", function() {
	// 페이지 로드 시 자동으로 이미지 불러오기
	fetch("My_post_img_Controller")
		.then(response => response.json())
		.then(data => {
			console.log(data); // JSON 응답을 출력하여 구조 확인
			if (data.images && data.images.length > 0) {
				const imageContainer = document.getElementsByClassName("image-feed")[0];
				imageContainer.innerHTML = ''; // 기존 이미지를 지우기

				data.images.forEach((imageData, index) => {
					if (imageData.contentType && imageData.base64Image) {
						const imgElement = document.createElement('img');
						imgElement.src = `data:${imageData.contentType};base64,${imageData.base64Image}`;
						imgElement.alt = `Dynamic Image ${index + 1}`;
						imgElement.id = `image${index + 1}`;
						imgElement.classList.add('image-item'); // 이미지에 클래스 추가
						imgElement.dataset.fileRname = imageData.file_rname; // 데이터 속성으로 file_rname 저장

						// 이미지 클릭 시 selectImage 함수 실행
						imgElement.addEventListener('click', () => {
							const targetPostElement = document.getElementById('targetPost');
							if (targetPostElement) {
								targetPostElement.value = imageData.PostContent; // 이미지에 해당하는 PostContent 삽입
							} else {
								console.error('Textarea element with id "targetPost" not found');
							}

							selectImage(imgElement.id);  // 기존 함수 호출
						});

						// 이미지 컨테이너에 추가
						imageContainer.appendChild(imgElement);
					} else {
						console.error(`Invalid image data at index ${index}`);
					}
				});
			}
		})
		.catch(error => console.error("Error fetching the image:", error));
});


document.getElementById("btn3_h").addEventListener("click", function() {
	window.location.href = "Mainpage_hw.jsp"; // 이동할 URL
});

document.getElementById("btn1_h").addEventListener("click", function() {
	const textareaElement = document.getElementById("targetPost");

	if (textareaElement && globalFileRname) {
		const textarea = textareaElement.value;

		if (textarea.trim() === "") {
			alert("수정할 이미지를 클릭하세요.");
		} else {
			// GET 방식으로 JSP 페이지로 데이터 요청 (주소창에 파라미터를 모두 담아 전송)
			const url = `UpdatePage.jsp?name=${encodeURIComponent(globalFileRname)}&content=${encodeURIComponent(textarea)}`;
			window.location.href = url; // JSP로 이동하면서 데이터를 URL로 전달
		}
	} else {
		if (!textareaElement) {
			console.error("targetPost 요소를 찾을 수 없습니다.");
		}
		if (!globalFileRname) {
			alert("이미지를 먼저 선택하세요.");
		}
	}

});