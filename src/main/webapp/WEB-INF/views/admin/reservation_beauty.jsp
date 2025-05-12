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
        <h2>미용 예약 목록</h2>
        <table>
            <tr>
                <th>예약 번호</th>
                <th>이름</th>
                <th>종류</th>
                <th>성별</th>
                <th>나이</th>
                <th>무게</th>
                <th>스타일</th>
                <th>특이사항</th>
                <th>예약날짜/시간</th>
                <th>예약자 성명</th>
                <th>전화번호</th>
                <th>상태</th>
                <th>승인/거절</th>
                <th>삭제</th>
            </tr>
            <c:forEach var="beauty" items="${reservationBeauty}">
                <tr>
                    <td>${beauty.id}</td>
                    <td>${beauty.name}</td>
                    <td>${beauty.type}</td>
                    <td>${beauty.gender}</td>
                    <td>${beauty.age}</td>
                    <td>${beauty.weight}</td>
                    <td>${beauty.style}</td>
                    <td>${beauty.note}</td>
                    <td>${beauty.reservation_day}${beauty.reservation_time}</td>
                    <td>${beauty.user_name}</td>
                    <td>${beauty.user_phone}</td>
                    <td>${beauty.state}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/reservationBeauty/approve?id=${beauty.id}">승인</a>
                        <a href="${pageContext.request.contextPath}/admin/reservationBeauty/reject?id=${beauty.id}">거절</a>
                    </td>
					<td>
                        <a id="red" href="${pageContext.request.contextPath}/admin/reservationBeauty/delete?id=${beauty.id}" 
                           onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
					</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
