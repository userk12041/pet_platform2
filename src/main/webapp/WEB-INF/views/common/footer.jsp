<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<style>
footer {
    background-color: #111;
    color: white;
    padding: 40px 60px;
    font-family: 'Noto Sans KR', sans-serif;
}

.footer-info {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    line-height: 1.7;
}

.footer-left, .footer-center, .footer-right {
    flex: 1;
    min-width: 250px;
    padding: 10px 20px;
}

.footer-left h1,
.footer-center h1,
.footer-right h1 {
    font-size: 20px;
    color: #5bd3ff;
    margin-bottom: 10px;
}
</style>
