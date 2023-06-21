package com.pet.sseudam.controller;

import com.pet.sseudam.model.Visitor;
import com.pet.sseudam.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MainController {

    @Autowired
    private MemberService service;


    // 메인페이지
    @GetMapping("main_page")
    public String mainPage(HttpServletRequest request,Visitor visitor) {
        System.out.println("메인페이지 진입");

        String session_id = request.getSession().getId();
        String ip_addr = request.getRemoteAddr();
        System.out.println("session_id : " +session_id);
        System.out.println("ip_addr : " +ip_addr);

        visitor.setSession_id(session_id);
        visitor.setIp_addr(ip_addr);

        int count = service.visitCheck(visitor);
        System.out.println("방문자 체크 여부 : " + count);

        if (count == 0) {
            int result = service.visitInsert(visitor);
            System.out.println("방문자 더하기 여부 : " + result);
        }

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
