<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<meta charset="UTF-8">
    <title>펫 정보 수정</title>
    <style>
       body {
            background: linear-gradient(to right, #ffffff, #dff6ff, #ffffff);
            font-family: 'Noto Sans KR', sans-serif;
            padding: 50px;
        }

        h2 {
            text-align: center;
            color: #5bd3ff;
            margin-bottom: 20px;
        }

        form {
            width: 450px;
            margin: auto;
            background-color: #eef6f9;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 6px 12px rgba(0,0,0,0.1);
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #6ee9ef;
            border-radius: 12px;
            background-color: #fff;
            margin-bottom: 20px;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        input[type="submit"] {
            background-color: #5bd3ff;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #28abfc;
        }

        a {
            text-align: center;
            display: block;
            margin-top: 15px;
            text-decoration: none;
            color: #5bd3ff;
        }
    </style>
<body>
<h2>펫 정보 수정</h2>

<form action="${pageContext.request.contextPath}/pet/update" method="post">

    <input type="hidden" name="id" value="${pet.id}">
    이름: <input type="text" name="name" value="${pet.name}" required><br>
    성별:
    <input type="radio" name="gender" value="수컷" ${pet.gender == '수컷' ? 'checked' : ''}> 수컷
    <input type="radio" name="gender" value="암컷" ${pet.gender == '암컷' ? 'checked' : ''}> 암컷<br>
    종류: <input type="text" name="type" value="${pet.type}"><br>
    나이: <input type="number" name="age" value="${pet.age}"><br>
    설명: <textarea name="description">${pet.description}</textarea><br>
    <input type="submit" value="수정">
</form>

<a href="${pageContext.request.contextPath}/pet/detail/${pet.id}"> 뒤로가기</a>
</body>
</html>
