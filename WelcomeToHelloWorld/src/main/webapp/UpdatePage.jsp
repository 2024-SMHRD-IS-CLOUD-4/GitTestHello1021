@charset "UTF-8";


* {
	font-family: 'Malgun Gothic';
	font-style: normal;
}

body {
	transform: scale(0.9); /* 90% 크기로 축소 */
    transform-origin: bottom; /* 축소 기준을 페이지 중앙으로 설정 */
	display: flex; /* 플렉스 박스 사용 */
	justify-content: center; /* 가로 중앙 정렬 */
	align-items: center; /* 세로 중앙 정렬 */
	min-height: 100vh; /* 화면 전체 높이 설정 */
	background-color: #efefef; /* 배경색 설정 */
	margin: 0; /* 기본 여백 제거 */
	width: 100%;
	box-sizing: border-box; /* 테두리를 포함한 크기 계산 */
 	overflow: hidden; /* 스크롤 제거 */
}

.container {
	display: flex; /* 플렉스 박스 설정 */
	align-items: flex-start; /* 하단 정렬 */
}

.subContainer1, .subContainer2 {
	/* padding: 10px; /* 패딩 설정 */
	height: 880px; /* 높이 설정 */
	position: relative; /* 상대 위치 설정 */
	background-color: #efefef ;
}

.subContainer1 {
	flex: 1; /* 플렉스 비율 설정 */
	width: 270px; /* 너비 설정 */
/*		background-color: rgb(255, 255, 255);
	border-right: 2.5px solid #bfbfbf;
	border-top: 2.5px solid #bfbfbf;
	border-bottom: 2.5px solid #bfbfbf; /*박영호*/
/*	border-left: 2.5px solid #bfbfbf;*/
}

#logo-wrapper {
	width: 200px; /* 로고 영역의 너비 */
	height: auto; /* 높이는 자동 조정 */
	display: flex;
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: flex-start; /* 수직 상단 정렬 */
	background-color: #efefef; /* 배경색 설정 */
	border-radius: 10px; /* 모서리를 둥글게 설정 */
	margin: 0 auto; /* 수평 중앙 정렬 */
	margin-top: -10px; /* 상단 마진 조정으로 로고를 위로 올림 */
}

#logo-image {
	width: 80%; /* 이미지 너비 비율 조정 */
	height: auto; /* 이미지의 비율 유지 */
	display: block; /* 블록 요소로 설정 */
}

#logo {
	max-width: 100%; /* 로고 이미지의 최대 너비를 부모에 맞추기 */
	max-height: 100%; /* 로고 이미지의 최대 높이를 부모에 맞추기 */
}

#profile {
	margin: 0 auto; /* 중앙 정렬 */
	margin-top: 30px; /* 위쪽 여백 설정 */
	background-color: rgb(255, 252, 248);; /* 배경색 설정 */
	color: rgb(0, 0, 0);
	border-radius: 10px; /* 모서리 둥글게 */
	padding: 10px; /* 패딩 설정 */
	width: 200px; /* 너비 설정 */
	height: 60px; /* 높이 설정 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	display: flex;
	align-items: center; /* display: flex; 를 써야 적용이 된다. */
	justify-content: center; /* display: flex; 를 써야 적용이 된다. */
	text-align: center;
	cursor: pointer; /* 마우스 커서가 버튼처럼 보이도록 설정 */
	border: 3px solid #ff5100e1; /* 테두리 색상 설정 */
	transition: background-color 0.3s, border-color 0.3s, color 0.3s; /* 전환 효과 추가 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

/* 마우스를 올렸을 때 효과 */
#profile:hover {
	background: #ff5100e1; /* 배경색 변경 */
	border-color: #ff5100e1; /* 테두리 색 변경 */
	color: #fff; /* 글자 색상 변경 */
}

/* 버튼을 클릭했을 때 효과 */
#profile:active {
	background: #ff5100e1; /* 배경색 */
	border-color: #fff; /* 테두리 색상 변경 */
	color: black; /* 글자 색상 변경 */
}

#sg_button {
	width: 120px;
	height: 50px;
	border-radius: 30px;
	cursor: pointer;
	font-size: 15px;
	margin-left: 380px;
	margin-top: 370px;
}


#sg_button {
	background: gray;
	border: 5px solid gray;
	color: rgb(255, 255, 255);
}

#sg_button:hover {
	background: red;
	border-color: red;
	color: #fff;
}

#sg_button:active {
	background: red;
	border-color: #fff;
}

.speech-container {
	opacity: 0; /* 처음에는 보이지 않도록 설정 */
	transition: opacity 0.5s ease-in-out; /* 애니메이션 효과 */
	position: absolute; /* 위치를 절대값으로 설정 */
	top: 0; /* 상단 위치 설정 */
	left: 0; /* 좌측 위치 설정 */
	width: 100%; /* 너비 설정 */
}

.image-container {
	position: relative; /* 부모 요소에 상대 위치 설정 */
}

.image-container:hover .speech-container {
	opacity: 1; /* 마우스를 올리면 보이도록 설정 */
}

.speech-bubble {
	display: flex;
	align-items: center; /* 콘텐츠를 세로로 가운데 정렬 */
	justify-content: center; /* 콘텐츠를 가로로 가운데 정렬 */
	text-align: center; /* 텍스트를 가운데 정렬 */
	margin: auto; /* 박스를 가로 방향으로 가운데 정렬 */
	margin-top: 160px; /* 박스 위쪽 여백 */
	border-radius: 50px; /* 모서리를 둥글게 */
	padding: 10px; /* 박스 안쪽 여백 */
	width: 230px; /* 박스 너비 */
	height: 300px; /* 박스 높이 */
	background-color: white; /* 배경색 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	border: 3px solid #ff5100e1; /* 오렌지 테두리 (3px 두께) */
	font-size: 24px; /* 텍스트 크기 설정 */
	font-weight: bold; /* 폰트 굵기를 볼드로 설정 */
}

.circle1 {
	margin: 0 auto; /* 중앙 정렬 */
	margin-top: 5px; /* 위쪽 여백 설정 */
	margin-left: 220px; /* 왼쪽 여백 설정 */
	width: 40px; /* 너비 설정 */
	height: 40px; /* 높이 설정 */
	background-color: #ff5100e1; /* 배경색 설정 */
	border-radius: 50%; /* 원형으로 만들기 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

.circle2 {
	margin: 0 auto; /* 중앙 정렬 */
	margin-top: 5px; /* 위쪽 여백 설정 */
	margin-left: 200px; /* 왼쪽 여백 설정 */
	width: 20px; /* 너비 설정 */
	height: 20px; /* 높이 설정 */
	background-color: #ff5100e1; /* 배경색 설정 */
	border-radius: 50%; /* 원형으로 만들기 */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

#image {
	margin-top: 580px; /* 위쪽 여백 설정 */
	margin-left: -63px; /* 왼쪽 여백 설정 */
	height: 300px;
	width: 400px;
}

.subContainer2 {
	display: flex; /* 플렉스 박스 설정 */
	width: 1250px; /* 너비 설정 */
	flex-direction: column; /* 세로 방향으로 정렬 */
/*	border-top: 2.5px solid #bfbfbf; /*박영호*/
/*	border-bottom: 2.5px solid #bfbfbf; /*박영호*/
}

.subContainer3 {
	height: 870px; /* 높이 설정 */
	position: relative; /* 상대 위치 설정 */
	background-color: #efefef ;
	flex: 1; /* 플렉스 비율 설정 */
	width: 250px; /* 너비 설정 */
    border-top: 5px solid #ff5100; /* 상단 테두리 */
    border-bottom: 5px solid #ff5100; /* 하단 테두리 */
    border-left: 5px solid #ff5100; /* 왼쪽 테두리 */
    border-right: 2px solid #cbcbcb; /* 오른쪽 테두리만 2px로 설정 */

    border-top-left-radius: 50px; /* 좌측 상단 모서리 둥글게 */
    border-bottom-left-radius: 50px; /* 좌측 하단 모서리 둥글게 */
    border-bottom-right-radius: 50px; /* 우측 하단 모서리 둥글게 */
    border-top-right-radius: 0; /* 우측 상단 모서리 둥글지 않게 */
    border-bottom-right-radius: 0; /* 우측 상단 모서리 둥글지 않게 */
}



.subContainer2-1 {
	/* flex: 0.3; /* 플렉스 비율 설정 */
	background-color: #ff7144; /* 배경색 설정 */
	height: 110px;
}

.subContainer2-2 {
	display: flex; /* 가로 정렬을 위해 flex 사용 */
	height: 700px; /* 높이 설정 */
	width: 100%;
}

.subContainer2-2-left {
	flex: 4; /* 왼쪽 영역의 비율을 4로 설정 */
	overflow-y: hidden; /* 세로 스크롤 활성화 */
	overflow-x: hidden; /* 가로 스크롤 제거 */
	background-color: rgb(255, 255, 255); /* 배경색 설정 */
	padding: 20px; /* 여백 설정 */
	box-sizing: border-box; /* 테두리와 패딩을 포함한 크기 계산 */
	width: 100%; /* 부모 요소에 맞게 가로 너비 설정 */
	position: relative; /* 상대 위치 설정으로 자식 요소 위치 제어 */
	height: 100%; /* 부모 요소에 맞게 높이 설정 */
	border: 5px solid #ff5100e1;
	border-top-right-radius: 50px;
	border-left:none;
	border-bottom:none;
	margin-left: -4px;
}

.subContainer2-2-right {
	flex: 6; /* 오른쪽 영역의 비율을 6으로 설정 */
	overflow-x: hidden; /* 세로 스크롤 활성화 */
	overflow-y: hidden; /* 세로 스크롤 활성화 */
	background-color: rgb(255, 255, 255); /* 배경색 설정 */
	padding: 20px; /* 여백 설정 */
	display: flex; /* 수직 및 수평 중앙 정렬을 위해 flex 사용 */
	justify-content: center;
	align-items: center;
	border-top: 5px solid #ff5100e1;
}

.subContainer2-5 {
	display: flex; /* 가로 정렬을 위해 flex 사용 */
	height: 200px; /* 높이 설정 */
	align-items: center; /* 수직 가운데 정렬 */
	background-color: #efefef ;
	border: 5px solid #ff5100e1;
	border-bottom-right-radius: 50px;
	border-left:none;
	border-top: 2px solid #cbcbcb;
}

.subContainer2-5-left {
	flex: 6; /* 왼쪽 영역의 비율을 6으로 설정 */
	background-color: rgb(255, 255, 255); /* 배경색 설정 */
	height: 100%; /* 부모의 높이를 모두 차지하게 설정 */
	display: flex; /* 플렉스 박스 사용 */
	justify-content: center; /* 가로 방향 중앙 정렬 */
	align-items: center; /* 수직 방향 중앙 정렬 */
	padding: 0; /* 내부 패딩 제거 */
	margin: 0; /* 외부 여백 제거 */
	gap: 0; /* 요소 간의 간격 제거 */
	width: calc(100% - 4px); /* 부모 요소와 맞추기 위해 너비 조정 */
	box-sizing: border-box; /* 테두리와 패딩 포함하여 크기 계산 */
}

.subContainer2-5-right {
	flex: 4; /* 오른쪽 영역의 비율을 4로 설정 */
	display: flex; /* 수직 및 수평 중앙 정렬을 위해 flex 사용 */
	justify-content: center; /* 수평 가운데 정렬 */
	align-items: center; /* 수직 가운데 정렬 */
	padding: 0; /* 내부 패딩 제거 */
	margin: 0; /* 외부 여백 제거 */
	background-color: rgb(255, 255, 255); /* 배경색 설정 */
	height: 100%; /* 부모의 높이를 모두 차지하게 설정 */
}

/*--------------------- Container3 버튼 설정 ------------------- */
.subContainer3 button {
	display: inline-block;
	font-weight: bold;
}

#btn1, #btn2, #btn3, #btn4 {
	background: #fff;
	border: 5px solid gray;
	color: black;
}

#btn5 {
	background: #bfbfbf;
	border: 5px solid gray;
	color: black;
}

#btn1:hover, #btn2:hover, #btn3:hover, #btn4:hover {
	background: #ff5100e1;
	border-color: #ff5100e1;
	color: #fff;
}

#btn1:active, #btn2:active, #btn3:active, #btn4:active, #btn5:active {
	background: #ff5100e1;
	border-color: #fff;
}

#btn1 {
	/*margin-top: 30px; /* 위쪽 여백 설정 */
	height: 80px; /* 높이 설정 */
	width: 180px; /* 너비 설정 */
	font-size: 20px; /* 글자 크기 설정 */
}

#btn2 {
	margin-top: 20px; /* 위쪽 여백 설정 */
	height: 80px; /* 높이 설정 */
	width: 180px; /* 너비 설정 */
	font-size: 20px; /* 글자 크기 설정 */
}

#btn3 {
	margin-top: 20px; /* 위쪽 여백 설정 */
	height: 80px; /* 높이 설정 */
	width: 180px; /* 너비 설정 */
	font-size: 20px; /* 글자 크기 설정 */
}

#btn4 {
	margin-top: 20px; /* 위쪽 여백 설정 */
	height: 80px; /* 높이 설정 */
	width: 180px; /* 너비 설정 */
	font-size: 20px; /* 글자 크기 설정 */
}

#btn5 {
	/* margin-top: 10px; */
	height: 80px; /* 높이 설정 */
	width: 180px; /* 너비 설정 */
	font-size: 20px; /* 글자 크기 설정 */
}

#btn3_h {
	background: #fff;
	border-top: 5px solid gray;
	border-left: 5px solid gray;
	border-bottom: 5px solid gray;
	color: gray;
}

#btn4_h {
	background: #fff;
	border-top: 5px solid gray;
	border-right: 5px solid gray;
	border-bottom: 5px solid gray;
	color: gray;
}

#btn3_h:hover, #btn4_h:hover {
	background: #ff5100e1;
	border-color: #ff5100e1;
	color: #fff;
}

#btn3_h:active, #btn4_h:active {
	background: #ff5100e1;
	border: 5px solid gray;
}

#btn1_h, #btn2_h {
	background: white; /* 배경색 흰색 */
	border: 5px solid #fff; /* 테두리 흰색 */
	color: black; /* 글씨 색 검정색 */
}

#btn1_h:hover, #btn2_h:hover {
	background: #ff5100e1; /* 배경색 흰색 */
	border-color: #ff5100e1; /* 테두리 흰색 */
	color: black; /* 글씨 색 검정색으로 유지 */
}

#btn1_h:active, #btn2_h:active {
	background: #ff5100e1;
	border: 5px solid white;
}

/* .subContainer2-1{
/* border-top-left-radius: 20px; /* 좌측 상단 모서리 둥글게 */
/* border-top-right-radius: 20px; 우측 상단 모서리 둥글게 }*/

/* .subContainer2-5 {
border-bottom-left-radius: 20px; /* 좌측 하단 모서리 둥글게 */
/* border-bottom-right-radius: 20px; /* 우측 하단 모서리 둥글게} */
#btn1_h, #btn2_h {
	height: 80px; /* 높이 설정 */
	width: 255px; /* 너비 설정 */
	font-size: 30px; /* 글자 크기 설정 */
}

#btn3_h, #btn4_h {
	height: 100px; /* 높이 설정 */
	width: 200px; /* 너비 설정 */
	font-size: 50px; /* 글자 크기 설정 */
}

#btn3_h {
	margin-left: 55px;
}

#btn4_h {
	margin-left: -10px;
}

#btn1_h {
	margin-left: 225px; /* 왼쪽 여백 설정 */
	border-radius: 50px;
	border: 5px solid #efefef;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); /* 부드러운 그림자 추가 */
}

#btn2_h {
	margin-left: 400px; /* 왼쪽 여백 설정 */
	margin-right: 0px; /* 오른쪽 여백 설정 */
	border-radius: 50px;
	border: 5px solid #efefef;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); /* 부드러운 그림자 추가 */
}

/*.subContainer2-5 .button1,*/
#btn3_h {
	border-top-left-radius: 30px;
	border-bottom-left-radius: 30px;
	cursor: pointer;
}

/*.subContainer2-5 .button2, */
#btn4_h {
	border-top-right-radius: 30px;
	border-bottom-right-radius: 30px;
	cursor: pointer;
}

.user_profile {
	height: 60px; /* 높이 설정 */
	width: 200px; /* 너비 설정 */
	font-size: 18px; /* 글자 크기 설정 */
	background-color: rgb(255, 252, 248);
	border-radius: 10px; /* 모서리 둥글게 */
	font-weight: bold; /* 폰트 굵기를 볼드로 설정 */
}

.user_profile:hover {
	background: #ff5100e1; /* 배경색 변경 */
	border-color: #ff5100e1; /* 테두리 색 변경 */
	color: #fff; /* 글자 색상 변경 */
}

/* 버튼을 클릭했을 때 효과 */
.user_profile:active {
	background: #ff5100e1; /* 배경색 */
	border-color: #fff; /* 테두리 색상 변경 */
	color: black; /* 글자 색상 변경 */
}

#imageimage {
	max-height: 500px; /* 부모 요소의 높이에 맞춤 */
	width: auto; /* 비율 유지 */
	border: 10px solid white; /* 테두리 색상과 두께 설정 */
	border-radius: 15px; /* 둥근 모서리 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); /* 부드러운 그림자 추가 */	
	padding: 5px; /* 이미지와 테두리 사이에 여백 추가 */
	
}

.subContainer3-1 {
	height: 450px;
}

.subContainer3-2 {
	height: 200px;
	margin-top: 80px;
}

#textarea {
    border: 4px solid white;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5); /* 부드러운 그림자 추가 */
}

.container {
   display: flex; /* 플렉스 박스 설정 */
   position: relative; /* 귀의 절대 위치 조정을 위해 상대 위치 설정 */
}

.container::before, .container::after {
   content: "";
   margin-top: 20px;
   position: absolute;
   top: -130px; /* 귀의 상단 위치 조정 */
   width: 130px;
   height: 400px;
   background: linear-gradient(to bottom, #ffffff, #ffffff);
   border-radius: 120px 120px 0 0; /* 상단만 둥글게 */
   z-index: -1; /* 귀를 뒤로 보내기 */
   border: 60px solid #ff5100e1; /* 테두리 색상과 두께 설정 */
}

.container::before {
   left: 400px; /* 왼쪽 귀 위치 */
}

.container::after {
   right: 400px; /* 오른쪽 귀 위치 */
}
