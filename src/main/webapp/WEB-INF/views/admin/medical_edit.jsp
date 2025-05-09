<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
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
        }
        input, textarea {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
        }
        input[readonly] {
            background-color: #e9ecef;
        }
        button {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
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
        <h2>진료 기록 수정</h2>
        <form method="post" action="${pageContext.request.contextPath}/admin/medical/update">
            <input type="hidden" name="id" value="${medical.id}" />
            
            <label>펫 이름</label>
            <input type="text" name="pet_name" value="${medical.pet_name}" required />

            <label>진료일자</label>
            <input type="date" name="treatment_date" value="${medical.treatment_date}" readonly />

            <label>담당 수의사 ID</label>
            <input type="text" name="doctor_id" value="${medical.doctor_id}" />

            <label>진료내용</label>
            <textarea name="content" rows="3">${medical.content}</textarea>

            <label>처방</label>
            <textarea name="prescription" rows="3">${medical.prescription}</textarea>

            <label>특이사항</label>
            <textarea name="notes" rows="3">${medical.notes}</textarea>

            <label>유저 ID</label>
            <input type="text" name="user_id" value="${medical.user_id}" readonly />

            <label>작성일자</label>
            <input type="text" value="${medical.created_at}" readonly />

            <button type="submit">수정 완료</button>
        </form>
    </div>
</div>
</body>
</html>
