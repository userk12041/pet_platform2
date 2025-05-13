<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
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
		
    </style>
</head>
<body>
<div id="container">
    <!-- 사이드바 -->
    <jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />

    <!-- 콘텐츠 -->
    <div id="content">
        <h2>진료 예약 목록</h2>
        <table>
            <tr>
                <th>예약 번호</th>
                <th>펫 이름</th>
                <th>종류</th>
                <th>성별</th>
                <th>나이</th>
                <th>특이사항</th>
                <th>예약날짜/시간</th>
                <th>예약자 성명</th>
                <th>전화번호</th>
                <th>상태</th>
                <th>승인/거절</th>
                <th>삭제</th>
            </tr>
            <c:forEach var="medi" items="${reservationMedical}">
                <tr>
                    <td>${medi.id}</td>
                    <td>${medi.name}</td>
                    <td>${medi.type}</td>
                    <td>${medi.gender}</td>
                    <td>${medi.age}</td>
                    <td>${medi.note}</td>
					<td>
					  <fmt:formatDate value="${medi.reservation_date}" pattern="yy.MM.dd" />
					  ${medi.reservation_time}
					</td>
                    <td>${medi.user_name}</td>
                    <td>${medi.phone_number}</td>
                    <td>${medi.state}</td>
                    <td>
						<form method="post" action="${pageContext.request.contextPath}/admin/reservation/medical/approve" style="display:inline;">
						  <input type="hidden" name="id" value="${medi.id}" />
						  <button type="submit">승인</button>
						</form>

						<form method="post" action="${pageContext.request.contextPath}/admin/reservation/medical/reject" style="display:inline;">
						  <input type="hidden" name="id" value="${medi.id}" />
						  <button type="submit">거절</button>
						</form>

                    </td>
					<td>
						<form method="post" action="${pageContext.request.contextPath}/admin/reservation/medical/delete" style="display:inline;" 
						      onsubmit="return confirm('정말 삭제하시겠습니까?');">
						  <input type="hidden" name="id" value="${medi.id}" />
						  <button type="submit">삭제</button>
						</form>
					</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
