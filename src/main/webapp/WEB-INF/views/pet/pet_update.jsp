<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>펫 정보 수정</title>
    <style>
        body {
            margin: 0;
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f7f9fb;
        }

        .form-wrapper {
            max-width: 600px;
            margin: 60px auto;
            background-color: white;
            padding: 40px;
            border-radius: 14px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            font-size: 26px;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #6ee9ef;
            border-radius: 10px;
            background-color: #fff;
            margin-bottom: 20px;
            font-size: 15px;
        }

        .radio-group {
            margin-bottom: 20px;
        }

        input[type="radio"] {
            margin-right: 6px;
        }

        input[type="submit"] {
            width: 100%;
            background-color: #5bd3ff;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #28abfc;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
            display: block;
            color: #5bd3ff;
            font-size: 14px;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="form-wrapper">
    <h2>펫 정보 수정</h2>
    <form action="${pageContext.request.contextPath}/pet/update" method="post">
        <input type="hidden" name="id" value="${pet.id}">

        <label>이름</label>
        <input type="text" name="name" value="${pet.name}" required>

        <label>성별</label>
        <div class="radio-group">
            <input type="radio" name="gender" value="수컷" ${pet.gender == '수컷' ? 'checked' : ''}> 수컷
            <input type="radio" name="gender" value="암컷" ${pet.gender == '암컷' ? 'checked' : ''}> 암컷
        </div>

        <label>종류</label>
        <input type="text" name="type" value="${pet.type}">

        <label>나이</label>
        <input type="number" name="age" value="${pet.age}">

        <label>설명</label>
        <textarea name="description" rows="4">${pet.description}</textarea>

        <input type="submit" value="수정">
    </form>

    <a href="${pageContext.request.contextPath}/pet/detail/${pet.id}" class="back-link">← 상세보기로 돌아가기</a>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
