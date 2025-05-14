<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 목록</title>
    <style>
		body{
			margin: 0;
		}
		#container {
		    display: flex;
		    min-height: 100vh;
		}
		#content {
		    flex-grow: 1;
		    padding: 20px;
		}
		table {
		    width: 100%;
		    border-collapse: collapse;
		}
		th, td {
		    padding: 8px;
		    border: 1px solid #ccc;
		    text-align: center;
		}
		a {
		    text-decoration: none;
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
		.title-link {
		    display: inline-block;
		    max-width: 100%;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
			text-align: left;
		}

    </style>
</head>
<body>

<div id="container">
	<!-- 사이드바 -->
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />
	<div id="content">
		<div style="display: flex; justify-content: space-between; align-items: center;">
		    <h2>공지사항 목록</h2>
			<a href="${pageContext.request.contextPath}/announce_write">
			    <button type="button" style="padding: 4px 20px; font-size: 16px; border-radius: 6px; cursor: pointer;">작성</button>
			</a>
		</div>
		<form action="/announce_admin" method="get">
			<!--search_sort-->
			<jsp:include page="/WEB-INF/views/common/search_sort.jsp" />
		</form>
	    <table>
			<colgroup>
			    <col style="width: 10%;" />
			    <col style="width: 65%;" />
			    <col style="width: 25%;" />
			</colgroup>
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
	                    <td style="text-align: left;">
	                        <a class="title-link" href="${pageContext.request.contextPath}/announce_detail_admin?id=${dto.id}">
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
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
