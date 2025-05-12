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
		#blue{
            color: blue;
		}
		#red{
			color: red;
		}

    </style>
</head>
<body>
<div id="container">
    <!-- 사이드바 -->
    <jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />
	
    <!-- 콘텐츠 -->
    <div id="content">
        <h2>유저 목록</h2>
		<!--test-->
		<form action="/admin/user/list" method="get">
		    <div>
		        <select name="searchField" class="form-select">
		            <option value="user_id" ${searchField == 'user_id' ? 'selected' : ''}>아이디</option>
		            <option value="user_name" ${searchField == 'user_name' ? 'selected' : ''}>이름</option>
		        </select>
		        <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="검색어 입력">
		        <button class="btn btn-primary" type="submit">검색</button>&nbsp;
			    <a href="?sortField=user_id&order=asc&searchField=${searchField}&keyword=${keyword}" class="btn btn-outline-secondary btn-sm">ID ↑</a>
			    <a href="?sortField=user_id&order=desc&searchField=${searchField}&keyword=${keyword}" class="btn btn-outline-secondary btn-sm">ID ↓</a>
			    <a href="?sortField=user_name&order=asc&searchField=${searchField}&keyword=${keyword}" class="btn btn-outline-secondary btn-sm">이름 ↑</a>
			    <a href="?sortField=user_name&order=desc&searchField=${searchField}&keyword=${keyword}" class="btn btn-outline-secondary btn-sm">이름 ↓</a>
			    <a href="?sortField=email&order=asc&searchField=${searchField}&keyword=${keyword}" class="btn btn-outline-secondary btn-sm">이메일 ↑</a>
			    <a href="?sortField=email&order=desc&searchField=${searchField}&keyword=${keyword}" class="btn btn-outline-secondary btn-sm">이메일 ↓</a>
		    </div>
		</form>
		
        <table>
            <tr>
                <th>ID</th>
                <th>이름</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>닉네임</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.user_id}</td>
                    <td>${user.user_name}</td>
                    <td>${user.email}</td>
                    <td>${user.phone_number}</td>
                    <td>${user.nickname}</td>
                    <td>
                        <a id="blue" href="${pageContext.request.contextPath}/admin/user/edit?id=${user.user_id}">수정</a>
                    </td>
                    <td>
                        <a id="red" href="${pageContext.request.contextPath}/admin/user/delete?id=${user.user_id}" 
                           onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
		
		<div>
			<c:if test="${hasPrev}">
				<a href="?page=${startPage - 1}&sortField=${sortField}&order=${order}&name=${name}">&lt;</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:choose>
					<c:when test="${i == currentPage}">
						<strong>[${i}]</strong>
					</c:when>
					<c:otherwise>
						<a href="?page=${i}&sortField=${sortField}&order=${order}&name=${name}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${hasNext}">
				<a href="?page=${endPage + 1}&sortField=${sortField}&order=${order}&name=${name}">&gt;</a>
			</c:if>
		</div>
    </div>
</div>
</body>
</html>
