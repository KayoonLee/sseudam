package com.pet.sseudam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    // 관리자 메인페이지 다시 업로드
    @GetMapping("adminMain")
    public String adminPage() {
        System.out.println("관리자 페이지로 진입성공");
        return "adminPage/adminpage_main";
    }

    // 일반회원 페이지
    @GetMapping("adminMemberPage")
    public String memberPage() {
        System.out.println("회원관리 페이지로 이동");
        return "adminPage/admin_member_page";
    }

    // 일반회원 신고 페이지
    @GetMapping("adminMemberReport")
    public String memberReport() {
        System.out.println("신고받은 회원 페이지로 이동");
        return "adminPage/admin_member_report";
    }

    // 상담사 관리 페이지
    @GetMapping("adminCounselorPage")
    public String counselorPage() {
        System.out.println("상담사 관리 페이지로 이동");
        return "adminPage/admin_counselor_page";
    }

    // 상담사 신청 페이지
    @GetMapping("adminCounselorApply")
    public String counselorApply() {
        System.out.println("상담사 신청 페이지로 이동");
        return "adminPage/admin_counselor_apply";
    }

    // 강아지 리스트 페이지
    @GetMapping("adminDogPage")
    public String dogPage() {
        System.out.println("강아지 리스트 페이지 진입");
        return "adminPage/admin_dog_page";
    }
    
    // 고양이 리스트 페이지
    @GetMapping("adminCatPage")
    public String catPage() {
        System.out.println("고양이 리스트 페이지 진입");
        return "adminPage/admin_cat_page";
    }
    
    // 관리자 프로필/마이페이지
    @GetMapping("adminProfile")
    public String adminPrifile() {
        System.out.println("관리자 프로필 페이지로 이동");
        return "adminPage/admin_profile";
    }

    // 관리자 등록 페이지
    @GetMapping("adminRegister")
    public String adminRegister() {
        System.out.println("관리자 등록페이지로 이동");
        return "adminPage/admin_register";
    }

}
