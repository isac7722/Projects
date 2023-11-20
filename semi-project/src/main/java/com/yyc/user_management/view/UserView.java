package com.yyc.user_management.view;

import com.yyc.user_management.controller.UserCtr;
import com.yyc.user_management.model.dao.UserDAO;
import com.yyc.user_management.model.dto.UserDTO;
import com.yyc.user_management.model.vo.UserVO;
import com.yyc.user_management.service.UserService;
import static com.yyc.user_management.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Objects;
import java.util.Scanner;

public class UserView {

    public  static void userManagementProgram(){
        Scanner sc = new Scanner(System.in);
        UserCtr userCtr = new UserCtr(new UserService("src/main/resources/mapper/user-query.xml"));

        System.out.println("회원관리 프로그램입니다.");
        System.out.println("1. 회원정보 조회 \n2. 회원정보 수정 \n3. 회원 탈퇴 \n4. 삭제");
        System.out.print("원하는 기능을 입력해주세요:");

        //1. 사용자가 원하는 기능을 선택함
        int choice = sc.nextInt();

        // 2. 선택에 따른 기능

        switch (choice){
                //2-1 회원정보 조회
            case 1:

                // 2-2 회원정보 수정
            case 2:

                // 2-3 회원 탈퇴
            case 3:

                // 프로그램 종료
            default:
        }

    }

    public static void viewUser(UserVO userInfo){
        if (Objects.isNull(userInfo)){
            System.out.println("조회중 오류가 발생됨");
        }else {
            System.out.println(userInfo);
        }
    }

    public static void userRegisterProgram(){
        UserCtr userCtr = new UserCtr(new UserService("src/main/resources/mapper/user-query.xml"));

        System.out.println("==========회원가입 화면===========");
        System.out.println(userCtr.registUser(registUser()));
    }

    public static void userLoginProgram(){
        UserCtr userCtr = new UserCtr(new UserService("src/main/resources/mapper/user-query.xml"));

        System.out.println("==========로그인 화면===========");
        userCtr.userLogin(userLogin());
    }


    public static UserDTO registUser(){
        UserDTO newUser = new UserDTO();
        Scanner sc = new Scanner(System.in);

        // 회원의 아이디 비밀번호 설정
        regisUserIdPassword(newUser);

        System.out.print("회원님의 이름을 입력해주세요: ");
        newUser.setUserName(sc.next());
        System.out.println("원하시는 닉네임을 입력해수세요: ");
        newUser.setUserNickname(sc.next());
        System.out.println("회원님의 생일을 입력해주세요: ");
        System.out.println("생일은 8자형식으로 입력해주세요: 예) 990130 ");
        newUser.setUserBirthday(sc.next());
        System.out.println("회원님의 성별을 입력해주세요: ");
        newUser.setGender(sc.next());
        System.out.println("회원님의 전화번호를 입력해주세요 (01012345678 의 형식으로 입력해주세요): ");
        newUser.setContactNo(sc.next());
        return newUser;
    }



    public static void regisUserIdPassword(UserDTO newUser){
        Scanner sc = new Scanner(System.in);
        UserService userService = new UserService("src/main/resources/mapper/user-query.xml");

        int idCheck = 0;
        int passCheck = 0;

        String userId = "";


        //유저가 원하는 아이디를 입력
        System.out.println("원하시는 아이디를 입력해주세요");
        while (idCheck == 0){
            userId = sc.next();
            // 아이디 체크
            idCheck = userService.checkUserId(userId);
        }

        //비밀번호 입력

        System.out.println("원하시는 비밀번호를 입력해주세요: ");

        while (passCheck == 0){
            String password1 = sc.next();
            //비밀번호 확인
            System.out.println("입력하신 비밀번호를 다시 입력해주세요: ");
            String password2 = sc.next();
            if (password1.equals(password2)){
                passCheck = 1;
                newUser.setUserID(userId);
                newUser.setUserPassword(password1);
            }else {
                System.out.println("입력하신 비밀번호가 다릅니다.");
                System.out.println("비밀번호를 다시 입력해주세요: ");
            }
        }
    }

    public static UserDTO userLogin(){
        UserDTO loginUser = new UserDTO();
        Scanner sc = new Scanner(System.in);
        System.out.println("아이디를 입력해주세요: ");
        loginUser.setUserID(sc.next());
        System.out.println("비밀번호를 입력해주세요: ");
        loginUser.setUserPassword(sc.next());
        return loginUser;
    }




}
