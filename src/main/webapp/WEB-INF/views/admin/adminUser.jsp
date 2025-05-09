<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>사용자 관리</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
		.search-container {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            background-color: #f9f9f9;
        }
		.sort-buttons {
		    margin-bottom: 10px;
		}
		.sort-buttons button {
		    margin-right: 5px;
		    padding: 8px 12px;
		    cursor: pointer;
		}
    </style>
</head>
<body>

    <h2>👤 사용자 목록</h2>
	<!--검색기능-->
	<div class="search-container">
        <form id="searchForm" onsubmit="performSearch(); return false;">
            <select name="searchType">
                <option value="user_id">ID</option>
                <option value="user_name">이름</option>
            </select>
            <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
            <button type="submit">검색</button>
        </form>
    </div>
	
	<div class="sort-buttons">
	    <button type="button" onclick="sortUsers('user_id', '${param.sortOrder == 'asc' and param.sortField == 'user_id' ? 'desc' : 'asc'}')">ID 정렬</button>
	    <button type="button" onclick="sortUsers('user_name', '${param.sortOrder == 'asc' and param.sortField == 'user_name' ? 'desc' : 'asc'}')">이름 정렬</button>
	</div>
	
	<!--출력-->
	<div id="user-table-container">
	    <table>
	        <thead>
	            <tr>
	                <th>ID</th>
	                <th>이름</th>
	                <th>닉네임</th>
	                <th>이메일</th>
	                <th>전화번호</th>
	                <th>주소</th>
	                <th>수정/삭제</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="user" items="${userList}">
	                <tr>
						<td>${user.user_id}</td>
						<td>${user.user_name}</td>
						<td>${user.nickname}</td>
						<td>${user.email}</td>
						<td>${user.phone_number}</td>
						<td>${user.address}</td>
						<td>
							<button class="edit-btn" data-user-id="${user.user_id}">수정</button>
							<button class="delete-btn" data-user-id="${user.user_id}">삭제</button>
						</td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</div>
</body>
</html>
