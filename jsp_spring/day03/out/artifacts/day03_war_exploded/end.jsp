<%--
  Created by IntelliJ IDEA.
  User: jungwoo
  Date: 2021/11/18
  Time: 7:32 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%request.setCharacterEncoding("UTF-8");%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1">
    <tr>
        <td>ID</td>
        <td><%=request.getParameter("uid")%></td>
    </tr>
    <tr>
        <td>관심언어</td>
        <td><%=request.getParameter("ln")%></td>
    </tr>
    <tr>
        <td>좋아하는 과일</td>
        <td>
            <%
            String datas[] = request.getParameterValues("ff");
            if(datas!=null) {
                for (String data : datas) {
                    out.println(data+"<br>");
                }
            }
            else{
                out.println("좋아하는 과일이 없습니다");
            }
            %>
        </td>
    </tr>
    <tr>
        <td colspan="2"><input type="submit" value="보내기"></td>
    </tr>
</table>
</body>
</html>
