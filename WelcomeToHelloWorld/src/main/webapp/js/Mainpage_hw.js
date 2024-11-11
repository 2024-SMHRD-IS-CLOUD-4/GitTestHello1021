document.addEventListener('DOMContentLoaded', function() {
	const speechContainer = document.querySelector('.speech-container');
	const speechBubble = document.querySelector('.speech-bubble');

	// 버튼별 설명 텍스트 저장 (객체 형태로 관리)
	  const buttonTexts = {
	    subContainer1:"안녕하세요 !  <br><br> 궁금한 것이 있으면 <br><br> 저를 찾아주세요!❤",
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
	    image:"안녕하세요 !  <br><br> 궁금한 것이 있으면 <br><br> 저를 찾아주세요!❤",
	    search:"검색 버튼 !!",
	    success:"비밀번호를 <br> 정확하게 입력하시면 <br> 프로필 수정을 <br> 완료합니다!",
	    curiousButton:"이 사진에 대해 <br><br> 궁금하시다면 <br><br> 제가 직접<br><br> 찾아드릴게요!",
		mainPage_img:"게시물 사진",
		targetPost:"게시글",
		emojiPopup:"표정을 <br><br> 선택하세요!"
	 

	    // ... 다른 버튼들에 대한 설명 추가
	  };

	// 처음에 "안녕하세요" 표시
	speechBubble.innerHTML ="안녕하세요 !  <br><br> 궁금한 것이 있으면 <br><br> 저를 찾아주세요!❤";
	speechContainer.style.opacity = 1;

	// 각 항목에 마우스 올리면 설명 표시 (줄바꿈 처리 추가)
	const items = document.querySelectorAll('#emojiPopup, #curiousButton, #targetPost, #mainPage_img, #subContainer1, #profile, .image-container, #sg_button, #btn1, #btn2, #btn3, #btn4, #btn5, #btn1_h, #btn2_h, #btn3_h, #btn4_h, .profile');
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

document.addEventListener('DOMContentLoaded', function() {
    const emojiButton = document.getElementById('btn1_h');
    const emojiPopup = document.getElementById('emojiPopup');

    // 버튼 클릭 시 이모티콘 팝업을 보여주거나 숨김
    emojiButton.addEventListener('click', function() {
        if (emojiPopup.style.display === 'none' || emojiPopup.style.display === '') {
            emojiPopup.style.display = 'flex';
        } else {
            emojiPopup.style.display = 'none';
        }
    });

	 // 이모티콘 팝업을 클릭하면 팝업을 숨김
	    emojiPopup.addEventListener('click', function() {
	        emojiPopup.style.display = 'none';
	    });

	    // 페이지 어디든 클릭하면 이모티콘 창 닫기 (단, 이모티콘 버튼과 팝업을 제외하고)
	    document.addEventListener('click', function(event) {
	        if (!emojiButton.contains(event.target) && !emojiPopup.contains(event.target)) {
	            emojiPopup.style.display = 'none';
	        }
	    });
	});



// 이모티콘 클릭 횟수 저장 객체
let emojiCounts = {
    "😍": 0,
    "😄": 0,
    "😥": 0,
    "😴": 0,
    "🤬": 0
};


// 한 명당 하나의 이모티콘만 클릭할 수 있도록 사용자 클릭 여부를 저장하는 변수
let currentUserEmoji = null;

function addReaction(button) {
    const emoji = button.innerText;

    // 사용자가 이미 이모티콘을 누른 경우
    if (currentUserEmoji) {
        // 동일한 이모티콘을 클릭하면 클릭 취소
        if (currentUserEmoji === emoji) {
            emojiCounts[emoji]--;
            currentUserEmoji = null;
        } else {
            // 다른 이모티콘을 클릭하면 이전 이모티콘의 클릭을 취소하고 새로운 이모티콘 클릭 처리
            emojiCounts[currentUserEmoji]--;
            emojiCounts[emoji]++;
            currentUserEmoji = emoji;
        }
    } else {
        // 처음으로 이모티콘을 클릭한 경우
        emojiCounts[emoji]++;
        currentUserEmoji = emoji;
    }

    // reactionContainer에 이모티콘과 개수를 표시
    updateReactionDisplay();
}

function updateReactionDisplay() {
    const reactionContainer = document.getElementById('curiousButton1');
    reactionContainer.innerHTML = ''; // 이전 내용 초기화

    // 😍, 😄, 😥, 😴, 🤬 순서대로 이모티콘과 개수를 표시
    const emojiOrder = ["😍", "😄", "😥", "😴", "🤬"];
    let selectedCount = 0; // 선택된 이모티콘 개수 초기화

    emojiOrder.forEach(emoji => {
        if (emojiCounts[emoji] > 0) {
            const reactionItem = document.createElement('div');
            reactionItem.classList.add('reaction');
            reactionItem.innerHTML = `
                <span class="small-emoji">${emoji}</span>
                <span class="emoji-count">${emojiCounts[emoji]}</span>
            `;
            reactionContainer.appendChild(reactionItem);
            selectedCount++; // 선택된 이모티콘 개수 증가
        }
    });

    // 이모티콘이 클릭되었으면 curiousButton1을 보이게 하고, 그렇지 않으면 숨긴다.
    if (selectedCount > 0) {
        reactionContainer.style.display = 'inline-flex';
        reactionContainer.style.width = `${selectedCount * 70}px`; // 선택된 이모티콘 개수에 따라 너비 설정
    } else {
        reactionContainer.style.display = 'none';
    }
}

const modalOpenButton = document.getElementById('modalOpenButton');
const modalCloseButton = document.getElementById('modalCloseButton');
const modal = document.getElementById('modalContainer');

modalOpenButton.addEventListener('click', () => {
  modal.classList.remove('hidden');
});

modalCloseButton.addEventListener('click', () => {
  modal.classList.add('hidden');
});

// 모달 창 열기 함수 (궁금해요 버튼 클릭 시 호출)
function showCuriousModal() {
    const modal = document.getElementById("curiousModal");
    modal.style.display = "block";
}

// 모달 창 닫기 함수
function closeCuriousModal() {
    const modal = document.getElementById("curiousModal");
    modal.style.display = "none";
}

// 모달 창 외부 클릭 시 닫기 기능 추가
window.onclick = function(event) {
    const modal = document.getElementById("curiousModal");
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

