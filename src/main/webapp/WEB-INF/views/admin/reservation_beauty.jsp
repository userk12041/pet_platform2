<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<html>
<head>
    <style>
        #container {
            display: flex;
            min-height: 100vh;
        }
        #content {
            flex-grow: 1;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            border: 1px solid #ccc;
            text-align: center;
        }
		
		.modal {
		    display: none;
		    position: fixed;
		    z-index: 1000;
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    overflow: auto;
		    background-color: rgba(0,0,0,0.4);
		}
		
		.modal-content {
		    background-color: #fff;
		    margin: 10% auto;
		    padding: 20px;
		    border-radius: 8px;
		    width: 600px;
			max-width: 90%;
		    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
		}

		.close {
		    float: right;
		    font-size: 24px;
		    font-weight: bold;
		    cursor: pointer;
		}
		.modal-details {
		    background-color: #f9f9f9;
		    padding: 20px;
		    border-radius: 10px;
		    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
		    font-size: 17px;
		}

		.info-row {
		    display: flex;
		    gap: 10px;
		    margin-bottom: 12px;
		    font-weight: normal;
		}

		.info-row strong {
		    width: 100px;
		    color: #333;
		}

		.info-row span {
		    color: #555;
		}

		.info-block {
		    margin-bottom: 18px;
		}

		.info-block strong {
		    display: block;
		    margin-bottom: 6px;
		    color: #333;
		    font-weight: bold;
		}

		.info-text {
		    background-color: #fff;
		    border: 1px solid #ccc;
		    padding: 10px 12px;
		    border-radius: 6px;
		    white-space: pre-wrap;
		    line-height: 1.6;
		    color: #444;
		}
    </style>
</head>
<body>
	<div id="container">
	    <!-- 사이드바 -->
	    <jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />
	    <!-- 콘텐츠 -->
	    <div id="content">
	        <h2>미용 예약 목록</h2>
	        <table>
	            <tr>
	                <th>예약 번호</th>
	                <th>펫 이름</th>
	                <th>종류</th>
	                <th>예약날짜/시간</th>
	                <th>예약자 성명</th>
	                <th>전화번호</th>
					<td>상세</td>
	                <th>상태</th>
	                <th>승인/거절</th>
	                <th>삭제</th>
	            </tr>
	            <c:forEach var="beauty" items="${reservationBeauty}" varStatus="status">
	                <tr>
	                    <td>${beauty.id}</td>
	                    <td>${beauty.name}</td>
	                    <td>${beauty.type}</td>
						<td>
						  <fmt:formatDate value="${beauty.reservation_day}" pattern="yy.MM.dd" />
						  ${beauty.reservation_time}
						</td>
	                    <td>${beauty.user_name}</td>
	                    <td>${beauty.user_phone}</td>
						<td><button onclick="openModal(${status.index})">상세보기</button></td>
	                    <td>${beauty.state}</td>
	                    <td>
							<form method="post" action="${pageContext.request.contextPath}/admin/reservation/beauty/approve" style="display:inline;">
							  <input type="hidden" name="id" value="${beauty.id}" />
							  <button type="submit">승인</button>
							</form>
	
							<form method="post" action="${pageContext.request.contextPath}/admin/reservation/beauty/reject" style="display:inline;">
							  <input type="hidden" name="id" value="${beauty.id}" />
							  <button type="submit">거절</button>
							</form>
	
	                    </td>
						<td>
							<form method="post" action="${pageContext.request.contextPath}/admin/reservation/beauty/delete" style="display:inline;" 
							      onsubmit="return confirm('정말 삭제하시겠습니까?');">
							  <input type="hidden" name="id" value="${beauty.id}" />
							  <button type="submit">삭제</button>
							</form>
						</td>
	                </tr>
					<div id="modal-${status.index}" class="modal">
					    <div class="modal-content">
					        <span class="close" onclick="closeModal(${status.index})">&times;</span>
					        <h3>예약 상세 정보</h3>
							<div class="modal-details">
								<div class="info-row">
								    <strong>번호:</strong><span>${beauty.id}</span>
								</div>
							    <div class="info-row">
							        <strong>펫 이름:</strong><span>${beauty.name}</span>
							    </div>
							    <div class="info-row">
							        <strong>종류:</strong><span>${beauty.type}</span>
							    </div>
							    <div class="info-row">
							        <strong>성별:</strong><span>${beauty.gender}</span>
							    </div>
							    <div class="info-row">
							        <strong>나이:</strong><span>${beauty.age}</span>
							    </div>
							    <div class="info-row">
							        <strong>무게:</strong><span>${beauty.weight} (kg)</span>
							    </div>
								<div class="info-block">
								    <strong>특이사항</strong>
								    <div class="info-text">${beauty.note}</div>
								</div>
							    <div class="info-row">
							        <strong>예약자 성명:</strong><span>${beauty.id}</span>
							    </div>
							    <div class="info-row">
							        <strong>전화번호:</strong><span>${beauty.id}</span>
							    </div>
							</div>
					    </div>
					</div>
	            </c:forEach>
	        </table>
	    </div>
	</div>
	<script>
	    function openModal(index) {
	        document.getElementById("modal-" + index).style.display = "block";
	    }
	
	    function closeModal(index) {
	        document.getElementById("modal-" + index).style.display = "none";
	    }
	
	    // 모달 외부 클릭 시 닫기
	    window.onclick = function(event) {
	        document.querySelectorAll('.modal').forEach(function(modal) {
	            if (event.target === modal) {
	                modal.style.display = "none";
	            }
	        });
	    }
	</script>
</body>
</html>
