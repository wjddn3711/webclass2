package day02_01;

import java.io.PrintWriter;

public class Calc {
    int res; // 결과값을 멤버변수로

    public int getRes() {
        return res;
    }

    // 생성자를 정의 -> 기본 생성자 형태가 아닌 형태를 사용하고 싶음!
    public Calc(int num1,int num2,String op){
        // 낮은 결합도 높은 응집도
        if(op.equals("-")){
            res = num1-num2;
        }
        else{
            res = num1+num2;
        }
    }

}
