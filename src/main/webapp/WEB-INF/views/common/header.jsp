<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.header-wrapper {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    padding: 0 20px;
		background-color: white;
	}

	.header-logo,
	.header-menu,
	.header-user {
	    display: flex;
	    list-style: none;
	    margin-right: 10px;
	}

	.header-user {
	    justify-content: flex-end;
	}

	.header-menu {
	    justify-content: center;
	}

	.header-logo {
	    justify-content: flex-start;
	}

	.header-li {
	    padding: 0px 20px;
	    border-right: 1px solid #0000001a;
	    font-size: 14px;
	    cursor: pointer;
	}

	.header-li a {
	    text-decoration: none;
	    color: black;
	}

	.logo-li {
	    display: flex;
	    align-items: center;
	    border-right: none;
	    gap: 10px;
	}

	.logo-img {
	    width: 35px;
	    height: 35px;
	    border-radius: 50%;
	}

	.logo-text {
	    font-size: 20px;
	    font-weight: bold;
	    color: #2c3e50;
	}
</style>

    <div class="header-wrapper">
        <%
            String id = (String)session.getAttribute("id");
            if(id != null && !id.equals("")) {
        %>
        <ul class="header-logo">
            <li class="header-li logo-li" onclick="location.href='${pageContext.request.contextPath}/main'">
                <img src="${pageContext.request.contextPath}/resources/icons/logo.jpg" class="logo-img" alt="로고">
                <span class="logo-text">마이펫 메디컬센터</span>
            </li>
        </ul>
        <ul class="header-user">
            <li class="header-li" onclick="location.href='${pageContext.request.contextPath}/mypage_info'">마이페이지</li>
            <li class="header-li" onclick="location.href='${pageContext.request.contextPath}/reservation'">예약 확인</li>
            <% if("admin".equals(id)) { %>
                <li class="header-li" onclick="location.href='${pageContext.request.contextPath}/admin/user/list'">관리자 페이지</li>
            <% } %>
            <li class="header-li" onclick="location.href='${pageContext.request.contextPath}/logout'">로그아웃</li>
            <li class="header-li" onclick="location.href='${pageContext.request.contextPath}/announce'">고객센터</li>
            <li class="header-li" onclick="location.href='${pageContext.request.contextPath}/faq'">FAQ</li>
            <li class="header-li" onclick="location.href='${pageContext.request.contextPath}/freeboard'">자유게시판</li>
        </ul>
        <% } else { %>
        <ul class="header-logo">
            <li class="header-li logo-li" onclick="location.href='${pageContext.request.contextPath}/main'">
                <img src="${pageContext.request.contextPath}/resources/icons/logo.jpg" class="logo-img" alt="로고">
                <span class="logo-text">마이펫 메디컬센터</span>
            </li>
        </ul>
        <ul class="header-user">
            <li class="header-li" onclick="alert('로그인이 필요합니다.')">마이페이지</li>
            <li class="header-li" onclick="alert('로그인이 필요합니다.')">예약 확인</li>
            <li class="header-li" onclick="location.href='${pageContext.request.contextPath}/login'">로그인</li>
            <li class="header-li" onclick="location.href='${pageContext.request.contextPath}/register'">회원가입</li>
            <li class="header-li" onclick="alert('로그인이 필요합니다.')">고객센터</li>
            <li class="header-li" onclick="location.href='${pageContext.request.contextPath}/faq'">FAQ</li>
            <li class="header-li" onclick="location.href='${pageContext.request.contextPath}/freeboard'">자유게시판</li>
        </ul>
        <% } %>
    </div>
