<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no"> <!-- shrink-to-fit 추가 -->
    <title>모바일 홈페이지</title>
    <style>
        @font-face {
            font-family: 'KCC-Hanbit';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2403-2@1.0/KCC-Hanbit.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
            font-display: swap;
        }

        body {
            display: flex;
            flex-direction: column;
            justify-content: center; /* 세로 중앙 정렬 */
            align-items: center; /* 가로 중앙 정렬 */
            min-height: 100vh;
            margin: 0;
            padding: 0;
            font-family: 'KCC-Hanbit', 'Apple SD Gothic Neo', 'Noto Sans KR', sans-serif; /* KCC-Hanbit 적용 */
            background-color: #f4f4f4;
            overflow-x: hidden; /* 수평 스크롤 방지 */
        }
        
        .main-content {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%; /* 폭을 100%로 설정 */
            max-width: 1200px;
            padding: 0 10px; /* 좌우 패딩 추가 */
        }
        
        h1 {
            font-size: 2.2rem;
            color: #333;
            margin: 0 0 40px 0; /* 하단 여백 추가 */
            text-align: center;
        }
        
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            gap: 80px;
            margin-bottom: 40px; /* 하단 h1과의 간격 */
        }
        
        .content {
            flex-basis: calc(50% - 40px);
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            height: 600px;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 3rem; /* 기존 1.5rem에서 2배로 증가 */
            font-weight: bold;
            transition: transform 0.3s ease;
            cursor: pointer;
        }

        .content:hover {
            transform: scale(1.05); /* 마우스 오버 시 5% 확대 */
        }

        .content-left {
            background-color: #febd98;
            color: white;
        }

        .content-right {
            background-color: #014167;
            color: white;
        }

        .footer-text {
            font-size: 1rem;
            color: #666;
            text-align: center;
            max-width: 80%;
            line-height: 1.4;
        }

        @media screen and (max-width: 992px) {
            .container {
                flex-direction: column;
                gap: 30px;
            }
            
            .content {
                width: 80%;
                max-width: 400px;
            }
        }

        @media screen and (max-width: 480px) {
            .main-content {
                width: 95%;
            }
            
            .content {
                width: 90%;
                height: 450px;
                font-size: 2rem; /* 모바일에서도 글자 크기 조정 */
            }
            
            h1 {
                font-size: 1.8rem;
                margin-bottom: 30px;
            }

            .footer-text {
                font-size: 0.9rem;
            }
        }

        .large-title {
            font-size: 4.4rem;
            text-align: center; /* 중앙 정렬 */
        }

        .large-title span {
            display: inline-block;
            opacity: 0;
        }

        .large-title span.fly-in {
            animation: flyIn 1s forwards;
        }

        .large-title span.jump {
            animation: flyIn 1s forwards, jumpHello 3s ease-in-out infinite 1s;
        }

        @keyframes flyIn {
            from {
                transform: translate(var(--flyX), var(--flyY));
                opacity: 0;
            }
            to {
                transform: translate(0, 0);
                opacity: 1;
            }
        }

        @keyframes jumpHello {
            0%, 100% { transform: translateY(0); }
            10% { transform: translateY(-20px); }
            30% { transform: translateY(0); }
            70% { transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="main-content">
        <h1 class="large-title">
            <span>반갑습니다!!😀</span><br>
            <span class="jump">헬로월드</span>
            <span>에 오신 것을 환영합니다!!!</span>
        </h1>
        <div class="container">
            <div class="content content-left" onclick="location.href='Guest.html';">
                손님
            </div>
            <div class="content content-right" onclick="location.href='activist.html';">
                활동가
            </div>
        </div>
        <h1 class="footer-text">This platform was created on October 16, 2024, by Welcome to Hello World.</h1>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const words = document.querySelectorAll('.large-title span');
            words.forEach((word, index) => {
                const flyX = (Math.random() - 0.5) * 200 + 'px';
                const flyY = (Math.random() - 0.5) * 200 + 'px';
                word.style.setProperty('--flyX', flyX);
                word.style.setProperty('--flyY', flyY);
                setTimeout(() => {
                    if (word.classList.contains('jump')) {
                        word.classList.add('jump');
                    } else {
                        word.classList.add('fly-in');
                    }
                }, index * 200);
            });
        });
    </script>
</body>
</html>