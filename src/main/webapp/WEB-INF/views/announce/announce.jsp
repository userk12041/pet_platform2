<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 목록</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f7f9fb;
            margin: 0;
        }

        .table-wrapper {
            max-width: 800px;
            margin: 60px auto;
            background-color: white;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            font-size: 26px;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #d6eef4;
            padding: 12px;
            text-align: center;
            font-size: 15px;
        }

        th {
            background-color: #5bd3ff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f9fc;
        }

        tr:hover {
            background-color: #e2f1f7;
        }

        a.title-link {
            color: #007acc;
            text-decoration: none;
        }

        a.title-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="table-wrapper">
    <h2>공지사항 목록</h2>
	<form action="/announce" method="get">
		<!--search_sort-->
		<jsp:include page="/WEB-INF/views/common/search_sort.jsp" />
	</form>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="dto" items="${announce}">
                <tr>
                    <td>${dto.id}</td>
                    <td>
                        <a class="title-link" href="${pageContext.request.contextPath}/announce_detail?id=${dto.id}">
                            ${dto.title}
                        </a>
                    </td>
                    <td><fmt:formatDate value="${dto.created_at}" pattern="yyyy.MM.dd HH:mm"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
	<!--paging-->
			<jsp:include page="/WEB-INF/views/common/paging.jsp" />
</div>

<c:if test="${sessionScope.user.role eq 'admin'}">
    <div style="text-align: center; margin-bottom: 40px;">
        <a href="${pageContext.request.contextPath}/announce_write">작성하기</a>
    </div>
</c:if>


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
