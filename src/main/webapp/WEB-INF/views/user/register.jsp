<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
body {
    margin: 0;
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f7f9fb;
}

.container {
    max-width: 700px;
    margin: 60px auto;
    background: white;
    padding: 40px;
    border-radius: 14px;
    box-shadow: 0 8px 16px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
    color: #5bd3ff;
    margin-bottom: 30px;
}

.form-row {
    margin-bottom: 20px;
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
    color: #333;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 8px;
    box-sizing: border-box;
    font-size: 15px;
}

input[type="submit"] {
    width: 100%;
    padding: 12px;
    background-color: #5bd3ff;
    color: white;
    border: none;
    border-radius: 8px;
    font-weight: bold;
    font-size: 16px;
    cursor: pointer;
    margin-top: 10px;
}

input[type="submit"]:hover {
    background-color: #28abfc;
}

.check-btn {
    padding: 6px 10px;
    font-size: 13px;
    margin-left: 10px;
    background-color: #5bd3ff;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}

.check-btn:hover {
    background-color: #28abfc;
}

.msg {
    font-size: 13px;
    margin-top: 5px;
}
</style>
</head>
<body>
<div class="container">
    <h2>회원가입</h2>
    <form method="post" action="registerOk" onsubmit="return validateForm()">
        <div class="form-row">
            <label>아이디</label>
            <div style="display: flex; align-items: center;">
                <input type="text" name="user_id" id="user_id" required>
                <button type="button" onclick="checkId()" class="check-btn">중복 확인</button>
            </div>
            <div id="idCheckMsg" class="msg"></div>
        </div>

        <div class="form-row">
            <label>비밀번호</label>
            <input type="password" name="password" id="password" required>
        </div>

        <div class="form-row">
            <label>비밀번호 확인</label>
            <input type="password" id="passwordCheck" required>
        </div>

        <div class="form-row">
            <label>이름</label>
            <input type="text" name="user_name" required>
        </div>

        <div class="form-row">
            <label>닉네임</label>
            <div style="display: flex; align-items: center;">
                <input type="text" name="nickname" id="nickname" required>
                <button type="button" onclick="checkNick()" class="check-btn">중복 확인</button>
            </div>
            <div id="nickCheckMsg" class="msg"></div>
        </div>

        <div class="form-row">
            <label>전화번호</label>
            <input type="text" name="phone_number" id="phone_number" placeholder="010-1234-5678" required>
        </div>

        <div class="form-row">
            <label>이메일</label>
            <input type="text" name="email" id="email" required>
        </div>

        <div class="form-row">
            <label>주소</label>
            <input type="text" name="address">
        </div>

        <input type="submit" value="가입하기">
    </form>
</div>

<script>
let isIdChecked = false;
let lastCheckedId = "";
let isNickChecked = false;
let lastCheckedNick = "";

function checkId() {
    const id = document.getElementById("user_id").value.trim();
    const msg = document.getElementById("idCheckMsg");

    if (id === "") {
        msg.innerText = "아이디를 입력해주세요.";
        msg.style.color = "red";
        isIdChecked = false;
        return;
    }

    fetch("idCheck?user_id=" + encodeURIComponent(id))
        .then(res => res.text())
        .then(data => {
            if (data === "usable") {
                msg.innerText = "사용 가능한 아이디입니다.";
                msg.style.color = "green";
                isIdChecked = true;
                lastCheckedId = id;
            } else {
                msg.innerText = "이미 사용 중인 아이디입니다.";
                msg.style.color = "red";
                isIdChecked = false;
            }
        });
}

function checkNick() {
    const nick = document.getElementById("nickname").value.trim();
    const msg = document.getElementById("nickCheckMsg");

    if (nick === "") {
        msg.innerText = "닉네임을 입력해주세요.";
        msg.style.color = "red";
        isNickChecked = false;
        return;
    }

    fetch("nickCheck?nickname=" + encodeURIComponent(nick))
        .then(res => res.text())
        .then(data => {
            if (data === "usable") {
                msg.innerText = "사용 가능한 닉네임입니다.";
                msg.style.color = "green";
                isNickChecked = true;
                lastCheckedNick = nick;
            } else {
                msg.innerText = "이미 사용 중인 닉네임입니다.";
                msg.style.color = "red";
                isNickChecked = false;
            }
        });
}

function validateForm() {
    const id = document.getElementById("user_id").value.trim();
    const pw = document.getElementById("password").value;
    const pwCheck = document.getElementById("passwordCheck").value;
    const nick = document.getElementById("nickname").value.trim();
    const phone = document.getElementById("phone_number").value.trim();
    const email = document.getElementById("email").value.trim();

    if (!isIdChecked || id !== lastCheckedId) {
        alert("아이디 중복 확인을 해주세요.");
        return false;
    }

    if (!isNickChecked || nick !== lastCheckedNick) {
        alert("닉네임 중복 확인을 해주세요.");
        return false;
    }

    if (pw !== pwCheck) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }

    if (!/^010-\d{4}-\d{4}$/.test(phone)) {
        alert("전화번호는 010-1234-5678 형식으로 입력해주세요.");
        return false;
    }

    if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
        alert("올바른 이메일 형식이 아닙니다.");
        return false;
    }

    return true;
}
</script>
</body>
</html>
