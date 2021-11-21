<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: jungwoo
  Date: 2021/11/18
  Time: 9:30 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.ArrayList"%>
<%
    request.setCharacterEncoding("UTF-8");
    String product = request.getParameter("product");

    ArrayList<String> datas = (ArrayList<String>) session.getAttribute("datas");
    if(datas==null){ // 장바구니가 매번 생성되는것이 아니라 최초 장바구니에 상품을 추가할때만 1회 생성됨
        datas = new ArrayList<String>();
        session.setAttribute("datas",datas);
    }
    datas.add(product);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<script type="text/javascript">
    alert("<%=product%>가 장바구니에 추가되었습니다")
    history.go(-1);
</script>

</body>
</html>
