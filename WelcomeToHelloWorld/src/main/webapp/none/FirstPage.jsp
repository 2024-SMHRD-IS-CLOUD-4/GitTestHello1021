<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Responsive GSAP Slider</title>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css'>
    <style>
        body {
            overflow: hidden;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .section-container-main {
            width: 100vw;
            overflow: hidden;
            position: relative;
        }
        .section-container {
            width: 200vw;
            display: flex;
            transition: all ease-in-out 0.5s;
            position: relative;
            left: 0;
        }
        .section {
            min-width: 100vw;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }
        .section:nth-child(1) {
            background-color: #ffb2b2;
        }
        .section:nth-child(2) {
            background-color: #c1bff2;
        }
        button {
            position: fixed;
            top: 70px;
            z-index: 99;
            border-radius: 50%;
            height: 80px;
            width: 80px;
            background-color: #ffffff;
            border: none;
            font-size: 40px;
            color: #ec4458;
            transition: all ease-in-out 0.3s;
            cursor: pointer;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
            animation: pulse 2s infinite;
        }
        button:active {
            transform: translateY(-50%) scale(0.95);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.7);
        }
        #prevButton {
            left: 30px;
            display: none;
        }
        #nextButton {
            right: 40px;
        }
        .login-form {
            background: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            height: 250px;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-right: 680px;
        }
        .login-form input {
            display: block;
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .login-form button {
            width: 100px;
            height: 40px;
            background-color: #ec4458;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: transform 0.3s ease-in-out;
        }
        .login-form button:hover {
            transform: scale(1.1);
        }
        .section-title {
            margin-top: -780px;
            margin-left: 450px;
            font-size: 30px;
            font-weight: bold;
            color: white;
        }
        .section-title2 {
            margin-top: -790px;
            margin-right: 360px;
            font-size: 30px;
            font-weight: bold;
            color: white;
        }
        .img {
            position: absolute;
            height: 700px;
            width: auto;
            top: 300px; 
            left: 350px;
        }
        .tooltip1 {
            position: absolute;
            top: 30px;
            left: 680px;
            transform: translateX(-50%);
            background: rgba(255, 255, 255, 0.8);
            padding: 10px;
            border-radius: 50%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            font-size: 30px;
            color: #333;
            display: none;
            font-weight: bold;
            height: 340px;
            width: 500px;
            opacity: 0;
            transform: translateY(-20px);
            transition: opacity 0.5s ease, transform 0.5s ease;
            text-align: center;
        }
        .tail1, .tail2 {
            position: absolute;
            border-radius: 50%;
            background-color: rgb(255, 255, 255, 0.8);
            opacity: 0;
            transform: translateY(-20px);
            transition: opacity 0.5s ease, transform 0.5s ease;
        }
        .tail1 {
            top: 400px;
            left: 720px;
            width: 5px;
            height: 45px;
        }
        .tail2 {
            top: 330px;
            left: 700px;
            width: 20px;
            height: 60px;
        }
        @keyframes pulse {
            0%, 100% {
                transform: translateY(-50%) scale(1);
            }
            50% {
                transform: translateY(-50%) scale(1.1);
            }
        }
    </style>
</head>
<body>
<div>
    <button id="prevButton" class="wave"><i class="fa-solid fa-chevron-left"></i></button>
    <button id="nextButton" class="wave"><i class="fa-solid fa-chevron-right"></i></button>
</div>
<div class="section-container-main">
    <div class="section-container">
        <section class="section" id="section1">
            <a href="MainPage.jsp"><img class="img" src="pping.png"></a>
            <div class="tooltip1"><br><br><br>안녕하세요? 헬로핑이예요!!<br>저를 눌리면 손님페이지로 이동해요😀😀😀</div>
            <div class="tail1"></div>
            <div class="tail2"></div>
            <div class="section-title">활동가 페이지 이동</div>
        </section>
        <section class="section" id="section2">
            <div class="section-title2">손님 페이지 이동</div>
            <div class="login-form">
                <h2>Login</h2>
                <input type="text" placeholder="Username" required>
                <input type="password" placeholder="Password" required>
                <button type="submit">Login</button>
                <a href="join.jsp" style="margin-top: 80px; color: #9c9c9c;">Forgot Password?</a>
            </div>
        </section>
    </div>
</div>
<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js'></script>
<script>
    const sections = document.querySelectorAll(".section");
    const prevButton = document.getElementById("prevButton");
    const nextButton = document.getElementById("nextButton");
    const sectionContainer = document.querySelector(".section-container");
    const tooltip = document.querySelector(".tooltip1");

    let currentPosition = 0;
    let currentIndex = 0;

    gsap.from(".img", {
        scale: 0.5,
        opacity: 0,
        duration: 1,
        onComplete: () => {
            gsap.to(".tail1", { opacity: 1, transform: "translateY(0)", duration: 0.5, delay: 0.2 });
            gsap.to(".tail2", { opacity: 1, transform: "translateY(0)", duration: 0.5, delay: 0.4 });
            gsap.to(tooltip, { opacity: 1, transform: "translateY(0)", duration: 0.5, delay: 0.6 });
        }
    });

    tooltip.style.display = "none"; // 초기 상태: 숨김
    gsap.to(tooltip, { display: "block", duration: 0 }); // 애니메이션 시작 전에 표시

    function goToNextSlide() {
        if (currentIndex < sections.length - 1) {
            currentPosition -= 100;
            sectionContainer.style.left = `${currentPosition}%`;
            gsap.fromTo(sections[currentIndex + 1], { opacity: 0 }, { opacity: 1, duration: 1 });
            gsap.from(".img", {
                scale: 0.5,
                opacity: 0,
                duration: 1,
                onComplete: () => {
                    tooltip.style.display = "block"; // 애니메이션 완료 후 말풍선 표시
                }
            });
            currentIndex++;
            updateButtons();
        }
    }

    function goToPrevSlide() {
        if (currentIndex > 0) {
            currentPosition += 100;
            sectionContainer.style.left = `${currentPosition}%`;
            gsap.fromTo(sections[currentIndex - 1], { opacity: 0 }, { opacity: 1, duration: 1 });
            gsap.from(".img", {
                scale: 0.5,
                opacity: 0,
                duration: 1,
                onComplete: () => {
                    tooltip.style.display = "block"; // 애니메이션 완료 후 말풍선 표시
                }
            });
            currentIndex--;
            updateButtons();
        }
    }

    function updateButtons() {
        nextButton.style.display = currentIndex === sections.length - 1 ? "none" : "block";
        prevButton.style.display = currentIndex === 0 ? "none" : "block";
    }

    nextButton.addEventListener("click", goToNextSlide);
    prevButton.addEventListener("click", goToPrevSlide);

    document.addEventListener("keydown", (event) => {
        if (event.key === "ArrowRight") {
            goToNextSlide();
        } else if (event.key === "ArrowLeft") {
            goToPrevSlide();
        }
    });
</script>
</body>
</html>
