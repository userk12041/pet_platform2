<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    .social-login {
        text-align: center;
        margin-top: 30px;
    }

    .social-btn-icon {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 250px;
        margin: 10px auto;
        padding: 12px 16px;
        border-radius: 10px;
        font-weight: bold;
        font-size: 15px;
        text-decoration: none;
        transition: background 0.3s ease;
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    }

    .social-btn-icon img {
        width: 22px;
        height: 22px;
        margin-right: 10px;
    }

    .kakao-btn {
        background-color: #FEE500;
        color: #3B1E1E;
        border: 1px solid #e2c600;
    }

    .kakao-btn:hover {
        background-color: #ffe43a;
    }

    .naver-btn {
        background-color: #03C75A;
        color: white;
        border: 1px solid #02b152;
    }

    .naver-btn:hover {
        background-color: #02b152;
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

        <div class="social-login">
            <p style="color: #666;">소셜 계정으로 간편 로그인</p>

            <a href="${pageContext.request.contextPath}/oauth/kakao" class="social-btn-icon kakao-btn">
                <img src="https://cdn-icons-png.flaticon.com/512/3669/3669741.png" alt="kakao">
                카카오로 로그인
            </a>

            <a href="${pageContext.request.contextPath}/oauth/naver" class="social-btn-icon naver-btn">
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2e/Naver_Logotype.svg" alt="naver">
                네이버로 로그인
            </a>
        </div>
    </div>
</body>
</html>
