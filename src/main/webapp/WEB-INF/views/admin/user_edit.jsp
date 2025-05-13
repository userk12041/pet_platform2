<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<h2>회원 정보 수정</h2>

<form action="${pageContext.request.contextPath}/admin/user/update" method="post">
    <input type="hidden" name="user_id" value="${user.user_id}" />
    이름: <input type="text" name="user_name" value="${user.user_name}" /><br/>
    이메일: <input type="text" name="email" value="${user.email}" /><br/>
    전화번호: <input type="text" name="phone_number" value="${user.phone_number}" /><br/>
    주소: <input type="text" name="address" value="${user.address}" /><br/>
    닉네임: <input type="text" name="nickname" value="${user.nickname}" /><br/>
    <input type="submit" value="수정" />
    <a href="${pageContext.request.contextPath}/admin/user/list">취소</a>
</form>
