<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<meta charset="UTF-8">
<title>회원 정보 수정</title>
<!-- FontAwesome for eye icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
body {
    background: linear-gradient(to right, #ffffff, #dff6ff, #ffffff);
    font-family: 'Noto Sans KR', sans-serif;
    padding: 50px;
}

h2 {
    text-align: center;
    color: #5bd3ff;
    margin-bottom: 30px;
}

form {
    width: 50%;
    margin: auto;
    background-color: #eef6f9;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 6px 12px rgba(0,0,0,0.1);
}

label {
    display: block;
    margin-top: 15px;
    font-weight: bold;
    color: #333;
}

   button.check-btn {
    padding: 3px 6px;
    font-size: 0.8em;
    margin-top: 14px;
}

input[type="text"], input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ccc;
    border-radius: 8px;
    box-sizing: border-box;
}

input[type="submit"] {
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

input[type="submit"]:hover {
    background-color: #3cb5de;
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
                msg.innerText = "이미 사용되는 닉네임입닉다.";
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
//     const password = document.getElementById("password").value;
//     const passwordCheck = document.getElementById("passwordCheck").value;
    const nickname = document.getElementById("nickname").value;

    const phoneRegex = /^010-\d{4}-\d{4}$/;
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,15}$/;

    if (!phoneRegex.test(phone)) {
        alert("전화번호는 010-1234-5678 형식으로!");
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
//     if (password) {
//         if (!pwRegex.test(password)) {
//             alert("비밀번호는 8~15자리, 영문+숫자+특수문자를 포함해야해요.");
//             return false;
//         }
//         if (password !== passwordCheck) {
//             alert("비밀번호가 일치하지 않아요.");
//             return false;
//         }
//     }
    return true;
}
</script>

</head>
<body>
<h2>${user.user_name}님 회원 정보 수정</h2>
<form action="user_info_modify_pro" method="post" onsubmit="return validateForm()">
<%--     <input type="hidden" name="user_id" value="${user.user_id}" /> --%>
    <input type="hidden" id="originalNickname" value="${user.nickname}" />

    <label>아이디</label>
    <input type="text" name="user_id" value="${user.user_id}" readonly/>
    
    <label>이름</label>
    <input type="text" name="user_name" value="${user.user_name}" />

<!-- 	<label>비밀번호</label> -->
<!--     <input type="password" name="password" id="password" required/> -->

<!--     <label>비밀번호 확인</label> -->
<!--     <input type="password" name="passwordCheck" id="passwordCheck" required/> -->

    <label>전화번호</label>
    <input type="text" name="phone_number" id="phone_number" value="${user.phone_number}" />

    <label>이메일</label>
    <input type="text" name="email" id="email" value="${user.email}" />

    <label>주소</label>
    <input type="text" name="address" value="${user.address}" />

  	<div style="display: flex; align-items: center; gap: 8px;">
     	<label>닉네임</label>
     	<button type="button" onclick="checkNick()" class="check-btn">중복 확인</button>
    </div>
    <div style="display: flex; gap: 10px; align-items: center;">
        <input type="text" name="nickname" id="nickname" value="${user.nickname}" />
    </div>
    <span id="nickCheckMsg" style="font-size: 0.9em; color: gray;"></span>

    <input type="submit" value="수정 완료" />
</form>
</body>
</html>
