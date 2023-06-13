package com.pet.sseudam.controller;

import com.pet.sseudam.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    //@Autowired
    //private final AdminService adminservice;

    // 관리자 메인페이지
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

/* ------------------------------------------------------------------------------------------------------------------ */

    // 회원수, 상담자수, 관리자수, 오늘 방문자 통계cnt(메인페이지 접속 횟수)로 가져오기

    // 일반회원 리스트 불러오기

    // 강아지 리스트 불러오기

    // 고양이 리스트 불러오기

    // 상담사 리스트 불러오기

    // 상담사 신청관리 리스트 불러오기

    // 상담사 신청 3(보류) ->2 (확정) update (String형으로 되어 있음)
    
    // 관리자 프로필

    // 관리자 등록 (Admin table)

}
