<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<meta charset="UTF-8">
<title>로그인</title>
<style>
    body {
	    background: linear-gradient(to right, #ffffff, #dff6ff, #ffffff);
	    font-family: 'Noto Sans KR', sans-serif;
	    padding: 50px;
    }

    h1 {
        text-align: center;
	    color: #5bd3ff;
	    margin-bottom: 30px;
    }
    .login-card {
	    width: 50%;
	    margin: auto;
	    background-color: #eef6f9;
	    padding: 30px;
	    border-radius: 15px;
	    box-shadow: 0 6px 12px rgba(0,0,0,0.1);
    }


    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
	    display: block;
	    margin-top: 15px;
	    font-weight: bold;
	    color: #333;
    }

    .form-group input[type="text"], 
    .form-group input[type="password"] {
	    width: 100%;
	    padding: 10px;
	    margin-top: 5px;
	    border: 1px solid #ccc;
	    border-radius: 8px;
	    box-sizing: border-box;
    }

    .submit-btn {
	    margin-top: 25px;
	    width: 100%;
	    padding: 12px;
	    background-color: #5bd3ff;
	    border: none;
	    color: white;
	    font-weight: bold;
	    border-radius: 8px;
	    cursor: pointer;
    }

    .submit-btn:hover {
        background-color: #3cb5de;
    }
</style>
</head>
<body>
    <h1>로그인</h1>
    <div class="login-card">
        <form method="post" action="login_yn">
            <div class="form-group">
                <label for="user_id">아이디</label>
                <input type="text" name="user_id" id="user_id">
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" name="password" id="password">
            </div>
            <input type="submit" value="로그인" class="submit-btn">
        </form>
    </div>
</body>
</html>
