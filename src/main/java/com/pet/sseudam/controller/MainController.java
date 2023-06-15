package com.pet.sseudam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    // 메인페이지
    @GetMapping("main_page")
    public String mainPage() {
        System.out.println("메인페이지 진입");
        return "mainPage/main_page";
    }

    // 회원가입 창 분리
    @GetMapping("separate_join")
    public String separateLogin() {
        return "login/separate_join";
    }

    //일반회원 회원가입 폼
    @GetMapping("member_join")
    public String member_join(){
        return "login/member_join";
    }

    //상담사 회원가입 폼
    @GetMapping("counsel_join")
    public String counsel_join(){
        return "login/counsel_join";
    }

    // 로그인 폼
    @GetMapping("login_form")
    public String login_form(){
        return "login/login_form";
    }


    @RequestMapping("test")
    public String test(){
        return "login/test";
    }
    // 로그아웃
    @RequestMapping("/logout_form")
    public String logout(HttpSession session) {
        session.invalidate();
        return "login/logout";
    		}
}
