<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        .header-ul {
            display: flex;
            list-style: none;
            justify-content: end;
            margin-top: 20px;
            margin-right: 10px;
        }

        .header-li {
            padding: 0px 20px;
            border-right: 1px solid #0000001a;
            font-size: 12px;
            cursor: pointer;
        }

        .header-li a {
            text-decoration: none;
            color: black;
        }

        .logo-text {
            font-size: 20px;
            font-weight: bold;
            color: #2c3e50;
        }
    </style>
</head>
<body>
<ul class="header-ul">
<%
    String id = (String)session.getAttribute("id");
    if(id != null && !id.equals("")) {
%>
    <li class="header-li" onclick="location.href='<%= request.getContextPath() %>/main'"><span class="logo-text">마이펫 메디컬센터</span></li>
    <li class="header-li" onclick="location.href='<%= request.getContextPath() %>/mypage_info'">마이페이지</li>
    <li class="header-li" onclick="location.href='<%= request.getContextPath() %>/reservation'">예약 확인</li>
<%
    if("admin".equals(id)) {
%>
    <li class="header-li" onclick="location.href='<%= request.getContextPath() %>/management'">관리자 페이지</li>
<%
    }
%>
    <li class="header-li" onclick="location.href='<%= request.getContextPath() %>/logout'">로그아웃</li>
    <li class="header-li" onclick="location.href='<%= request.getContextPath() %>/support'">고객센터</li>
<%
    } else {
%>
    <li class="header-li" onclick="location.href='<%= request.getContextPath() %>/main'"><span class="logo-text">마이펫 메디컬센터</span></li>
    <li class="header-li" onclick="alert('로그인이 필요합니다.')">마이페이지</li>
    <li class="header-li" onclick="alert('로그인이 필요합니다.')">예약 확인</li>
    <li class="header-li" onclick="location.href='<%= request.getContextPath() %>/login'">로그인</li>
    <li class="header-li" onclick="location.href='<%= request.getContextPath() %>/register'">회원가입</li>
    <li class="header-li" onclick="alert('로그인이 필요합니다.')">고객센터</li>
<%
    }
%>
</ul>

</body>
</html>
