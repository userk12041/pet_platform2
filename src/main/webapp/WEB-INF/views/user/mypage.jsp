<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	body {
	    background: linear-gradient(to right, #ffffff, #dff6ff, #ffffff);
	    font-family: 'Noto Sans KR', sans-serif;
	    padding: 50px;
	}
	
	.container {
	    width: 60%;
	    margin: auto;
	    background-color: #eef6f9;
	    padding: 30px;
	    border-radius: 15px;
	    box-shadow: 0 6px 12px rgba(0,0,0,0.1);
	    text-align: left;
	}
	
	h1 {
	    text-align: center;
	    color: #5bd3ff;
	    margin-bottom: 20px;
	}
	
	p {
	    font-size: 16px;
	    margin: 10px 0;
	    color: #333;
	}
	
	.btn-group {
	    margin-top: 30px;
	    text-align: center;
	}
	
	.btn-common {
	    display: inline-block;
	    color: white;
	    padding: 12px 20px;
	    margin: 0 10px;
	    border: none;
	    border-radius: 8px;
		font-size: 15px;
	    text-decoration: none;
		cursor: pointer;
	    font-weight: bold;
		transition: background-color 0.3s ease;
	}
	.btn-blue {
	    background-color: #5bd3ff;
	}
	.btn-blue:hover {
	    background-color: #3cb5de;
	}
	.btn-red {
	    background-color: #ff4d4d;
	}
	.btn-red:hover {
	    background-color: #cc0000;
	}
</style>
</head>
<body>
	<div class="container">
	    <h1>${my_info.user_name}님의 마이페이지</h1>
	    <hr>
	    <p><strong>아이디:</strong> ${my_info.user_id}</p>
	    <p><strong>이름:</strong> ${my_info.user_name}</p>
	    <p><strong>전화번호:</strong> ${my_info.phone_number}</p>
	    <p><strong>이메일:</strong> ${my_info.email}</p>
	    <p><strong>닉네임:</strong> ${my_info.nickname}</p>
	    <p><strong>주소:</strong> ${my_info.address}</p>
	
	    <div class="btn-group">
	        <a href="pet/list" class="btn-common btn-blue">내 펫 목록</a>
	        <a href="user_info_modify" class="btn-common btn-blue">회원정보 수정</a>
	        <form action="${pageContext.request.contextPath}/user/delete" method="post" style="display: inline;">
    <button type="submit" class="btn-common btn-red" onclick="return confirm('정말 탈퇴하시겠습니까?');">회원탈퇴</button>
</form>

	    </div>
	</div>
</body>
</html>
