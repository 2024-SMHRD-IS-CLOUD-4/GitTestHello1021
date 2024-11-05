document.addEventListener('DOMContentLoaded', function () {
    const speechContainer = document.querySelector('.speech-container');
    const speechBubble = document.querySelector('.speech-bubble');
    
    // 버튼별 설명 텍스트 저장 (객체 형태로 관리)
    const buttonTexts = {
    sg_button: "신고하기 버튼입니다. <br> 이 버튼을 클릭하시면 <br> 해당 게시글을 <br> 신고할 수 있어요!",
    btn1: "글 작성 버튼입니다. <br> 새로운 글을 <br> 작성할 수 있습니다.",
    btn2: "글 수정 버튼입니다. <br> 작성된 글을 <br> 수정할 수 있습니다.",
    btn3: "보류!! <br> 보류!! <br> 보류!!",
    btn4: "활동 종료 버튼입니다!! <br><br> 로그아웃이 되니 조심하세요!!",
    btn1_h: "표정을 남길 수 있어요!",
    btn2_h: "댓글을 남길 수도, <br><br> 댓글을 읽을 수도 있어요",
    btn3_h: "이전 게시물로 <br><br> 이동하는 버튼입니다.",
    btn4_h: "다음 게시물로 <br><br> 이동하는 버튼입니다.",
    profile: "나의 프로필",
    img:"안녕하세요 <br> 궁금한 것이 있으면 <br> 저를 찾아주세요!❤"
    
    // ... 다른 버튼들에 대한 설명 추가
    };
    
    // 처음에 "안녕하세요" 표시
    speechBubble.innerHTML = '안녕하세요 <br> 궁금한 것이 있으면 <br> 저를 찾아주세요!❤';
    speechContainer.style.opacity = 1;
    
    // 각 항목에 마우스 올리면 설명 표시 (줄바꿈 처리 추가)
    const items = document.querySelectorAll('.image-container, #sg_button, #btn1, #btn2, #btn3, #btn4, #btn1_h, #btn2_h, #btn3_h, #btn4_h, #profile');
    items.forEach(item => {
    item.addEventListener('mouseenter', function () {
    const buttonId = item.id;
    if (buttonTexts[buttonId]) {
    const textWithBr = buttonTexts[buttonId].replace(/\n/g, '<br>');
    speechBubble.innerHTML = textWithBr;
    }
    speechContainer.style.opacity = 1;
    });
    
    item.addEventListener('mouseleave', function () {
    speechContainer.style.opacity = 0;
    });
    });
    });

// 요소 선택
const image = document.getElementById("imageimage");
const imageUpload = document.getElementById("imageUpload");
const preview = document.getElementById("imageimage");

// 이미지 클릭 시 파일 입력 클릭
image.addEventListener("click", function() {
    imageUpload.click(); // 파일 입력 클릭
});

// 파일 선택 시 미리보기
imageUpload.addEventListener("change", function(event) {
    const file = event.target.files[0]; // 선택한 파일 가져오기
    if (file) {
        const reader = new FileReader(); // FileReader 생성
        reader.onload = function(e) {
            // 미리보기 이미지 설정
            preview.src = e.target.result; 
            preview.style.display = "block"; // 미리보기 표시
        };
        reader.readAsDataURL(file); // 파일을 데이터 URL로 읽기
    }
});

document.addEventListener("DOMContentLoaded", function() {
	document.getElementById("btn2_h").addEventListener("click", function() {
		window.location.href = "Mainpage_hw.jsp"; // 이동할 URL
	});
});


  document.getElementById("postForm").addEventListener("submit", function(event) {
    event.preventDefault(); // 폼의 기본 제출 동작을 막습니다.

    const imageUpload = document.getElementById("imageUpload").value;
    const textarea = document.getElementById("textarea").value;

    if (!imageUpload) {
      alert("이미지를 넣어주세요!!!");
    } else if (!textarea) {
      alert("글을 작성해 주세요!!!");
    } else {
      // 실제 제출이 필요한 경우 아래 줄의 주석을 해제합니다.
      this.submit();
    }
  });