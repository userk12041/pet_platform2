<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Medical Records</title>
</head>
<body>
    <h1>모든 의료 기록</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>반려동물 이름</th>
                <th>진료일</th>
                <th>담당 수의사 ID</th>
                <th>진료 내용</th>
                <th>처방 내용</th>
                <th>비고</th>
                <th>기록자 ID</th>
                <th>생성일시</th>
                <th>수정일시</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="record" items="${mediList}">
                <tr>
                    <td>${record.id}</td>
                    <td>${record.pet_name}</td>
                    <td><fmt:formatDate value="${record.treatment_date}" pattern="yyyy-MM-dd"/></td>
                    <td>${record.doctor_id}</td>
                    <td>${record.content}</td>
                    <td>${record.prescription}</td>
                    <td>${record.notes}</td>
                    <td>${record.user_id}</td>
                    <td><fmt:formatDate value="${record.created_at}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td><fmt:formatDate value="${record.updated_at}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>