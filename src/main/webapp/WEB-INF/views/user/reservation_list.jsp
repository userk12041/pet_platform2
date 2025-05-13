<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <title>예약 내역 확인</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
<h2>전체 예약 내역</h2>

<table>
    <tr>
        <th>구분</th> <!-- 진료 / 미용 -->
        <th>펫 이름</th>
        <th>종류</th>
        <th>예약일</th>
        <th>시간</th>
        <th>특이사항</th>
        <th>상태</th>
    </tr>

    <c:forEach var="res" items="${allReservations}">
        <tr>
            <td>${res.category}</td>
            <td>${res.name}</td>
            <td>${res.type}</td>
            <td><fmt:formatDate value="${res.reservationDay}" pattern="yyyy-MM-dd"/></td>
            <td>${res.reservationTime}</td>
            <td>${res.note}</td>
			<td>
			    <c:choose>
			        <c:when test="${res.state eq '예약 확정'}">✅ 예약 확정</c:when>
			        <c:when test="${res.state eq '예약 대기'}">⏳ 예약 대기</c:when>
			        <c:when test="${res.state eq '지난 예약'}">🕒 지난 예약</c:when>
			        <c:otherwise>❓ 알 수 없음</c:otherwise>
			    </c:choose>
			</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>