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
    <div id="sidebar">
        <h3>관리자 메뉴</h3>
		<ul style="list-style: none; padding-left: 0;">
		    <li><a href="${pageContext.request.contextPath}/main">메인화면으로</a></li>
		    <li><a href="${pageContext.request.contextPath}/admin/user/list">유저 관리</a></li>
		    <li><a href="${pageContext.request.contextPath}/admin/reservationList">예약 관리</a></li>
		    <li><a href="${pageContext.request.contextPath}/admin/medical/list">진료 관리</a></li>
		</ul>
    </div>

    <!-- 콘텐츠 -->
    <div id="content">
        <h2>유저 목록</h2>
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
    </div>
</div>
</body>
</html>
