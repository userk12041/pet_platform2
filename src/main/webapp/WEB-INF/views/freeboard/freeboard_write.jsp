<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>자유게시판 작성</title>
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

        input[type="submit"],
        input[type="reset"] {
            width: 48%;
            background-color: #5bd3ff;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 25px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #28abfc;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
        }
    </style>
</head>
<body>

	<div class="form-wrapper">
	    <h2>자유게시판 등록</h2>
	    <form action="${pageContext.request.contextPath}/freeboard_write" method="post">
	        <input type="hidden" name="user_id" value="${sessionScope.id}" />

	        <label>제목</label>
	        <input type="text" name="title" required>

	        <label>내용</label>
	        <textarea name="content" rows="4" placeholder="공지사항을 작성해주세요"></textarea>

	        <input type="submit" value="등록하기">
	    </form>

	    <a href="${pageContext.request.contextPath}/freeboard" class="back-link">← 목록으로 돌아가기</a>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</body>
	</html>

