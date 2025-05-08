<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>관리자 페이지</title>
	
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
	<script>
			// 페이지 불러오기
	        function loadContent(url) {
	            fetch(url)
	                .then(response => response.text())
	                .then(html => {
	                    document.getElementById("main-content").innerHTML = html;
	                });
	        }
			// 페이지 처음 열릴 때 사용자 정보 로딩
			window.onload = function () {
			    loadContent('/admin/users'); 
			};
			// 이벤트 위임
			// 
			document.getElementById("main-content").addEventListener('click', function(event) {
			    if (event.target.classList.contains('edit-btn')) {
			        const user_id = event.target.dataset.userId;
			        editUser(user_id);
			    } else if (event.target.classList.contains('delete-btn')) {
			        const user_id = event.target.dataset.userId;
			        deleteUser(user_id);
			    }
			});
	        function editUser(user_id) {
	            alert(user_id + " 수정 기능 구현 예정");
	        }

	        function deleteUser(user_id) {
	            if (confirm("정말로 삭제하시겠습니까?")) {
	                fetch("/admin/users/delByAdmin/" + user_id, {
	                    method: 'DELETE'
	                })
	                .then(res => res.text())
	                .then(result => {
	                    alert(result);
	                    location.reload();
	                });
	            }
	        }
	    </script>
</body>
</html>
