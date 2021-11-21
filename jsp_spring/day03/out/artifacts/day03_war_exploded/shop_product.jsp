<%--
  Created by IntelliJ IDEA.
  User: jungwoo
  Date: 2021/11/18
  Time: 9:30 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.setAttribute("uid",request.getParameter("uid"));
    // 가장 먼저해야하는 행위이기 때문에 맨위로 위치
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--request 이기 때문에 스코프가 좁기 때문에 세션을 사용한다. request는 다음페이지에 죽는다 --%>
<%=session.getAttribute("uid")%>님, 환영합니다!<br>
<h1>상품 목록</h1>
<hr>
<form action="shop_add.jsp" method="post">
    <select name="product">
        <option>티모</option>
        <option>피즈</option>
        <option>일라오이</option>
        <option>미스포츈</option>
        <option>케이틀린</option>
    </select>
    <input type="submit" value="장바구니에 추가">
</form>
<hr>
<a href="shop_result.jsp">결제하기</a>
</body>
</html>
