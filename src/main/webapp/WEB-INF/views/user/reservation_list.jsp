<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <title>예약 내역 확인</title>
    <style>
		body {
		    margin: 0;
		    font-family: 'Noto Sans KR', sans-serif;
		    background-color: #f7f9fb;
		}
		.container {
		    max-width: 1400px; /* 기존 1200px → 더 넓게 */
		    margin: 60px auto;
		    gap: 50px; /* 패널 사이 간격도 키움 */
		}

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #eee;
            padding: 10px;
            text-align: center;
        }
        th {
			background: #f1f9ff;
			color: #333;
        }
		.section {
		    background: white;
		    border-radius: 14px;
		    padding: 40px;
		    box-shadow: 0 8px 16px rgba(0,0,0,0.1);
		}
		.section table th,
		.section table td {
		    padding: 16px 12px;
		    font-size: 16px;
		}
    </style>
</head>
<body>
	<div class="container">
		<div class="section">
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
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<body>
</html>