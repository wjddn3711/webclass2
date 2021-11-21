<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: jungwoo
  Date: 2021/11/21
  Time: 4:01 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8");
//    if(session.getAttribute("uid")==null){ --> 이미 로그인 된 상태에서 다른 id 로 로그인하여도 세션에 uid 가 저장되어 있어 이전 id 가 남음
    if(request.getParameter("uid")!=null){
        session.setAttribute("uid", request.getParameter("uid")); // request로 받은 uid 를 세션에 저장
    }

%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="sns_add.jsp">
    <%=session.getAttribute("uid")%>님: &nbsp;&nbsp;<input type="text" name="msg"> <input type="submit" value="글작성">
</form>
<hr>
<%--서버 스코프에 저장되어 다른이들의 작성된 게시물도 볼 수 있게 한다 --%>
<%
    ArrayList<String>datas = (ArrayList<String>) application.getAttribute("datas");
    // 목록이 존재할때에는 그 목록 내용을 출력해주시고, 존재 XXX, "채팅 기록이 없습니다!"를 출력
    if(datas !=null){
        out.println("<ol>");
        for (String data : datas) {
            out.println("<li>"+data+"</li><br>");
        }
        out.println("</ol>");
    }
    else{
        out.println("채팅 기록이 없습니다!");
    }
%>
</body>
</html>
