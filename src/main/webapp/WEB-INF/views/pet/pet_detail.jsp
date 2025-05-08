<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>펫 상세 정보</title>
    <style>
        body {
            background: linear-gradient(to right, #ffffff, #dff6ff, #ffffff);
            font-family: 'Noto Sans KR', sans-serif;
            padding: 50px;
        }

        h2 {
            text-align: center;
            color: #5bd3ff;
            margin-bottom: 20px;
        }

        table {
            width: 60%;
            margin: auto;
            border-collapse: collapse;
            background-color: #eef6f9;
            box-shadow: 0 6px 12px rgba(0,0,0,0.1);
            border-radius: 15px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #dff6ff;
            color: #333;
            width: 25%;
        }

        img {
            max-width: 200px;
            max-height: 200px;
            border-radius: 10px;
        }

        .btn-wrapper {
            text-align: center;
            margin-top: 30px;
        }

		.btn-common {
		    display: inline-block;
		    color: white;
		    padding: 10px 25px;
		    margin: 0 10px;
		    border: none;
		    border-radius: 20px;
		    font-size: 15px;
		    text-decoration: none;
		    cursor: pointer;
		}

        .btn-blue {
		    background-color: #5bd3ff;
		}
		.btn-blue:hover {
		    background-color: #28abfc;
		}
		
		.btn-red {
		    background-color: #ff4d4d;
		}
		.btn-red:hover {
		    background-color: #cc0000;
		}
    </style>
</head>
<body>
<h2>펫 상세 정보</h2>

<table>
    <tr>
        <th>이름</th>
        <td>${pet.name}</td>
    </tr>
    <tr>
        <th>성별</th>
        <td>${pet.gender}</td>
    </tr>
    <tr>
        <th>종류</th>
        <td>${pet.type}</td>
    </tr>
    <tr>
        <th>나이</th>
        <td>${pet.age}</td>
    </tr>
    <tr>
        <th>설명</th>
        <td>${pet.description}</td>
    </tr>
</table>

<div class="btn-wrapper">
    <a href="${pageContext.request.contextPath}/pet/update/${pet.id}" class="btn-common btn-blue">수정하기</a>
    <a href="${pageContext.request.contextPath}/pet/list" class="btn-common btn-blue">목록으로</a>
    <form action="${pageContext.request.contextPath}/pet/delete/${pet.id}" method="post" style="display: inline;">
    	<input type="submit" value="삭제하기" onclick="return confirm('정말 삭제하시겠습니까?');" class="btn-common btn-red">
    </form>
</div>
</body>
</html>
