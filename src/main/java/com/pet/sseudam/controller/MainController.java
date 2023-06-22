package com.pet.sseudam.controller;

import com.pet.sseudam.model.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MainController {

    // 메인페이지
    @RequestMapping("main_page")
    public String mainPage() {
        System.out.println("메인페이지 진입");
        return "mainPage/main_page";
    }

    // 회원가입 창 분리
    @RequestMapping("separate_join")
    public String separateLogin() {
        return "login/separate_join";
    }

    //일반회원 회원가입 폼
    @RequestMapping("member_join")
    public String member_join(){
        return "login/member_join";
    }

    //상담사 회원가입 폼
    @RequestMapping("counsel_join")
    public String counsel_join(){
        return "login/counsel_join";
    }

    // 로그인 폼
    @RequestMapping("login_form")
    public String login_form(){
        return "login/login_form";
    }


    //상담 소개(쓰담쓰담 소개)
    @RequestMapping("intro_counsel")
    public String intro_counsel(){
        System.out.println("쓰담쓰담소개 진입");

        return "mainPage/intro_counsel";
    }
}
