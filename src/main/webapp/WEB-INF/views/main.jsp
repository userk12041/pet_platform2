<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이펫 메디컬센터</title>
    <style>
@font-face {
            font-family: Noto Sans KR2;
            src: url(NotoSansKR-Regular.ttf);
}

body {
   margin: 0 auto;
}

.header-wrapper {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
}

.header-logo {
   display: flex;
    list-style: none;
    justify-content: start;
    margin-right: 10px;
}
.header-menu {
   display: flex;
    list-style: none;
    justify-content:center;
    margin-right: 10px;
}
.header-user {
   display: flex;
    list-style: none;
    justify-content: end;
    margin-right: 10px;
}

.header-li a {
    text-decoration: none;
   color: black;
}

.header-li {
    padding: 0px 20px;
    border-right: 1px solid #0000001a;
    font-size: 14px;
   cursor: pointer;
}

.logo-text {
    font-size: 20px;
    font-weight: bold;
   color: #2c3e50;
}

.main-banner {
    text-align: center;
    padding: 50px 20px;
   background-color: #eef6f9;
}

.main-banner h1 {
    font-size: 36px;
   margin-bottom: 10px;
}

.main-banner h2 {
   font-size: 20px;
   color: #333;
        }

video {
   width: 80%;
   border-radius: 20px;
   margin-top: 30px;
   box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

      
.section-title {
   text-align: center;
   font-size: 30px;
      font-weight: 700;
    margin-top: 80px;
    margin-bottom: 30px;
    color: #2c3e50;
    position: relative;
}

.section-title::after {
    content: "";
    display: block;
    width: 60px;
    height: 4px;
    background-color: #3498db;
    margin: 10px auto 0;
    border-radius: 2px;
}

.service-section {
    display: flex;
    justify-content: center;
    gap: 30px;
    padding: 40px 20px;
    background: linear-gradient(to bottom right, #f9f9f9, #eef6f9);
    flex-wrap: wrap;
}

.service-box {
    background-color: white;
    border-radius: 15px;
    padding: 20px;
    width: 280px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    transition: transform 0.3s, box-shadow 0.3s;
}

.service-box img {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-radius: 10px;
    margin-bottom: 15px;
}

.service-box:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
}
.service-box p {
    font-size: 17px;
    font-weight: 600;
    color: #34495e;
}
.service-box-doctor {
    background-color: white;
    border-radius: 15px;
    padding: 20px;
    width: 200px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    transition: transform 0.3s, box-shadow 0.3s;
}
.service-box-doctor img {
    width: 100%;
    height: 250px;
    object-fit: cover;
    border-radius: 10px;
    margin-bottom: 15px;
}
.service-box-doctor p {
	text-align:center;
    font-size: 17px;
    font-weight: 600;
    color: #34495e;
}


        footer {
            display: flex;
            flex-direction: column;
            margin-top: 50px;
            padding-bottom: 50px;
            background-color: black;
            color: white;
        }

        .footer-info {
            /* text-align: center; */
            display: flex;
            justify-content: space-between;            
            margin-top: 30px;
            margin-bottom: 60px;
            line-height: 1.6;
        }
		.footer-left,
		.footer-center,
		.footer-right {
		    flex: 1;
		    padding: 0 20px;
		}
		.footer-center{
		display: flex;
		justify-content: space-between; 
		}
		.footer-center-left,
		.footer-center-right{
		flex: 1;
		}

        .copyright {
            font-family: Noto Sans KR2;
            margin: 0px 19%;
            color: #6e6e73;
            line-height: 13px;
            font-size: 12px;
            padding: 40px 0px;
            text-align: center;
        }

        /* 플로팅 아이콘 */
        .floating-icons {
            position: fixed;
            bottom: 30px;
            right: 30px;
            display: flex;
            flex-direction: column;
            gap: 15px;
            z-index: 999;
        }

        .floating-icons a img {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            transition: transform 0.2s ease-in-out;
        }

        .floating-icons a img:hover {
            transform: scale(1.1);
        }
        .logo-li {
          display: flex;
          align-items: center;
        border-right: none; /* 오른쪽 선 제거 */
          gap: 10px;
      }

.logo-img {
    width: 35px;
    height: 35px;
    border-radius: 50%;
}
        
    </style>
</head>
<body>

<header>
   <div class="header-wrapper">
       <%
           String id = (String)session.getAttribute("id");
           if(id != null && !id.equals("")) { %>
       <ul class="header-logo">
          <li class="header-li logo-li" onclick="location.href='main'">
             <img src="resources/icons/logo.jpg" class="logo-img" alt="로고">
           <span class="logo-text">마이펫 메디컬센터</span>
          </li>
       </ul>
       <ul class="header-user">
          <li class="header-li" onclick="location.href='mypage_info'">마이페이지</li>
          <li class="header-li" onclick="location.href='reservation'">예약 확인</li>
          <% if("admin".equals(id)) { %>
              <li class="header-li" onclick="location.href='admin/user/list'">관리자 페이지</li>
          <% } %>
          <li class="header-li" onclick="location.href='logout'">로그아웃</li>
          <li class="header-li" onclick="location.href='announce'">고객센터</li>
          <li class="header-li" onclick="location.href='faq'">FAQ</li>
      </ul>                
           <% } else { %>
       <ul class="header-logo">
           <li class="header-li logo-li" onclick="location.href='main'">
              <img src="resources/icons/logo.jpg" class="logo-img" alt="로고">
            <span class="logo-text">마이펫 메디컬센터</span>
           </li>
      </ul>
      <ul class="header-user">
           <li class="header-li" onclick="alert('로그인이 필요합니다.')">마이페이지</li>
           <li class="header-li" onclick="alert('로그인이 필요합니다.')">예약 확인</li>
           <li class="header-li" onclick="location.href='login'">로그인</li>
           <li class="header-li" onclick="location.href='register'">회원가입</li>
           <li class="header-li" onclick="alert('로그인이 필요합니다.')">고객센터</li>
		   <li class="header-li" onclick="location.href='faq'">FAQ</li>
           <% } %>
       </ul>
    </div>
</header>

<div class="main-banner">
    <h1>Beyond Care, Beyond Trust</h1>
    <h2>한 차원 높은 반려동물 의료 서비스</h2>
    <video src="resources/video/index.mp4" autoplay muted loop></video>
</div>


<p class="section-title">병원 소개</p>
<div class="service-section">
	<div class="service-section-hospital-img">
		<img src="resources/image/hospital1.jpg" alt="병원소개">
	</div>
	<p style="text-align: center">
		<strong>‘선택과 집중’을 선택한 동물병원</strong><br>
		규모가 크고 여러 질환에 대한 다양한 분과 진료를 하는 동물병원을 찾는 것은 이제 그리 어렵지 않습니다.
		하지만, 전문화된 특정 분야에만 집중하는 동물병원을 만든다는 것은 생각보다 많은 고민과 자신감이 필요했습니다.
		오아시스 정형외과 신경외과 동물병원은 정형외과 및 신경외과 전문 동물병원으로 관절, 척추, 골절, 중증외상 및 신경계질환 등에 대한 진단 및 치료, 고난도 수술, 재활치료에 특화된 동물병원입니다.
	</p>
	<p style="text-align: center">
		<strong >수의학박사, 최고의 전문의료진</strong><br>
		오아시스는 대학병원과 2차동물병원에서 오랫동안 근무하며 수의외과학 박사 과정을 마치고 해외에서 수련해 온 전문의료진들로 구성되어 있습니다. 정형외과 및 신경외과에 특화된 최첨단 장비를 갖추고,
		기존에 어렵다고 인식되던 인공관절 수술부터, 뇌종양 수술 등 고난도 수술과 정확한 진단, 재활치료에 이르기까지 정형외과,
		신경외과 질환에 있어서 최상의 치료를 추구합니다.
	</p>
</div>
<p class="section-title">의료기기</p>
<div class="service-section">
    <div class="service-box">
        <img src="resources/image/machine01.jpg" alt="의료기기1">
        <p>NFR Phion</p>
    </div>
    <div class="service-box">
        <img src="resources/image/machine02.jpg" alt="의료기기2">
        <p>Arthrex Synergy UHD4</p>
    </div>
    <div class="service-box">
        <img src="resources/image/machine03.jpg" alt="의료기기3">
        <p>fluoroscopy GEMSS KMC650</p>
    </div>
    <div class="service-box">
        <img src="resources/image/machine04.png" alt="의료기기4">
        <p>Medtronic StealthStation S8</p>
    </div>
    <div class="service-box">
        <img src="resources/image/machine05.png" alt="의료기기5">
        <p>Canon Aplio 300 Platinum Ultrasound Machine</p>
    </div>
    <div class="service-box">
        <img src="resources/image/machine06.png" alt="의료기기6">
        <p>Storz Medical MASTERPULS</p>
    </div>
    <div class="service-box">
        <img src="resources/image/machine07.png" alt="의료기기7">
        <p>Canon Vantage Elan 1.5T</p>
    </div>
    <div class="service-box">
        <img src="resources/image/machine08.jpg" alt="의료기기8">
        <p>Synthes Air Pen Drive</p>
    </div>
</div>
<p class="section-title">의료진</p>
<div class="service-section">
    <div class="service-box-doctor">
        <img src="resources/image/doctor1.png" alt="의료진1">
        <p><strong>원장</strong></p>
        <p>김재훈</p>
    </div>
    <div class="service-box-doctor">
        <img src="resources/image/doctor2.png" alt="의료진2">
        <p><strong>원장</strong></p>
        <p>박기현</p>
    </div>
    <div class="service-box-doctor">
        <img src="resources/image/doctor3.png" alt="의료진3">
        <p><strong>원장</strong></p>
        <p>이승빈</p>
    </div>
    <div class="service-box-doctor">
        <img src="resources/image/doctor4.png" alt="의료진4">
        <p><strong>원장</strong></p>
        <p>이선진</p>
    </div>
    <div class="service-box-doctor">
        <img src="resources/image/doctor5.png" alt="의료진5">
        <p><strong>원장</strong></p>
        <p>김용철</p>
    </div>
</div>



<p class="section-title">서비스 소개</p>
<div class="service-section">
    <div class="service-box">
        <img src="resources/image/cat.jpg" alt="고양이 진료센터">
        <p>고양이 진료센터</p>
    </div>
    <div class="service-box">
        <img src="resources/image/treatment.png" alt="특화 진료센터">
        <p>특화 진료센터</p>
    </div>
    <div class="service-box">
        <img src="resources/image/case.png" alt="치료 사례">
        <p>치료 사례</p>
    </div>
</div>

<!-- 플로팅 아이콘 -->
<div class="floating-icons">
    <a href="https://blog.naver.com/tjswls0147" target="_blank" title="공식 블로그">
        <img src="resources/icons/blog.jpg" alt="블로그">
    </a>
    <a href="https://open.kakao.com/o/swHi11ph" target="_blank" title="카톡 상담">
        <img src="resources/icons/kakao.jpg" alt="카카오톡">
    </a>
    <a href="https://www.instagram.com/sj__lee01/" target="_blank" title="인스타그램">
        <img src="resources/icons/instagram.jpg" alt="인스타그램">
    </a>
    <a href="https://map.naver.com/p/search/%EC%82%BC%EB%B9%84%EB%B9%8C%EB%94%A9/place/16777247?placePath=?entry=pll&from=nx&fromNxList=true&searchType=place&c=15.00,0,0,0,dh" title="위치 안내">
        <img src="resources/icons/map.jpg" alt="지도">
    </a>
</div>

<footer>
    <div class="footer-info">
    	<div class="footer-left">
	        <h1 style="margin-top: -1px;">마이펫 메디컬센터</h1>
	        <p>대표자명 : 이선진 </p>
	        <p>고객센터 : 010-7750-8444</p>
	        <p>이메일 : tjswls0147@naver.com</p>
	        <p>주소 : 부산광역시 연제구 경보</p>
	        <p>Copyright © 2024 마이펫 메디컬센터. All rights reserved.</p>
        </div>
    	<div class="footer-center">
    		<div class="footer-center-left">
		        <h1 style="margin-top: -1px;">진료시간</h1>
		        <p><strong>월~금</strong></p>
		        <p>AM 09:00 ~ PM 19:00</p>
		        <p><strong>토~일</strong></p>
		        <p>AM 09:00 ~ PM 18:00</p>
		        <p><strong>점심시간</strong></p>
		        <p>PM 12:30 ~ PM 14:00</p>
	        </div>
        </div>
    	<div class="footer-right">
	        <h1 style="margin-top: -1px;">오시는길</h1>
	        <p>주소: 부산 부산진구 중앙대로 627 삼비빌딩 2F,12F</p>
	        <p>🚌 버스 : 범내골역 정류장</p>
	        <p>🚇지하철 : 지하철1호선 범내골역 7번 출구 70m<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        			1, 2호선 서면역 1번 출구 700m</p>
        </div>
    </div>
</footer>
<script>
    let currentIndex = 0;

    function moveSlide(direction) {
        const slider = document.getElementById("slider");
        const slides = document.querySelectorAll(".slide");
        const totalSlides = slides.length;

        currentIndex += direction;

        if (currentIndex < 0) currentIndex = totalSlides - 1;
        if (currentIndex >= totalSlides) currentIndex = 0;

        slider.style.transform = `translateX(-${currentIndex * 100}%)`;
    }
</script>

</body>
</html>
