<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
body {
    margin: 0;
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f7f9fb;
}

/* ===== 헤더 ===== */
.header-wrapper {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: white;
    padding: 15px 40px;
    border-bottom: 1px solid #e0e0e0;
    position: sticky;
    top: 0;
    z-index: 999;
}

.logo-text {
    font-size: 20px;
    font-weight: bold;
    color: #2c3e50;
    text-decoration: none;
}

.nav-menu {
    display: flex;
    gap: 25px;
}

.nav-menu a {
    font-size: 14px;
    text-decoration: none;
    color: #333;
    font-weight: 500;
}

.nav-menu a:hover {
    color: #5bd3ff;
}

/* ===== 본문 ===== */
.container {
    display: flex;
    max-width: 1200px;
    margin: 50px auto;
    gap: 30px;
}

.left-panel {
    width: 280px;
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.05);
}

.left-panel h2 {
    font-size: 20px;
    color: #333;
    margin-bottom: 20px;
    border-bottom: 1px solid #ccc;
    padding-bottom: 10px;
}

.left-panel p {
    margin: 8px 0;
    font-size: 14px;
    color: #555;
}

.right-panel {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.section {
    background: white;
    border-radius: 10px;
    padding: 25px;
    box-shadow: 0 4px 8px rgba(0,0,0,0.05);
}

.section h3 {
    font-size: 18px;
    color: #222;
    margin-bottom: 10px;
}

.section .desc {
    font-size: 14px;
    color: #666;
    margin-bottom: 15px;
}

.section table {
    width: 100%;
    border-collapse: collapse;
}

.section th, .section td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #eee;
}

.section th {
    background: #f1f9ff;
    color: #333;
}

.section .btn {
    float: right;
    padding: 6px 12px;
    font-size: 13px;
    border: none;
    background: #5bd3ff;
    color: white;
    border-radius: 5px;
    cursor: pointer;
    text-decoration: none;
}
.left-panel {
    width: 340px; /* 기존 280px → 증가 */
    background: white;
    padding: 40px; /* 여백도 조금 증가 */
    border-radius: 12px;
    box-shadow: 0 6px 12px rgba(0,0,0,0.08);
}

.container {
    display: flex;
    max-width: 1400px; /* 기존 1200px → 더 넓게 */
    margin: 60px auto;
    gap: 50px; /* 패널 사이 간격도 키움 */
}

.left-panel {
    width: 400px; /* 기존 340px → 더 크게 */
    background: white;
    padding: 50px;
    border-radius: 14px;
    box-shadow: 0 8px 16px rgba(0,0,0,0.1);
}

.left-panel h2 {
    font-size: 24px;
    color: #222;
    margin-bottom: 25px;
    border-bottom: 2px solid #ccc;
    padding-bottom: 12px;
}

.left-panel p {
    margin: 14px 0;
    font-size: 17px;
    color: #333;
}

.right-panel {
    flex: 1;
    display: flex;
    flex-direction: column;
    gap: 30px;
}

.section {
    background: white;
    border-radius: 14px;
    padding: 40px;
    box-shadow: 0 8px 16px rgba(0,0,0,0.1);
}

.section h3 {
    font-size: 22px;
    color: #111;
    margin-bottom: 15px;
}

.section .desc {
    font-size: 16px;
    color: #555;
    margin-bottom: 20px;
}

.section table th,
.section table td {
    padding: 16px 12px;
    font-size: 16px;
}

.section .btn {
    float: right;
    padding: 10px 16px;
    font-size: 15px;
    background: #5bd3ff;
    color: white;
    border-radius: 6px;
}


</style>
</head>
<body>

<!-- ✅ 헤더 시작 -->
<div class="header-wrapper">
    <a href="${pageContext.request.contextPath}/main" class="logo-text">마이펫 메디컬센터</a>
    <div class="nav-menu">
        <a href="${pageContext.request.contextPath}/mypage_info">마이페이지</a>
        <a href="${pageContext.request.contextPath}/reservation">예약 확인</a>
        <a href="${pageContext.request.contextPath}/logout">로그아웃</a>
        <a href="${pageContext.request.contextPath}/support">고객센터</a>
    </div>
</div>
<!-- ✅ 헤더 끝 -->

<div class="container">
    <div class="left-panel">
        <h2>내소개</h2>
        <p><strong>아이디:</strong> ${my_info.user_id}</p>
		<p><strong>이름:</strong> ${my_info.user_name}</p>
		<p><strong>전화번호:</strong> ${my_info.phone_number}</p>
		<p><strong>이메일:</strong> ${my_info.email}</p>
		<p><strong>닉네임:</strong> ${my_info.nickname}</p>
		<p><strong>주소:</strong> ${my_info.address}</p>
		<a href="${pageContext.request.contextPath}/user_info_modify" class="btn" style="display:block; bargin-top:20px; text-align:center;">내 정보 수정</a>
    </div>
    <div class="right-panel">
        <div class="section">
            <h3>펫 목록</h3>
            <div class="desc">등록된 펫 정보를 확인할 수 있습니다.</div>
            <table>
                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>성별</th>
                    <th>종류</th>
                    <th>나이</th>
                    <th>상세보기</th>
                </tr>
                <c:forEach var="pet" items="${pets}" varStatus="status">
                    <tr>
                        <td>${status.count}</td>
                        <td>${pet.name}</td>
                        <td>${pet.gender}</td>
                        <td>${pet.type}</td>
                        <td>${pet.age}</td>
                        <td>
							<a href="${pageContext.request.contextPath}/pet/pet_beauty/${pet.id}" class="btn" style="margin-left: 5px;">미용예약</a>
							<a href="${pageContext.request.contextPath}/pet/detail/${pet.id}" class="btn">보기</a>
						</td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <a href="${pageContext.request.contextPath}/pet/register" class="btn">+ 펫 등록하기</a>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>
