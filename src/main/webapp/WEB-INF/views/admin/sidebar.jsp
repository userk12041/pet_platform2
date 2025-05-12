<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    #sidebar {
        width: 150px;
        min-width: 150px;
        max-width: 150px;
        background-color: #f0f0f0;
        padding: 15px;
        box-sizing: border-box;
    }

    ul.menu {
        list-style: none;
        padding-left: 0;
        margin: 0;
    }

    .menu-item {
        position: relative;
    }

    .menu-item > a {
        display: block;
        font-weight: bold;
        color: #333;
        padding: 8px 0;
        text-decoration: none;
    }

    .menu-item > a:hover {
        color: #007bff;
    }

    .submenu {
        list-style: none;
        padding-left: 10px;
        margin-top: 0;
        display: none;
    }

    .menu-item:hover .submenu {
        display: block;
    }

    .sub-link {
        display: block;
        padding: 4px 0;
        font-size: 0.9em;
        color: #333;
        text-decoration: none;
        margin-left: 5px;
    }

    .sub-link:hover {
        color: #007bff;
    }
</style>

<div id="sidebar">
    <h3>관리자 메뉴</h3>
    <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/main">메인화면으로</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/user/list">유저 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/medical/list">진료 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/announce/announce_admin">게시판 관리</a></li>
        <li class="menu-item">
            <a href="javascript:void(0);">예약 관리</a>
            <ul class="submenu">
                <li><a class="sub-link" href="${pageContext.request.contextPath}/admin/reservation/medical">진료 예약 관리</a></li>
                <li><a class="sub-link" href="${pageContext.request.contextPath}/admin/reservation/beauty">미용 예약 관리</a></li>
            </ul>
        </li>
    </ul>
</div>
