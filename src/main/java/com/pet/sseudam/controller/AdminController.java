package com.pet.sseudam.controller;

import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.service.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

    @Autowired
    private AdminServiceImpl adminservice;

    // 관리자 메인페이지
    @GetMapping("adminMain")
    public String adminMain() {
        System.out.println("관리자 페이지로 진입성공");
        return "adminPage/adminpage_main";
    }

    // 대시보드(회원수 통계) 페이지
    @GetMapping("adminDashboard")
    public String adminDashboard() {
        System.out.println("대시보드 페이지로 이동");
        return "adminPage/admin_dashboard";
    }

//    // 일반회원 페이지
//    @GetMapping("adminMemberPage")
//    public String memberPage() {
//        System.out.println("회원관리 페이지로 이동");
//        return "adminPage/admin_member_page";

    // 일반회원 신고 페이지
    @GetMapping("adminMemberReport")
    public String adminMemberReport() {
        System.out.println("신고받은 회원 페이지로 이동");
        return "adminPage/admin_member_report";
    }

    // 상담사 관리 페이지
    @GetMapping("adminCounselorPage")
    public String adminCounselorPage() {
        System.out.println("상담사 관리 페이지로 이동");
        return "adminPage/admin_counselor_page";
    }

    // 상담사 신청 페이지
    @GetMapping("adminCounselorApply")
    public String adminCounselorApply() {
        System.out.println("상담사 신청 페이지로 이동");
        return "adminPage/admin_counselor_apply";
    }

    // 강아지 리스트 페이지
    @GetMapping("adminDogPage")
    public String adminDogPage() {
        System.out.println("강아지 리스트 페이지 진입");
        return "adminPage/admin_dog_page";
    }

    // 고양이 리스트 페이지 수정중...
    @GetMapping("adminCatPage")
    public String adminCatPage(PetBean pet, Model model) {
        System.out.println("고양이 리스트 페이지 진입");

        //List<Pet> cat_list = adminservice.cat_list(pet);
        //model.addAttribute("", cat_list);

        return "adminPage/admin_cat_page";
    }
    
    // 관리자 프로필/마이페이지
    @GetMapping("adminProfile")
    public String adminProfile() {
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
