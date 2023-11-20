package com.yyc.user_management.app;

import java.util.Scanner;
import com.yyc.user_management.view.UserView;

public class Application01 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.println("1. 회원가입 \n2. 회원관리\n3. 로그인");
        int choice = sc.nextInt();

        switch (choice){
            // 회원가입 프로그램
            case 1: UserView.userRegisterProgram(); break;

            // 회원관리 프로그램
            case 2: UserView.userManagementProgram();break;
            // 로그인 - 회원인증
            case 3: UserView.userLoginProgram();break;
            default: break;
        }



    }
}
