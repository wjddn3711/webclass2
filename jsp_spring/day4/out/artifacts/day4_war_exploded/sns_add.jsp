<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: jungwoo
  Date: 2021/11/21
  Time: 4:01 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("UTF-8"); // 한글이 깨지는거 방지

    String msg = request.getParameter("msg");
    ArrayList<String> datas = (ArrayList<String>) application.getAttribute("datas");
    if(datas==null){
        datas = new ArrayList<>();
        application.setAttribute("datas", datas);
    }
    Date date = new Date();
    datas.add(session.getAttribute("uid")+"님으로 부터"+msg+"   ["+date+"]");

    response.sendRedirect("sns_list.jsp"); // 데이터 처리가 완료되면 sns_list로 넘어가도록 한다 버튼을 눌러 이동하는것과 같은 개념
%>
