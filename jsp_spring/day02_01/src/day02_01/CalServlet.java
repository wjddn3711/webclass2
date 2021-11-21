package day02_01;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalServlet", value = "/CalServlet")
public class CalServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int num1, num2, res;
        String op;

        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        num1 = Integer.parseInt(request.getParameter("num1"));
        num2 = Integer.parseInt(request.getParameter("num2"));
        op =request.getParameter("op");
        // Calc클래스가 res를 멤버변수로 가짐 -> Calc 객체가 필요!

        // 1. 1차적인 에러 xxx
        // 2. 기능수행 o
        // 3. 코드가독성 및 효율성 향상
        Calc calc = new Calc(num1,num2,op);
        res = calc.getRes();



        PrintWriter out = response.getWriter();
        out.println("<HTML>");
        out.println("<BODY>");
        out.println("<h1>"+num1+op+num2+"입니다</h1>");
        out.println("<h1>계산결과는 "+res+"입니다</h1>");
        out.println("</BODY>");
        out.println("</HTML>");
    }

}

