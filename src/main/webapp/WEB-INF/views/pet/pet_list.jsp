<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<meta charset="UTF-8">
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

table {
    width: 80%;
    margin: auto;
    border-collapse: collapse;
    background-color: #eef6f9;
    box-shadow: 0 6px 12px rgba(0,0,0,0.1);
    border-radius: 12px;
    overflow: hidden;
}

th, td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #ccc;
}

th {
    background-color: #5bd3ff;
    color: white;
}

a {
    color: #5bd3ff;
    text-decoration: none;
    font-weight: bold;
}
</style>
<title>펫 목록</title>
</head>
<body>
<h2>펫 목록</h2>
<table>
    <tr>
        <th>번호</th>
        <th>이름</th>
        <th>성별</th>
        <th>종류</th>
        <th>나이</th>
        <th>상세 보기</th>
		<th>미용 예약</th>
    </tr>
    <c:forEach var="pet" items="${pets}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${pet.name}</td>
            <td>${pet.gender}</td>
            <td>${pet.type}</td>
            <td>${pet.age}</td>
            <td><a href="${pageContext.request.contextPath}/pet/detail/${pet.id}">보기</a></td>
			<td>
				<a href="${pageContext.request.contextPath}/pet/beautyReservation/${pet.id}">예약하기</a>
			</td>
        </tr>
    </c:forEach>
</table>
<br>
<div style="text-align: center;">
    <a href="${pageContext.request.contextPath}/pet/register">펫 등록하기</a>
</div>
</body>
</html>
