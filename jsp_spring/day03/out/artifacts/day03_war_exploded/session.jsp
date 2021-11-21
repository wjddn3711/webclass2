<%--
  Created by IntelliJ IDEA.
  User: jungwoo
  Date: 2021/11/18
  Time: 8:39 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if(session.isNew()){ // 만약 세션이 처음이라면
        out.println("<script>alert('새로운 세션!')</script>");
        session.setMaxInactiveInterval(1); // 세션의 유지시간 (default : 30분)
        session.setAttribute("user","작은티모"); // user 라는 값에 작은티모를 설정
    }
%>
<h1>브라우저 단위로 데이터를 저장하는 session 내장객체</h1>
<%=session.getAttribute("user")%>님, 환영합니다!
</body>
</html>
