<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
	<div class="form-group">
	    <label>이름:</label>
	    <span>${pet.name}</span>
	</div>
	<div class="form-group">
	    <label>견종:</label>
	    <span>${pet.type}</span> <!-- 여기 수정! -->
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

	    <input type="hidden" name="petId" value="${pet.id}">
	    <input type="submit" value="예약하기" class="submit-btn">
	</form>
</body>
</html>