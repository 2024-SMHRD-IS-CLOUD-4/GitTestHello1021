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
  // Sample data for the table with temporary image paths
  const data = [
    { 순번: 1, 작성자: '박영호', 작성일자: '2024-11-05', 게시물: 'Example Post 1', 사진: 'img/음식1.jpg' },
    { 순번: 2, 작성자: '김시윤', 작성일자: '2024-11-06', 게시물: 'Example Post 2', 사진: 'img/음식2.jpg' },
    { 순번: 3, 작성자: '김지수', 작성일자: '2024-11-07', 게시물: 'Example Post 3', 사진: 'img/음식3.jpg' },
    // Add more rows as needed
  ];

  const tableBody = document.getElementById('tableBody');
  const photoSelect = document.getElementById('photoSelect');
  const largeImage = document.getElementById('largeImage');

  // Populate table with data
  function populateTable() {
    tableBody.innerHTML = ''; // Clear table
    data.forEach(row => {
      const tr = document.createElement('tr');
      tr.innerHTML = `
        <td>${row.순번}</td>
        <td>${row.작성자}</td>
        <td>${row.작성일자}</td>
        <td>${row.게시물}</td>
      `;
      tableBody.appendChild(tr);
    });

    // Populate photo dropdown
    data.forEach(row => {
      const option = document.createElement('option');
      option.value = row.사진;
      option.text = `Photo for ${row.게시물}`;
      photoSelect.appendChild(option);
    });
  }

  populateTable(); // Initialize table and dropdown

  // Show large image based on selected photo
  window.showLargeImage = function () {
    const selectedImage = photoSelect.value;
    if (selectedImage) {
      largeImage.src = selectedImage;
      largeImage.style.display = 'block';
    } else {
      largeImage.style.display = 'none';
    }
  };

  // Filter table based on search inputs
  window.filterTable = function () {
    const author = document.getElementById('author').value.toLowerCase();
    const date = document.getElementById('date').value;
    const content = document.getElementById('content').value.toLowerCase();

    const filteredData = data.filter(row => {
      return (
        (!author || row.작성자.toLowerCase().includes(author)) &&
        (!date || row.작성일자 === date) &&
        (!content || row.게시물.toLowerCase().includes(content))
      );
    });

    // Repopulate table with filtered data
    tableBody.innerHTML = '';
    filteredData.forEach(row => {
      const tr = document.createElement('tr');
      tr.innerHTML = `
        <td>${row.순번}</td>
        <td>${row.작성자}</td>
        <td>${row.작성일자}</td>
        <td>${row.게시물}</td>
      `;
      tableBody.appendChild(tr);
    });
  };
});