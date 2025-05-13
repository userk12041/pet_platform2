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
		#red{
			color: red;
		}
		.content-ellipsis {
		    max-width: 200px;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    text-align: left;
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
					<th>번호</th>
					<th>펫 이름</th>
	                <th>진료일</th>
	                <th>진료내용</th>
	                <th>작성/수정일</th>
	                <th>상세/수정</th>
	                <th>삭제</th>
	            </tr>
	            <c:forEach var="medi" items="${medicalList}">
	                <tr>					
	                    <td>${medi.id}</td>
	                    <td>${medi.pet_name}</td>
						<td><fmt:formatDate value="${medi.treatment_date}" pattern="yyyy-MM-dd" /></td>
						<td class="content-ellipsis" title="${medi.content}">
						    ${medi.content}
						</td>
						<td>
						    <c:choose>
						        <c:when test="${medi.created_at.time != medi.updated_at.time}">
						            <fmt:formatDate value="${medi.updated_at}" pattern="yyyy-MM-dd"/>(수정)
						        </c:when>
						        <c:otherwise>
						            <fmt:formatDate value="${medi.created_at}" pattern="yyyy-MM-dd"/>
						        </c:otherwise>
						    </c:choose>
						</td>
						<td>
						    <a href="${pageContext.request.contextPath}/admin/medical/edit?id=${medi.id}">상세보기</a>
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
