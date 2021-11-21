<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: jungwoo
  Date: 2021/11/18
  Time: 9:30 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>선택한 상품 목록</h1>
<hr>
<%
    // 현재 장바구니가 없다면, 500에러가 발생!
    // 장바구니에 담긴 물품이 없다면(==즉, 장바구니가 없다면)
    // "선택한 상품이 없습니다!" 라는 문구가 화면에 출력될 수 있도록
    ArrayList datas = (ArrayList) session.getAttribute("datas");
    if(datas!=null){
        out.println("<ol>");
        for (Object data : datas) {
            out.println("<li>"+data+"</li><br>");
        }
        out.println("</ol>");
    }
    else{
        out.println("<h3>선택한 상품이 없습니다!</h3>");
    }

%>

</body>
</html>
