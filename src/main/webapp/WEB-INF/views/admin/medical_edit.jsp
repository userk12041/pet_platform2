<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        input, textarea {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
			font-size: 14px;
        }
		input[readonly], textarea[readonly], input:disabled, textarea:disabled {
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
		    padding: 5px 15px;
		    font-size: 16px;
		    border-radius: 6px;
		    cursor: pointer;
		}
    </style>
</head>
<body>
	<div id="container">
	    <!-- 사이드바 -->
	    <jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />
	
	    <!-- 메인 콘텐츠 -->
	    <div id="content">
	        <div class="form-box">
				<div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
				    <h2 id="pageTitle" style="margin: 0;">진료 기록</h2>
				    <button type="button" id="editBtn">수정</button>
				</div>
	            
	            <form id="medicalForm" method="post" action="${pageContext.request.contextPath}/admin/medical/update">
	                <input type="hidden" name="id" value="${medical.id}" />
	
	                <label>펫 이름</label>
	                <input type="text" name="pet_name" value="${medical.pet_name}" readonly />
	
	                <label>진료일자</label>
	                <input type="date" name="treatment_date" value="${medical.treatment_date}" readonly />
	
	                <label>담당 수의사 ID</label>
	                <input type="text" name="doctor_id" value="${medical.doctor_id}" readonly/>
	
	                <label>진료내용</label>
	                <textarea name="content" rows="3" readonly>${medical.content}</textarea>
	
	                <label>처방</label>
	                <textarea name="prescription" rows="3" readonly>${medical.prescription}</textarea>
	
	                <label>특이사항</label>
	                <textarea name="notes" rows="3" readonly>${medical.notes}</textarea>
	
	                <label>유저 ID</label>
	                <input type="text" name="user_id" value="${medical.user_id}" readonly />
	
	                <label>작성일자</label>
	                <input type="text" name="created_at" value="${medical.created_at}" readonly />
	
					<div class="btn-wrapper">
						<div style="flex: 1;">
						    <button type="button" onclick="history.back()">← 목록으로</button>
						</div>

				       	<button type="submit" id="saveBtn" style="display: none;">저장</button>
					   	<button type="button" id="cancelBtn" style="display: none;">취소</button>
				   </div>
	            </form>
	        </div>
	    </div>
	</div>
	<script>
	    document.addEventListener("DOMContentLoaded", function () {
	        const editBtn = document.getElementById("editBtn");
	        const saveBtn = document.getElementById("saveBtn");
	        const form = document.getElementById("medicalForm");
			const cancelBtn = document.getElementById("cancelBtn");
	        const inputs = form.querySelectorAll("input, textarea");
			const title = document.getElementById("pageTitle");

			const originalValues = {};
			
			// 수정 버튼 클릭
	        editBtn.addEventListener("click", function () {
	            inputs.forEach(input => {
	                if (input.name !== "user_id" && input.name !== "treatment_date" && input.name !== "created_at") {
						originalValues[input.name] = input.value;
	                    input.removeAttribute("readonly");
	                    input.removeAttribute("disabled");
	                }
	            });
	            editBtn.style.display = "none";
	            saveBtn.style.display = "inline-block";
				cancelBtn.style.display = "inline-block";
				
				if (!title.textContent.includes("수정")) {
	                title.textContent += " 수정";
	            }
	        });
			
			// 취소 버튼 클릭
	        cancelBtn.addEventListener("click", function () {
	            inputs.forEach(input => {
	                if (originalValues.hasOwnProperty(input.name)) {
	                    input.value = originalValues[input.name];
	                    input.setAttribute("readonly", "readonly");
	                }
	                if (input.name === "user_id" || input.name === "treatment_date") {
	                    input.setAttribute("readonly", "readonly");
	                }
	            });

	            editBtn.style.display = "inline-block";
	            saveBtn.style.display = "none";
	            cancelBtn.style.display = "none";
				
				title.textContent = "진료 기록";
	        });
	    });
	</script>
</body>
</html>
