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
            background-color: #fff;
            margin: 0;
            padding: 0;
        }

        .notice-wrapper {
            max-width: 800px;
            margin: 80px auto;
            padding: 0 20px 60px;
            border-bottom: 1px solid #eee;
        }

        .notice-title {
            font-size: 28px;
            font-weight: bold;
            color: #222;
            margin-bottom: 10px;
            line-height: 1.4;
        }

        .notice-meta {
            font-size: 13px;
            color: #777;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #eee;
            padding: 12px 0;
            margin-bottom: 30px;
        }

        .notice-content {
            font-size: 16px;
            color: #333;
            line-height: 1.9;
			height: 30%;
            white-space: pre-line;
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
		.update-admin {
		    margin-top: 20px;
		    text-align: right;
		}

		.update-admin a {
		    font-size: 14px;
		    color: #007acc;
		    text-decoration: none;
		}

		.update-admin a:hover {
		    text-decoration: underline;
		}
    </style>
</head>
<body>

<div class="notice-wrapper">
    <!-- 제목 -->
    <div class="notice-title">${announce.title}</div>

    <!-- 작성일 등 메타 -->
    <div class="notice-meta">
        작성일: <fmt:formatDate value="${announce.created_at}" pattern="yyyy.MM.dd HH:mm"/>
    </div>

    <!-- 내용 -->
    <div class="notice-content">
        ${announce.content}
    </div>
	<div class="update-admin">
	    <a href="${pageContext.request.contextPath}/announce_update?id=${announce.id}">수정하기</a>
	    <a href="${pageContext.request.contextPath}/announce_delete?id=${announce.id}"
		onclick="return confirm('정말 삭제하시겠습니까?');">삭제하기</a>
	</div>
	


    <!-- 목록으로 -->
    <div class="back-btn">
        <a href="${pageContext.request.contextPath}/announce_admin">← 목록으로 돌아가기</a>
    </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
