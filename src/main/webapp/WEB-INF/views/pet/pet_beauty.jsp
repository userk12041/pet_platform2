<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>미용 예약</title>

    <style>
        .reservation-form {
            display: flex;
            justify-content: space-between;
            max-width: 1500px;
            margin: 30px auto;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            gap: 30px;
        }

        .left-section {
            flex: 2;
        }

        .reservation-section {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
        }
		.reservation-section input[type="date"] {
		    width: 80%; /* 더 넓게 */
		    padding: 12px;
		    font-size: 16px;
		    border: 1px solid #ccc;
		    border-radius: 8px;
		    box-sizing: border-box;
		}

		.time-slot-wrapper {
		    width: 100%;
		}

		#timeSlots {
		    display: grid;
		    grid-template-columns: repeat(3, 1fr);
		    gap: 10px;
		    max-width: 400px;
		    margin-top: 10px;
		}

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        .form-group span {
            display: block;
            padding: 10px;
            background: #f0f0f0;
            border-radius: 8px;
            margin-top: 5px;
        }

        .form-group input[type="text"],
        .form-group textarea,
        .form-group input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .time-button {
			padding: 15px 0;
			font-size: 16px;
			width: 100px;
            border: 1px solid #ccc;
            border-radius: 8px;
            cursor: pointer;
            background-color: #f0f0f0;
            transition: all 0.3s ease;
        }

        .time-button:hover:not(:disabled) {
            background-color: #d0ebff;
            border-color: #5bd3ff;
        }

        .time-button:disabled {
            background-color: #e0e0e0;
            color: #aaa;
            cursor: not-allowed;
        }

        .time-button.selected {
            background-color: #5bd3ff;
            color: white;
            border: 2px solid #5bd3ff;
        }

        .submit-btn {
			width: 80%;
            padding: 12px 30px;
            background-color: #5bd3ff;
            border: none;
            color: white;
            font-size: 16px;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
			text-align: center;
        }

        .submit-btn:hover {
            background-color: #3cb5de;
        }
    </style>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/pet/beautyReservation" class="reservation-form">
    <!-- 왼쪽: 펫 정보 + 입력폼 -->
    <div class="left-section">
		<h1>미용 예약</h1>
		<hr>
		<h2>고객</h2>
		<div class="form-group">
		    <label>이름</label>
		    <span>${my_info.user_name}</span>
		</div>
		<div class="form-group">
		    <label>연락처</label>
		    <span>${my_info.phone_number}</span>
		</div>
		<hr>
		<h2>펫</h2>
        <div class="form-group">
            <label>이름</label>
            <span>${pet.name}</span>
        </div>
        <div class="form-group">
            <label>견종</label>
            <span>${pet.type}</span>
        </div>
        <div class="form-group">
            <label>성별</label>
            <span>${pet.gender}</span>
        </div>
        <div class="form-group">
            <label>나이</label>
            <span>${pet.age}</span>
        </div>

        <div class="form-group">
            <label for="weight">몸무게 (kg) <mark>*필수입력*</mark></label>
            <input type="text" name="weight" id="weight" required>
        </div>

        <div class="form-group">
            <label for="style">미용 스타일</label>
            <input type="text" name="style" id="style">
        </div>

        <div class="form-group">
            <label for="note">특이사항</label>
            <textarea name="note" id="note" rows="3" placeholder="입질,사나움,공격성 등"></textarea>
        </div>

        <!-- 숨겨진 값 -->
        <input type="hidden" name="reservationDay" id="selectedDay">
        <input type="hidden" name="reservationTime" id="selectedTime">
        <input type="hidden" name="petId" value="${pet.id}">
		<input type="hidden" name="userName" value="${my_info.user_name}">
		<input type="hidden" name="userPhone" value="${my_info.phone_number}">
    </div>

    <!-- 오른쪽: 예약 파트 -->
    <div class="reservation-section">
        <div class="form-group">
            <label for="reservationDay">예약 날짜</label>
            <input type="date" id="reservationDay" required>
        </div>

        <h3 style="text-align: right;">시간 선택</h3>
        <div id="timeSlots">
            <!-- 버튼들은 JS로 자동 생성 -->
        </div>

        <input type="submit" value="예약하기" class="submit-btn">
    </div>
</form>

<script>
    const timeContainer = document.getElementById('timeSlots');
    const reservationDayInput = document.getElementById('reservationDay');
    const selectedDayInput = document.getElementById('selectedDay');
    const selectedTimeInput = document.getElementById('selectedTime');

    const times = [
        "09:00", "10:00", "11:00", "12:00",
        "13:00", "14:00", "15:00", "16:00", "17:00"
    ];

    // 시간 버튼 만들기 (초기에는 다 활성화)
    const buttons = [];

    times.forEach(time => {
        const btn = document.createElement('button');
        btn.type = "button";
        btn.classList.add('time-button');
        btn.textContent = time;

        // 클릭 시 선택 처리
        btn.addEventListener('click', () => {
            selectedTimeInput.value = time;
            buttons.forEach(({btn}) => btn.classList.remove('selected'));
            btn.classList.add('selected');
        });

        timeContainer.appendChild(btn);
        buttons.push({btn, time});
    });

    // 오늘 날짜를 min으로 설정해서 과거 날짜 선택 막기
    const todayStr = new Date().toISOString().split('T')[0];
    reservationDayInput.setAttribute('min', todayStr);

    // 날짜 선택 시 숨은 값 세팅 + 버튼 상태 업데이트
    reservationDayInput.addEventListener('change', function() {
        selectedDayInput.value = this.value;

        const selectedDate = new Date(this.value);
        selectedDate.setHours(0, 0, 0, 0);  // 날짜만 비교

        const now = new Date();
        const todayMidnight = new Date();
        todayMidnight.setHours(0, 0, 0, 0);  // 오늘 자정

        buttons.forEach(({btn, time}) => {
            const hour = parseInt(time.split(':')[0], 10);

            if (selectedDate < todayMidnight) {
                // 과거 날짜면 막기
                btn.disabled = true;
            } else if (
                selectedDate.getTime() === todayMidnight.getTime() &&
                now.getHours() + 1 > hour
            ) {
                // 오늘 + 현재 시간 이후만 가능
                btn.disabled = true;
            } else {
                btn.disabled = false;
            }
        });
    });
</script>
</body>
</html>
