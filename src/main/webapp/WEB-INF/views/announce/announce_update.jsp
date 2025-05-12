<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 수정</title>
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
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #6ee9ef;
            border-radius: 10px;
            background-color: #fff;
            margin-bottom: 20px;
            font-size: 15px;
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
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007acc;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="form-wrapper">
    <h2>공지사항 수정</h2>
    <form action="${pageContext.request.contextPath}/announce_update" method="post">
        <input type="hidden" name="id" value="${announce.id}" />
        <input type="hidden" name="user_id" value="${sessionScope.id}" />

        <label>제목</label>
        <input type="text" name="title" value="${announce.title}" required>

        <label>내용</label>
        <textarea name="content" rows="4" required>${announce.content}</textarea>

        <input type="submit" value="수정 완료">
    </form>

    <a href="${pageContext.request.contextPath}/announce_admin" class="back-link">← 목록으로</a>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
