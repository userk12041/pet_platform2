<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>FAQ | 마이펫 메디컬센터</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f7f9fb;
            margin: 0;
            padding: 0;
        }

        .faq-wrapper {
            max-width: 800px;
            margin: 60px auto;
            background-color: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #5bd3ff;
            font-size: 26px;
            margin-bottom: 40px;
        }

        .faq-item {
            border-bottom: 1px solid #e0e0e0;
            padding: 20px 0;
        }

        .faq-question {
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            color: #333;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .faq-answer {
            margin-top: 15px;
            font-size: 15px;
            color: #444;
            line-height: 1.7;
            display: none;
            white-space: pre-line;
        }

        .faq-question:hover {
            color: #28abfc;
        }

        .arrow {
            transition: transform 0.2s;
        }

        .arrow.rotate {
            transform: rotate(90deg);
        }
    </style>

    <script>
        function toggleFaq(index) {
            const answer = document.getElementById('faq-answer-' + index);
            const arrow = document.getElementById('faq-arrow-' + index);
            const isVisible = answer.style.display === 'block';

            answer.style.display = isVisible ? 'none' : 'block';
            arrow.classList.toggle('rotate', !isVisible);
        }
    </script>
</head>
<body>

<div class="faq-wrapper">
    <h2>자주 묻는 질문 (FAQ)</h2>

    <div class="faq-item">
        <div class="faq-question" onclick="toggleFaq(0)">
            진료는 예약 없이 가능한가요?
            <span class="arrow" id="faq-arrow-0">▶</span>
        </div>
        <div class="faq-answer" id="faq-answer-0">
            평일은 예약 없이 방문하셔도 진료가 가능합니다.  
            다만, 주말이나 공휴일은 대기 시간이 길 수 있으니 예약을 권장드립니다.
        </div>
    </div>

    <div class="faq-item">
        <div class="faq-question" onclick="toggleFaq(1)">
            예방접종은 어떤 종류가 있나요?
            <span class="arrow" id="faq-arrow-1">▶</span>
        </div>
        <div class="faq-answer" id="faq-answer-1">
            강아지의 경우 종합백신, 코로나, 켄넬코프, 광견병 등이 있으며  
            고양이의 경우 종합백신, 백혈병, 광견병 등이 있습니다.
        </div>
    </div>

    <div class="faq-item">
        <div class="faq-question" onclick="toggleFaq(2)">
            진료비는 어떻게 되나요?
            <span class="arrow" id="faq-arrow-2">▶</span>
        </div>
        <div class="faq-answer" id="faq-answer-2">
            간단한 상담은 무료이며, 기본 진료는 10,000원부터 시작됩니다.  
            정밀검사나 수술 등의 비용은 진료 후 설명드립니다.
        </div>
    </div>

    <div class="faq-item">
        <div class="faq-question" onclick="toggleFaq(3)">
            반려동물 보험은 적용되나요?
            <span class="arrow" id="faq-arrow-3">▶</span>
        </div>
        <div class="faq-answer" id="faq-answer-3">
            현재는 직접 적용은 불가하지만 진료 영수증 및 진단서를 발급해드려  
            보험 청구 시 제출하실 수 있습니다.
        </div>
    </div>

    <div class="faq-item">
        <div class="faq-question" onclick="toggleFaq(4)">
            입원 시 보호자가 방문할 수 있나요?
            <span class="arrow" id="faq-arrow-4">▶</span>
        </div>
        <div class="faq-answer" id="faq-answer-4">
            네, 면회는 가능하지만 과도한 스트레스를 피하기 위해  
            짧은 시간 동안만 제한적으로 진행됩니다.
        </div>
    </div>
	<div class="faq-item">
	    <div class="faq-question" onclick="toggleFaq(5)">
	        첫 방문인데 어떤 절차로 진료가 진행되나요?
	        <span class="arrow" id="faq-arrow-5">▶</span>
	    </div>
	    <div class="faq-answer" id="faq-answer-5">
	        접수 후 보호자와 상담을 진행한 뒤, 반려동물의 상태에 따라  
	        기본 진찰 → 검사 → 처치 순으로 진행됩니다.  
	        필요시 수의사 판단에 따라 추가 검사가 이루어질 수 있습니다.
	    </div>
	</div>

	<div class="faq-item">
	    <div class="faq-question" onclick="toggleFaq(6)">
	        수술은 언제 가능한가요?
	        <span class="arrow" id="faq-arrow-6">▶</span>
	    </div>
	    <div class="faq-answer" id="faq-answer-6">
	        수술은 대부분 평일 오전에 진행됩니다.  
	        정기 수술은 사전 예약이 필요하며, 긴급 수술은 수의사 판단 하에 즉시 시행됩니다.
	    </div>
	</div>

	<div class="faq-item">
	    <div class="faq-question" onclick="toggleFaq(7)">
	        중성화 수술 후 회복 기간은 얼마나 걸리나요?
	        <span class="arrow" id="faq-arrow-7">▶</span>
	    </div>
	    <div class="faq-answer" id="faq-answer-7">
	        보통 7일 이내로 회복되며, 수술 부위 보호를 위한 넥카라 착용이 필요합니다.  
	        수술 후 2~3일은 활동을 제한하고, 처방된 약을 꼭 복용시켜 주세요.
	    </div>
	</div>

	<div class="faq-item">
	    <div class="faq-question" onclick="toggleFaq(8)">
	        주차 공간이 있나요?
	        <span class="arrow" id="faq-arrow-8">▶</span>
	    </div>
	    <div class="faq-answer" id="faq-answer-8">
	        병원 건물 1층 및 지하에 전용 주차장이 마련되어 있습니다.  
	        주차권은 접수 시 말씀 주시면 무료로 처리해드립니다.
	    </div>
	</div>

	<div class="faq-item">
	    <div class="faq-question" onclick="toggleFaq(9)">
	        진료 기록을 받아볼 수 있나요?
	        <span class="arrow" id="faq-arrow-9">▶</span>
	    </div>
	    <div class="faq-answer" id="faq-answer-9">
	        요청하시면 진료차트, 검사결과지, 영상자료 등을  
	        출력 또는 메일로 전달해드릴 수 있습니다. 접수 데스크에 문의해주세요.
	    </div>
	</div>


</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
