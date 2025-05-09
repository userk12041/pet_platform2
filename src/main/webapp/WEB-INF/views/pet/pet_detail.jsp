<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>펫 상세 정보</title>
    <style>
        body {
            margin: 0;
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f7f9fb;
        }

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

        h2 {
            text-align: center;
            color: #5bd3ff;
            margin: 50px 0 30px;
        }

        .detail-container {
            max-width: 800px;
            margin: auto;
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #dff6ff;
            color: #333;
            width: 25%;
        }

        img {
            max-width: 200px;
            max-height: 200px;
            border-radius: 10px;
        }

        .btn-wrapper {
            text-align: center;
            margin-top: 30px;
        }

        .btn-common {
            display: inline-block;
            color: white;
            padding: 10px 25px;
            margin: 0 10px;
            border: none;
            border-radius: 20px;
            font-size: 15px;
            text-decoration: none;
            cursor: pointer;
        }

        .btn-blue {
            background-color: #5bd3ff;
        }
        .btn-blue:hover {
            background-color: #28abfc;
        }

        .btn-red {
            background-color: #ff4d4d;
        }
        .btn-red:hover {
            background-color: #cc0000;
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

<h2>펫 상세 정보</h2>

<div class="detail-container">
    <table>
        <tr>
            <th>이름</th>
            <td>${pet.name}</td>
        </tr>
        <tr>
            <th>성별</th>
            <td>${pet.gender}</td>
        </tr>
        <tr>
            <th>종류</th>
            <td>${pet.type}</td>
        </tr>
        <tr>
            <th>나이</th>
            <td>${pet.age}</td>
        </tr>
        <tr>
            <th>설명</th>
            <td>${pet.description}</td>
        </tr>
    </table>

    <div class="btn-wrapper">
        <a href="${pageContext.request.contextPath}/pet/update/${pet.id}" class="btn-common btn-blue">수정하기</a>
        <a href="${pageContext.request.contextPath}/mypage_info" class="btn-common btn-blue">목록으로</a>
        <form action="${pageContext.request.contextPath}/pet/delete/${pet.id}" method="post" style="display: inline;">
            <input type="submit" value="삭제하기" onclick="return confirm('정말 삭제하시겠습니까?');" class="btn-common btn-red">
        </form>
    </div>
</div>

</body>
</html>
