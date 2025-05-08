<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>관리자 페이지</title>
	<script>
        function loadContent(url) {
            fetch(url)
                .then(response => response.text())
                .then(html => {
                    document.getElementById("main-content").innerHTML = html;
                });
        }
		window.onload = function () {
		    loadContent('/admin/users'); // 페이지 처음 열릴 때 사용자 정보 로딩
		};
    </script>
    <style>
        body {
            margin: 0;
            font-family: "Noto Sans KR", sans-serif;
        }
        .topbar {
            background-color: #3f51b5;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .container {
            display: flex;
            height: calc(100vh - 50px);
        }
        .sidebar {
            width: 200px;
            background-color: #f1f1f1;
            padding-top: 20px;
        }
        .sidebar a {
            display: block;
            padding: 12px 20px;
            text-decoration: none;
            color: #333;
            border-bottom: 1px solid #ddd;
        }
        .sidebar a:hover {
            background-color: #ddd;
        }
        .main {
            flex-grow: 1;
            padding: 20px;
            background-color: #ffffff;
        }
    </style>
</head>
<body>
	<div class="topbar">관리자 이름 | 로그아웃</div>
    <div class="container">
        <div class="sidebar">
            <a href="#" onclick="loadContent('/admin/users')">사용자 관리</a>
            <a href="#" onclick="loadContent('/admin/appointments')">예약 관리</a>
            <a href="#" onclick="loadContent('/admin/medical')">진료 관리</a>
        </div>

        <div class="main" id="main-content">
			<!--  초기화면 사용자 목록  -->
        </div>
    </div>
</body>
</html>
