<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<meta charset="UTF-8">
<title>로그인</title>
<style>
    body {
        margin: 0;
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f7f9fb;
        padding: 50px;
    }

    h2 {
        text-align: center;
        color: #5bd3ff;
        margin-bottom: 30px;
    }

    .login-box {
        max-width: 500px;
        margin: 0 auto;
        background: white;
        padding: 40px;
        border-radius: 14px;
        box-shadow: 0 8px 16px rgba(0,0,0,0.1);
    }

    .form-group {
        margin-bottom: 20px;
    }

    label {
        font-weight: bold;
        margin-bottom: 8px;
        display: block;
        color: #333;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 15px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        width: 100%;
        padding: 12px;
        background-color: #5bd3ff;
        border: none;
        color: white;
        font-weight: bold;
        font-size: 16px;
        border-radius: 8px;
        cursor: pointer;
    }

    input[type="submit"]:hover {
        background-color: #28abfc;
    }

    .social-login {
        text-align: center;
        margin-top: 30px;
    }

    .social-login p {
        color: #666;
        margin-bottom: 15px;
    }

    .social-btn {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 260px;
        margin: 8px auto;
        padding: 12px 16px;
        border-radius: 10px;
        font-weight: bold;
        font-size: 15px;
        text-decoration: none;
        box-shadow: 0 4px 8px rgba(0,0,0,0.05);
        transition: background 0.3s ease;
    }

    .social-btn img {
        width: 22px;
        height: 22px;
        margin-right: 10px;
    }

    .kakao {
        background-color: #FEE500;
        color: #3B1E1E;
        border: 1px solid #e2c600;
    }

    .kakao:hover {
        background-color: #ffe43a;
    }

    .naver {
        background-color: #03C75A;
        color: white;
        border: 1px solid #02b152;
    }

    .naver:hover {
        background-color: #02b152;
    }
</style>
</head>
<body>
    <h2>로그인</h2>
    <div class="login-box">
        <form method="post" action="login_yn">
            <div class="form-group">
                <label for="user_id">아이디</label>
                <input type="text" name="user_id" id="user_id" required>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" name="password" id="password" required>
            </div>
            <input type="submit" value="로그인">
        </form>

        <div class="social-login">
            <p>소셜 계정으로 간편 로그인</p>

            <a href="${pageContext.request.contextPath}/oauth/kakao" class="social-btn kakao">
                <img src="https://cdn-icons-png.flaticon.com/512/3669/3669741.png" alt="kakao">카카오로 로그인
            </a>

            <a href="${pageContext.request.contextPath}/oauth/naver" class="social-btn naver">
                <img src="https://upload.wikimedia.org/wikipedia/commons/2/2e/Naver_Logotype.svg" alt="naver">네이버로 로그인
            </a>
        </div>
    </div>
</body>
</html>
