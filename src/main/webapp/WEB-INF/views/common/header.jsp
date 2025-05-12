<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
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
</style>

<div class="header-wrapper">
    <a href="${pageContext.request.contextPath}/main" class="logo-text">마이펫 메디컬센터</a>
    <div class="nav-menu">
        <a href="${pageContext.request.contextPath}/mypage_info">마이페이지</a>
        <a href="${pageContext.request.contextPath}/reservation">예약 확인</a>
        <a href="${pageContext.request.contextPath}/logout">로그아웃</a>
        <a href="${pageContext.request.contextPath}/announce">고객센터</a>
        <a href="${pageContext.request.contextPath}/faq">FAQ</a>
    </div>
</div>
