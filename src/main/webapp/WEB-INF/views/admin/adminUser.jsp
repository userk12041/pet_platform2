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
    </style>
</head>
<body>

    <h2>👤 사용자 목록</h2>

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
</body>
</html>
