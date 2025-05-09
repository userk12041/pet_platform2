<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
body {
    margin: 0;
    background-color: #f7f9fb;
    font-family: 'Noto Sans KR', sans-serif;
}

.container {
    max-width: 800px;
    margin: 60px auto;
    background-color: #ffffff;
    padding: 50px;
    border-radius: 16px;
    box-shadow: 0 6px 12px rgba(0,0,0,0.08);
}

h2 {
    text-align: center;
    color: #5bd3ff;
    margin-bottom: 30px;
}

label {
    display: block;
    margin-top: 20px;
    font-weight: bold;
    color: #333;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 12px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 10px;
    box-sizing: border-box;
    background-color: #f9fcff;
}

input[readonly] {
    background-color: #eee;
    color: #777;
}

input[type="submit"] {
    margin-top: 30px;
    width: 100%;
    padding: 14px;
    background-color: #5bd3ff;
    border: none;
    color: white;
    font-weight: bold;
    font-size: 16px;
    border-radius: 10px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #28abfc;
}

button.check-btn {
    padding: 8px 12px;
    font-size: 0.85em;
    background-color: #ddd;
    border: none;
    border-radius: 8px;
    cursor: pointer;
}

#nickCheckMsg {
    display: block;
    margin-top: 8px;
    font-size: 0.9em;
}
</style>

<script>
let isNickChecked = true;
let lastCheckedNick = "${user.nickname}";

function checkNick() {
    const nick = document.getElementById("nickname").value.trim();
    const orig = document.getElementById("originalNickname").value;
    const msg = document.getElementById("nickCheckMsg");

    if (nick === "") {
        msg.innerText = "닉네임을 입력해주세요.";
        msg.style.color = "red";
        isNickChecked = false;
        return;
    }
    if (nick === orig) {
        msg.innerText = "기존 닉네임과 동일합니다.";
        msg.style.color = "gray";
        isNickChecked = true;
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
                msg.innerText = "이미 사용되는 닉네임입니다.";
                msg.style.color = "red";
                isNickChecked = false;
            }
        })
        .catch(() => {
            msg.innerText = "오류가 발생했습니다.";
            msg.style.color = "red";
            isNickChecked = false;
        });
}

function validateForm() {
    const phone = document.getElementById("phone_number").value.trim();
    const email = document.getElementById("email").value.trim();
    const nickname = document.getElementById("nickname").value;

    const phoneRegex = /^010-\d{4}-\d{4}$/;
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!phoneRegex.test(phone)) {
        alert("전화번호는 010-1234-5678 형식으로 입력해주세요.");
        return false;
    }
    if (!emailRegex.test(email)) {
        alert("올바른 이메일 형식을 입력해주세요.");
        return false;
    }
    if (nickname !== lastCheckedNick || !isNickChecked) {
        alert("닉네임 중복 확인을 해주세요.");
        return false;
    }
    return true;
}
</script>
</head>

<body>
<div class="container">
    <h2>${user.user_name}님 회원 정보 수정</h2>
    <form action="user_info_modify_pro" method="post" onsubmit="return validateForm()">
        <input type="hidden" id="originalNickname" value="${user.nickname}" />
        
        <label>아이디</label>
        <input type="text" name="user_id" value="${user.user_id}" readonly />

        <label>이름</label>
        <input type="text" name="user_name" value="${user.user_name}" />

        <label>전화번호</label>
        <input type="text" name="phone_number" id="phone_number" value="${user.phone_number}" />

        <label>이메일</label>
        <input type="text" name="email" id="email" value="${user.email}" />

        <label>주소</label>
        <input type="text" name="address" value="${user.address}" />

        <label>닉네임 
            <button type="button" onclick="checkNick()" class="check-btn">중복 확인</button>
        </label>
        <input type="text" name="nickname" id="nickname" value="${user.nickname}" />
        <span id="nickCheckMsg">※ 닉네임 중복 여부를 확인해주세요.</span>

        <input type="submit" value="수정 완료" />
    </form>
</div>
</body>
</html>
