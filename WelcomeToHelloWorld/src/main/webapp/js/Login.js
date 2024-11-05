

function resetClass(element, classname) {
            element.classList.remove(classname);
        }
        document.getElementsByClassName("show-nosign")[0].addEventListener("click", function () {
            let form = document.getElementsByClassName("form")[0];
            resetClass(form, "signup");
            resetClass(form, "signin");
            form.classList.add("nosign");
            document.getElementById("submit-btn").innerText = "바로 입장하기!";
        });
        document.getElementsByClassName("show-signup")[0].addEventListener("click", function () {
            let form = document.getElementsByClassName("form")[0];
            resetClass(form, "signin");
            resetClass(form, "nosign");
            form.classList.add("signup");
            document.getElementById("submit-btn").innerText = "계정 생성하기!";
        });
        document.getElementsByClassName("show-signin")[0].addEventListener("click", function () {
            let form = document.getElementsByClassName("form")[0];
            resetClass(form, "signup");
            resetClass(form, "nosign");
            form.classList.add("signin");
            document.getElementById("submit-btn").innerText = "로그인하기!";
        });

        document.getElementsByClassName("show-nosign")[0].click();

        const gosite = () => {
            let buttonText = document.getElementById("submit-btn").innerText
            let form = document.getElementById("myForm");
            
            if (buttonText === "바로 입장하기!") {
                form.action = "notLoginController1"
                form.submit();
            } else if(buttonText === "계정 생성하기!"){
            	form.action = "JoinController1"
				form.submit();
            } else if(buttonText === "로그인하기!"){
            	form.action = "LoginController1"
    				form.submit();
        }
        }
        document.getElementById("submit-btn").addEventListener("click", gosite);
        
        window.onload = function() {
        	const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.has('Success')) {
                // 팝업 띄우기
                setTimeout(() => {
                    alert('회원가입성공!');
                }, 100); // 100ms 후에 알림창 표시
            }
        };
//====================================================================================
	function passConfirm() {
			var password1 = document.getElementById('pw');
			var password2 = document.getElementById('pwCheck');
			var confirmMsg = document.getElementById('confirmMsg');
			var correctColor = "blue";
			var wrongColor = "red";

			if (password1.value === password2.value) {
				confirmMsg.style.color = correctColor;
				confirmMsg.innerHTML = " * 비밀번호가 일치합니다.";
			} else {
				confirmMsg.style.color = wrongColor;
				confirmMsg.innerHTML = " * 비밀번호가 일치하지 않습니다.";
			}
		}

		// 사용자가 password1 또는 password2 입력란에서 타이핑을 마치면 passConfirm() 호출
		function passCheck() {
			document.getElementById('pw').addEventListener('blur', passConfirm);
			document.getElementById('pwCheck').addEventListener('blur',
					passConfirm);

			document
					.getElementById('pw')
					.addEventListener(
							'input',
							function() {
								var password = this.value;
								var strengthText = '';
								var strengthColor = 'red';
								if (password.length >= 5) {
									strengthText = ' * 약함';
									if (/[a-zA-Z]/.test(password)
											&& /[0-9]/.test(password)) {
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

//=============================================================================================





































