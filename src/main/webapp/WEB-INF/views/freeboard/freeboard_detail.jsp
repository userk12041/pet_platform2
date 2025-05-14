<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세보기</title>
    <style>
		body {
		    font-family: 'Noto Sans KR', sans-serif;
		    background-color: #f9f9f9;
		    margin: 0;
		    padding: 0;
		}

		.notice-wrapper {
		    max-width: 800px;
		    margin: 80px auto;
		    padding: 30px;
		    background-color: #fff;
		    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
		    border-radius: 10px;
		}

		.notice-title {
		    font-size: 28px;
		    font-weight: bold;
		    color: #222;
		    margin-bottom: 15px;
		    line-height: 1.4;
		}

		.notice-meta {
		    font-size: 13px;
		    color: #888;
		    border-top: 1px solid #ddd;
		    border-bottom: 1px solid #eee;
		    padding: 10px 0;
		    margin-bottom: 25px;
		}

		.notice-content {
		    font-size: 16px;
		    color: #333;
		    line-height: 1.8;
		    white-space: pre-line;
		    margin-bottom: 40px;
		}

		.update-admin {
		    text-align: right;
		    margin-bottom: 40px;
		}

		.update-admin a {
		    font-size: 14px;
		    color: #007acc;
		    text-decoration: none;
		    margin-left: 15px;
		}

		.update-admin a:hover {
		    text-decoration: underline;
		}

		/* 댓글 영역 */
		.comment-box {
		    background-color: #f4f6f8;
		    border: 1px solid #ddd;
		    border-radius: 8px;
		    padding: 12px 15px;
		    margin-bottom: 15px;
		}

		.comment-box p {
		    margin: 4px 0;
		    font-size: 14px;
		    color: #333;
		}

		.comment-box strong {
		    color: #007acc;
		}

		.comment-box a {
		    display: inline-block;
		    margin-top: 5px;
		    font-size: 12px;
		    color: #d9534f;
		    text-decoration: none;
		}

		.comment-box a:hover {
		    text-decoration: underline;
		}

		/* 댓글 작성 폼 */
		form {
		    margin-top: 30px;
		    border-top: 1px solid #eee;
		    padding-top: 20px;
		}

		textarea[name="content"] {
		    width: 100%;
		    padding: 10px;
		    font-size: 14px;
		    border: 1px solid #ccc;
		    border-radius: 6px;
		    resize: vertical;
		    box-sizing: border-box;
		}

		input[type="submit"] {
		    margin-top: 10px;
		    padding: 8px 16px;
		    font-size: 14px;
		    background-color: #007acc;
		    color: #fff;
		    border: none;
		    border-radius: 6px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}

		input[type="submit"]:hover {
		    background-color: #005f99;
		}

		.back-btn {
		    margin-top: 40px;
		    text-align: right;
		}

		.back-btn a {
		    font-size: 14px;
		    color: #007acc;
		    text-decoration: none;
		}

		.back-btn a:hover {
		    text-decoration: underline;
		}

    </style>
</head>
<body>

<div class="notice-wrapper">
    <!-- 제목 -->
    <div class="notice-title">${freeboard.title}</div>

    <!-- 작성일 등 메타 -->
    <div class="notice-meta">
        작성일: <fmt:formatDate value="${freeboard.created_at}" pattern="yyyy.MM.dd HH:mm"/>
    </div>

    <!-- 내용 -->
    <div class="notice-content">
        ${freeboard.content}
    </div>
	<div class="update-admin">
	    <a href="${pageContext.request.contextPath}/freeboard_delete?id=${freeboard.id}"
		onclick="return confirm('정말 삭제하시겠습니까?');">삭제하기</a>
	</div>
	<!-- 댓글 리스트 -->
	<c:forEach var="comment" items="${CommentList}">
	    <div class="comment-box">
	        <p><Strong>${comment.user_id}</Strong> - ${comment.created_at}</p>
	        <p>${comment.content}</p>
	        <a href="${pageContext.request.contextPath}/comment/delete?id=${comment.id}&boardId=${freeboard.id}">삭제</a>
	    </div>
	</c:forEach>

	<!-- 댓글 작성 폼 -->
	<form action="${pageContext.request.contextPath}/comment/write" method="post">
	    <input type="hidden" name="boardId" value="${freeboard.id}" />
	    <textarea name="content" rows="3" placeholder="댓글을 작성하세요"></textarea>
	    <input type="submit" value="댓글 작성">
	</form>

	


    <!-- 목록으로 -->
    <div class="back-btn">
        <a href="${pageContext.request.contextPath}/freeboard">← 목록으로 돌아가기</a>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
