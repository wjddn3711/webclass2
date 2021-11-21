<%--
  Created by IntelliJ IDEA.
  User: jungwoo
  Date: 2021/11/18
  Time: 9:15 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int cnt = (int) application.getAttribute("cnt");
    cnt++; // 방문 할때마다 cnt를 증가시킨다
    application.setAttribute("cnt",cnt); //데이터의 변경사항이 유지됨
%>
<%=application.getAttribute("uid")%>님, 투데이 방문자수는 <%=cnt%>명입니다.
</body>
</html>
