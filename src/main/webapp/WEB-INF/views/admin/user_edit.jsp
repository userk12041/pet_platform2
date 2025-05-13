<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<html>
<head>
    <style>
		body{
			margin: 0;
		}
        #container {
            display: flex;
            min-height: 100vh;
        }
        #content {
            flex-grow: 1;
            padding: 20px;
			display: flex;
            justify-content: center;
            align-items: flex-start;
        }
		.form-box {
		    width: 600px;
		}
		form {
		    width: 100%;
		}
        label {
            display: block;
            margin-top: 10px;
			font-weight: bold;
        }
        input {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
			font-size: 14px;
        }
		input[readonly], input:disabled {
		    background-color: #f3f3f3;
		    color: #555;
		    cursor: default;
		}
		.btn-wrapper {
		    display: flex;
		    justify-content: space-between;
		    margin-top: 24px;
		}
		button {
		    padding: 8px 15px;
		    font-size: 16px;
		    border-radius: 6px;
		    cursor: pointer;
		}
		#saveBtn {
		    background-color: #28a745;
		    color: white;
		    border: none;
		}
		#cancelBtn {
		    background-color: #dc3545;
		    color: white;
		    border: none;
		}
		.list-btn {
		    background-color: #6c757d;
		    color: white;
		    border: none;
		}
    </style>
</head>
<body>
	<div id="container">
	    <jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />

	    <div id="content">
	        <div class="form-box">
				<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
				    <h2 id="pageTitle" style="margin: 0;">회원 정보 수정</h2>
				</div>

	            <form id="userForm" method="post" action="${pageContext.request.contextPath}/admin/user/update">

	                <label>아이디</label>
	                <input type="text" name="user_id" value="${user.user_id}" readonly/>

	                <label>이름</label>
	                <input type="text" name="user_name" value="${user.user_name}" />

	                <label>이메일</label>
	                <input type="text" name="email" value="${user.email}" />

	                <label>전화번호</label>
	                <input type="text" name="phone_number" value="${user.phone_number}" />

	                <label>주소</label>
	                <input type="text" name="address" value="${user.address}" />

	                <label>닉네임</label>
	                <input type="text" name="nickname" value="${user.nickname}" />

					<div class="btn-wrapper">
						<button type="button" class="list-btn" onclick="location.href='${pageContext.request.contextPath}/admin/user/list'">← 목록으로</button>
				       	<div>
				       		<button type="submit" id="saveBtn">저장</button>
							<button type="button" id="cancelBtn" onclick="location.href='${pageContext.request.contextPath}/admin/user/list'">취소</button>

				       	</div>
				   </div>
	            </form>
	        </div>
	    </div>
	</div>
</body>
</html>