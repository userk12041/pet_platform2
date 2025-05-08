<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<meta charset="UTF-8">
<title>회원 가입</title>

<!-- ✅ Font Awesome & jQuery -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

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
	.register-card {
/* 	    background-color: #fff;
	    padding: 30px 40px;
	    border-radius: 12px;
	    box-shadow: 0 5px 15px rgba(0,0,0,0.1);
	    width: 400px;
	    margin: auto; */
	    width: 50%;
	    margin: auto;
	    background-color: #eef6f9;
	    padding: 30px;
	    border-radius: 15px;
	    box-shadow: 0 6px 12px rgba(0,0,0,0.1);
	}


    .form-row {
        margin-bottom: 18px;
    }

    .form-row label {
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

    .form-row input[type="text"],
    .form-row input[type="password"] {
	    width: 100%;
	    padding: 10px;
	    margin-top: 5px;
	    border: 1px solid #ccc;
	    border-radius: 8px;
	    box-sizing: border-box;
    }

    .form-row input[type="submit"] {
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

    .form-row input[type="submit"]:hover {
        background-color: #3cb5de;
    }

    .pw-wrap {
        position: relative;
    }

    .pw-wrap i {
        position: absolute;
        top: 50%;
        right: 10px;
        transform: translateY(-50%);
        cursor: pointer;
        color: gray;
    }
</style>

<script>
	let isIdChecked = false;
	let lastCheckedId = "";
	let isNickChecked = false;
	let lastCheckedNick = "";

	function checkId() {
	    const userId = document.getElementById("user_id").value.trim();
	    const msgEl = document.getElementById("idCheckMsg");

	    if (userId === "") {
	        msgEl.innerText = "아이디를 입력해주세요.";
	        msgEl.style.color = "red";
	        isIdChecked = false;
	        return;
	    }

	    fetch("idCheck?user_id=" + encodeURIComponent(userId))
	        .then(res => res.text())
	        .then(data => {
	            if (data === "usable") {
	                msgEl.innerText = "사용 가능한 아이디입니다.";
	                msgEl.style.color = "green";
	                isIdChecked = true;
	                lastCheckedId = userId;
	            } else {
	                msgEl.innerText = "이미 사용되고 있는 아이디입니다.";
	                msgEl.style.color = "red";
	                isIdChecked = false;
	            }
	        })
	        .catch(() => {
	            msgEl.innerText = "오류가 발생했습니다.";
	            msgEl.style.color = "red";
	            isIdChecked = false;
	        });
	}
	
	function checkNick() {
	    const userNick = document.getElementById("nickname").value.trim();
	    const msgEl = document.getElementById("nickCheckMsg");

	    if (userNick === "") {
	        msgEl.innerText = "닉네임을 입력해주세요.";
	        msgEl.style.color = "red";
	        isNickChecked = false;
	        return;
	    }

	    fetch("nickCheck?nickname=" + encodeURIComponent(userNick))
	        .then(res => res.text())
	        .then(data => {
	            if (data === "usable") {
	                msgEl.innerText = "사용 가능한 닉네임입니다.";
	                msgEl.style.color = "green";
	                isNickChecked = true;
	                lastCheckedNick = userNick;
	            } else {
	                msgEl.innerText = "이미 사용되고 있는 닉네임입니다.";
	                msgEl.style.color = "red";
	                isNickChecked = false;
	            }
	        })
	        .catch(() => {
	            msgEl.innerText = "오류가 발생했습니다.";
	            msgEl.style.color = "red";
	            isNickChecked = false;
	        });
	}
	
	function validateForm() {
	    const userId = document.getElementById("user_id").value.trim();
	    const nick = document.getElementById("nickname").value.trim();
	    const password = document.getElementById("password").value.trim();
	    const passwordCheck = document.getElementById("passwordCheck").value.trim();
	    const phone = document.getElementById("phone_number").value.trim();
	    const email = document.getElementById("email").value.trim();

	    const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]).{8,15}$/;
	    const phoneRegex = /^010-\d{4}-\d{4}$/;
	    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

	    if (!isIdChecked || userId !== lastCheckedId) {
	        alert("아이디 중복 확인을 완료해주세요.");
	        document.getElementById("user_id").focus();
	        return false;
	    }
	    
	    if (!isNickChecked || nick !== lastCheckedNick) {
	        alert("닉네임 중복 확인을 완료해주세요.");
	        document.getElementById("nickname").focus();
	        return false;
	    }

	    if (!passwordRegex.test(password)) {
	        alert("비밀번호는 8~15자리이며, 영문자, 숫자, 특수문자를 각각 최소 1개 이상 포함해야 합니다.");
	        document.getElementById("password").focus();
	        return false;
	    }

	    if (password !== passwordCheck) {
	        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	        document.getElementById("passwordCheck").focus();
	        return false;
	    }

	    if (!phoneRegex.test(phone)) {
	        alert("전화번호는 '010-1234-5678' 형식으로 입력해주세요.");
	        document.getElementById("phone_number").focus();
	        return false;
	    }

	    if (!emailRegex.test(email)) {
	        alert("올바른 이메일 형식을 입력해주세요.");
	        document.getElementById("email").focus();
	        return false;
	    }

	    return true;
	}

	$(document).ready(function() {
	    $('.toggle-pw').on('click', function() {
	        const input = $(this).prev('input');
	        const type = input.attr('type') === 'password' ? 'text' : 'password';
	        input.attr('type', type);
	        $(this).toggleClass('fa-eye fa-eye-slash');
	    });
	});
</script>

</head>
<body>
    <h1>회원 가입</h1>
    <div class="register-card">
        <form method="post" action="registerOk" onsubmit="return validateForm()">
            <div class="form-row" style="position: relative;">
                <div style="display: flex; align-items: center; gap: 8px;">
                    <label for="user_id">아이디</label>
                    <button type="button" onclick="checkId()" class="check-btn">중복 확인</button>
                </div>
                <input type="text" name="user_id" id="user_id" required>
                <span id="idCheckMsg" style="font-size: 0.9em; margin-top: 5px; display: block;"></span>
            </div>

            <div class="form-row">
                <label for="password">암호</label>
                <div class="pw-wrap">
                    <input type="password" name="password" id="password" required>
                    <i class="fa fa-eye toggle-pw"></i>
                </div>
            </div>

            <div class="form-row">
                <label for="passwordCheck">암호 확인</label>
                <div class="pw-wrap">
                    <input type="password" name="passwordCheck" id="passwordCheck" required>
                    <i class="fa fa-eye toggle-pw"></i>
                </div>
            </div>

            <div class="form-row">
                <label for="user_name">이름</label>
                <input type="text" name="user_name" id="user_name" required>
            </div>

            <div class="form-row" style="position: relative;">
            	<div style="display: flex; align-items: center; gap: 8px;">
	                <label for="nickname">닉네임</label>
	                <button type="button" onclick="checkNick()" class="check-btn">중복 확인</button>
                </div>
	                <input type="text" name="nickname" id="nickname" required>
	                <span id="nickCheckMsg" style="font-size: 0.9em; margin-top: 5px; display: block;"></span>
            </div>
            
            <div class="form-row">
                <label for="phone_number">전화번호</label>
                <input type="text" name="phone_number" id="phone_number" placeholder="010-1234-5678" required>
            </div>

            <div class="form-row">
                <label for="email">이메일</label>
                <input type="text" name="email" id="email" required>
            </div>

            <div class="form-row">
                <label for="address">주소</label>
                <input type="text" name="address" id="address">
            </div>

            <div class="form-row">
                <input type="submit" value="등록">
            </div>
        </form>
    </div>
</body>
</html>
