<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>미용 예약</title>
	
    <style>
        .time-button {
            padding: 10px 20px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
            background-color: #f0f0f0;
            transition: 0.3s;
        }
        .time-button:disabled {
            background-color: #e0e0e0;
            color: #aaa;
            cursor: not-allowed;
        }
        /* 선택된 버튼 스타일 */
        .time-button.selected {
            background-color: #5bd3ff;
            color: white;
            border: 2px solid #5bd3ff;
        }
    </style>
</head>
<body>
    <div class="form-group">
        <label>이름:</label>
        <span>${pet.name}</span>
    </div>
    <div class="form-group">
        <label>견종:</label>
        <span>${pet.type}</span>
    </div>
    <div class="form-group">
        <label>성별:</label>
        <span>${pet.gender}</span>
    </div>
    <div class="form-group">
        <label>나이:</label>
        <span>${pet.age}</span>
    </div>
    <form method="post" action="${pageContext.request.contextPath}/pet/beautyReservation">
        <div class="form-group">
            <label for="weight">몸무게 (kg):</label>
            <input type="text" name="weight" id="weight" required>
        </div>

        <div class="form-group">
            <label for="style">미용 스타일:</label>
            <input type="text" name="style" id="style" required>
        </div>

        <div class="form-group">
            <label for="note">특이사항:</label>
            <textarea name="note" id="note" rows="3"></textarea>
        </div>
        
        <!-- 숨겨진 날짜/시간 값 -->
        <input type="hidden" name="reservationDay" id="selectedDay">
        <input type="hidden" name="reservationTime" id="selectedTime">

        <!-- 날짜 선택 -->
        <div class="form-group">
            <label for="reservationDay">예약 날짜:</label>
            <input type="date" id="reservationDay" required>
        </div>

        <!-- 시간 버튼 UI -->
        <div id="timeSlots">
            <h3>시간 선택:</h3>
            <!-- 버튼들은 JS로 자동 생성 -->
        </div>

        <input type="hidden" name="petId" value="${pet.id}">
        <input type="submit" value="예약하기" class="submit-btn">
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

                // 이전에 선택된 버튼 해제
                buttons.forEach(({btn}) => btn.classList.remove('selected'));

                // 현재 선택된 버튼만 강조
                btn.classList.add('selected');
            });

            timeContainer.appendChild(btn);
            buttons.push({btn, time});  // 버튼 배열에 저장해둠
        });

        // 오늘 날짜를 min으로 설정해서 과거 날짜 선택 막기
        const todayStr = new Date().toISOString().split('T')[0];
        reservationDayInput.setAttribute('min', todayStr);

        // 날짜 선택 시 숨은 값 세팅 + 버튼 상태 업데이트
		reservationDayInput.addEventListener('change', function() {
		    selectedDayInput.value = this.value;

		    const selectedDate = new Date(this.value);
		    selectedDate.setHours(0, 0, 0, 0);  // 날짜만 비교하도록 세팅

		    const now = new Date();
		    const todayMidnight = new Date();
		    todayMidnight.setHours(0, 0, 0, 0);  // 오늘 자정 기준

		    buttons.forEach(({btn, time}) => {
		        const hour = parseInt(time.split(':')[0], 10);

		        if (selectedDate < todayMidnight) {
		            // 과거 날짜면 다 막음
		            btn.disabled = true;
		        } else if (
		            selectedDate.getTime() === todayMidnight.getTime() &&
		            now.getHours() + 1 > hour
		        ) {
		            // 오늘 날짜 + 현재 시각 기준으로 막음
		            btn.disabled = true;
		        } else {
		            // 내일 이후는 전부 가능
		            btn.disabled = false;
		        }
		    });
		});
    </script>
</body>
</html>