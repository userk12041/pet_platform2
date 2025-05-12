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
		<div style="display: flex; justify-content: space-between; align-items: center;">
	        <h2>진료 기록 목록</h2>
	        <a href="${pageContext.request.contextPath}/admin/medical/write">
	            <button type="button" style="padding: 4px 20px; font-size: 16px; border-radius: 6px; cursor: pointer;">작성</button>
	        </a>
	    </div>
        <table>
            <tr>
                <th>ID</th>
                <th>펫 이름</th>
                <th>진료일자</th>
                <th>진료내용</th>
                <th>처방</th>
                <th>특이사항</th>
                <th>유저ID</th>
                <th>작성일자</th>
                <th>수정일자</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
            <c:forEach var="medi" items="${medicalList}">
                <tr>
                    <td>${medi.id}</td>
                    <td>${medi.pet_name}</td>
                    <td>${medi.treatment_date}</td>
                    <td>${medi.content}</td>
                    <td>${medi.prescription}</td>
                    <td>${medi.notes}</td>
                    <td>${medi.user_id}</td>
                    <td>${medi.created_at}</td>
                    <td>${medi.updated_at}</td>
                    <td>
                        <a id="blue" href="${pageContext.request.contextPath}/admin/medical/edit?id=${medi.id}">수정</a>
                    </td>
                    <td>
                        <a id="red" href="${pageContext.request.contextPath}/admin/medical/delete?id=${medi.id}" 
                           onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
