document.addEventListener('DOMContentLoaded', function () {
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
    btn1_h: "표정을 남길 수 있어요!",
    btn2_h: "댓글을 남길 수도, <br><br> 댓글을 읽을 수도 있어요",
    btn3_h: "이전 게시물로 <br><br> 이동하는 버튼입니다.",
    btn4_h: "다음 게시물로 <br><br> 이동하는 버튼입니다.",
    profile: "나의 프로필",
    image:"안녕하세요 !  <br><br> 궁금한 것이 있으면 <br><br> 저를 찾아주세요!❤",
    search:"검색 버튼 !!",
    subContainer1:"안녕하세요  <br> 궁금한 것이 있으면 <br> 저를 찾아주세요!❤"
 

    // ... 다른 버튼들에 대한 설명 추가
  };

  // 처음에 "안녕하세요" 표시
  speechBubble.innerHTML = '안녕하세요  <br> 궁금한 것이 있으면 <br> 저를 찾아주세요!❤';
  speechContainer.style.opacity = 1;

  // 각 항목에 마우스 올리면 설명 표시 (줄바꿈 처리 추가)
  const items = document.querySelectorAll(' .image-container, #sg_button, #btn1, #btn2, #btn3, #btn4, #btn5, #btn1_h, #btn2_h, #btn3_h, #btn4_h, #profile, #image, #search, .subContainer1 ');
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

document.addEventListener('DOMContentLoaded', function () {
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
  document.getElementById('image1').addEventListener('click', () => loadText('음식1.txt'));
  document.getElementById('image2').addEventListener('click', () => loadText('음식2.txt'));
  document.getElementById('image3').addEventListener('click', () => loadText('음식3.txt'));
  document.getElementById('image4').addEventListener('click', () => loadText('음식4.txt'));
  document.getElementById('image5').addEventListener('click', () => loadText('음식5.txt'));
  document.getElementById('image6').addEventListener('click', () => loadText('음식6.txt'));
  document.getElementById('image7').addEventListener('click', () => loadText('음식7.txt'));
  document.getElementById('image8').addEventListener('click', () => loadText('음식8.txt'));
  document.getElementById('image9').addEventListener('click', () => loadText('음식9.txt'));
});
