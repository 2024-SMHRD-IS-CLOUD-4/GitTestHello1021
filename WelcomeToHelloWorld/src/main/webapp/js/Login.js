// 클래스 제거 함수
function resetClass(element, classname) {
	element.classList.remove(classname);
}

// 각 버튼 클릭 시 클래스 및 텍스트 변경
function setupFormSwitch() {
	document.getElementsByClassName("show-nosign")[0].addEventListener("click", function() {
		let form = document.getElementsByClassName("form")[0];
		resetClass(form, "signup");
		resetClass(form, "signin");
		form.classList.add("nosign");
		document.getElementById("submit-btn").innerText = "바로 입장하기!";
	});

	document.getElementsByClassName("show-signup")[0].addEventListener("click", function() {
		let form = document.getElementsByClassName("form")[0];
		resetClass(form, "signin");
		resetClass(form, "nosign");
		form.classList.add("signup");
		document.getElementById("submit-btn").innerText = "계정 생성하기!";
	});

	document.getElementsByClassName("show-signin")[0].addEventListener("click", function() {
		let form = document.getElementsByClassName("form")[0];
		resetClass(form, "signup");
		resetClass(form, "nosign");
		form.classList.add("signin");
		document.getElementById("submit-btn").innerText = "로그인하기!";
	});

	// 기본 상태로 설정
	document.getElementsByClassName("show-nosign")[0].click();
}

// 폼 제출 함수
const gosite = (event) => {
	let buttonText = document.getElementById("submit-btn").innerText;
	let form = document.getElementById("myForm");

	if (buttonText === "바로 입장하기!") {
		form.action = "notLoginController1";
		form.submit();
	} else if (buttonText === "계정 생성하기!") {
		let passConfirmed = passConfirm();
		let strengthConfirmed = checkPasswordStrength();

		if (passConfirmed && strengthConfirmed) { // 비밀번호 확인 및 강도 체크 후 제출
			form.action = "JoinController1";
			form.submit();
		} else {
			event.preventDefault(); // 폼 제출 중단
			let alertMessage = "";
			if (!passConfirmed) {
				alertMessage += "비밀번호가 일치하지 않습니다.\n";
			}
			if (!strengthConfirmed) {
				alertMessage += "비밀번호 강도가 충분하지 않습니다. '보통' 이상이어야 합니다.\n";
			}
			alert(alertMessage.trim());
		}
	} else if (buttonText === "로그인하기!") {
		form.action = "LoginController1";
		form.submit();
	}
};

// 페이지 로드 시 메시지 표시
window.onload = function() {
	const urlParams = new URLSearchParams(window.location.search);
	if (urlParams.has('Success')) {
		setTimeout(() => {
			alert('회원가입성공!');
		}, 100);
	}
};

// 비밀번호 확인 함수
function passConfirm() {
	var password1 = document.getElementById('pw');
	var password2 = document.getElementById('pwCheck');
	var confirmMsg = document.getElementById('confirmMsg');
	var correctColor = "blue";
	var wrongColor = "red";

	if (password1.value === password2.value) {
		confirmMsg.style.color = correctColor;
		confirmMsg.innerHTML = " * 비밀번호가 일치합니다.";
		return true;
	} else {
		confirmMsg.style.color = wrongColor;
		confirmMsg.innerHTML = " * 비밀번호가 일치하지 않습니다.";
		return false;
	}
}

// 비밀번호 강도 확인 함수
function checkPasswordStrength() {
	var strengthText = document.getElementById('passwordStrength').textContent;
	return strengthText.includes('보통') || strengthText.includes('강함'); // 비밀번호가 "보통" 또는 "강함" 이상이어야 함
}

// 비밀번호 강도 체크 및 입력 이벤트 설정
function passCheck() {
	document.getElementById('pw').addEventListener('blur', passConfirm);
	document.getElementById('pwCheck').addEventListener('blur', passConfirm);

	document.getElementById('pw').addEventListener('input', function() {
		var password = this.value;
		var strengthText = '';
		var strengthColor = 'red';
		if (password.length >= 5) {
			strengthText = ' * 약함';
			if (/[a-zA-Z]/.test(password) && /[0-9]/.test(password)) {
				strengthText = ' * 보통';
				strengthColor = 'green';
				if (/[^a-zA-Z0-9]/.test(password)) {
					strengthText = ' * 강함';
					strengthColor = 'blue';
				}
			}
		} else {
			strengthText = '너무 짧음';
		}
		document.getElementById('passwordStrength').textContent = strengthText;
		document.getElementById('passwordStrength').style.color = strengthColor;
	});
}
function getQueryParameter(param) {
	const urlParams = new URLSearchParams(window.location.search);
	return urlParams.get(param);
}

// 'message' 파라미터가 'updateSuccess'인 경우 알림 표시
document.addEventListener('DOMContentLoaded', function() {
    console.log('DOMContentLoaded 이벤트 실행됨');
    const message = getQueryParameter('message');
    console.log('Message parameter:', message);
    if (message === 'updateSuccess') {
        alert('회원정보가 수정이 완료되었습니다. 다시 로그인하세요.');
    }
});

// 이벤트 리스너 등록
setupFormSwitch();
document.getElementById("submit-btn").addEventListener("click", gosite);
passCheck();
