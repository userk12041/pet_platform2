<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>진료 기록 작성</title>
    <style>
        #container {
            display: flex;
            min-height: 100vh;
        }
        #sidebar {
            width: 200px;
            background-color: #f0f0f0;
            padding: 15px;
        }
        #sidebar a {
            display: block;
            padding: 8px 0;
            font-weight: bold;
            color: #333;
            text-decoration: none;
        }
        #sidebar a:hover {
            color: #007bff;
        }
        #content {
            flex-grow: 1;
            padding: 20px;
        }
        form {
            max-width: 600px;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input, textarea {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
        }
        button {
            margin-top: 20px;
            padding: 10px 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div id="container">
    <!-- 사이드바 -->
    <div id="sidebar">
        <h3>관리자 메뉴</h3>
        <ul style="list-style: none; padding-left: 0;">
            <li><a href="${pageContext.request.contextPath}/main">메인화면으로</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/user/list">유저 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/reservationList">예약 관리</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/medical/list">진료 관리</a></li>
        </ul>
    </div>

    <!-- 콘텐츠 -->
    <div id="content">
        <h2>진료 기록 작성</h2>
        <form action="${pageContext.request.contextPath}/admin/medical/write" method="post">
            <label for="pet_name">펫 이름</label>
            <input type="text" name="pet_name" required />

            <label for="treatment_date">진료일자</label>
            <input type="date" name="treatment_date" required />

            <label for="doctor_id">담당 수의사 ID</label>
            <input type="text" name="doctor_id" />

            <label for="content">진료 내용</label>
            <textarea name="content" rows="3"></textarea>

            <label for="prescription">처방</label>
            <textarea name="prescription" rows="2"></textarea>

            <label for="notes">특이사항</label>
            <textarea name="notes" rows="2"></textarea>

            <label for="user_id">펫 주인 (유저 ID)</label>
            <input type="text" name="user_id" required />

            <button type="submit">등록</button>
        </form>
    </div>
</div>
</body>
</html>
