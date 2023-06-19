package com.pet.sseudam.controller;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
public class AdminController {

    // test // test // test // test sjw
    @Autowired
    private AdminService adminService;

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

    // 일반회원 페이지
    @GetMapping("adminMemberPage")
    public String memberPage(Member member, Model model) {
        System.out.println("회원관리 페이지로 이동");
        List<Member> admin_list = adminService.admin_list(member);
        System.out.println("admin_list = " + admin_list);
        model.addAttribute("admin_list", admin_list);

        return "adminPage/admin_member_page";
    }

    //일반회원 페이지 상세           -- Model 객체 List에 담아서
    @GetMapping("adminViewPage")
    public String adminViewPage(Model model, Integer m_id){
        System.out.println("상세페이지 보이기");

        Member memberDto = adminService.adminSelect(m_id);
        List<PetBean> petBean = adminService.petSelect(m_id);

        System.out.println(memberDto);
        System.out.println(petBean);
        model.addAttribute("memberDto",memberDto);
        model.addAttribute("pet",petBean);
        return "adminPage/admin_member_view";
    }
    // 일반회원 페이지 탈퇴버튼
    public String adminDeleteBtn(Member member){
        adminService.adminDelete(member);
        return "adminPage/admin_member_view";
    }


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

    // 강아지 리스트 페이지 수정중...
    @GetMapping("adminDogPage")
    public String adminDogPage(PetBean pet, Model model) {
        System.out.println("강아지 리스트 페이지 진입");

        List<PetBean> dog_list = adminService.dog_list(pet);
        model.addAttribute("dog_list", dog_list);

        return "adminPage/admin_dog_page";
    }

    // 고양이 리스트 페이지 수정중...
    @GetMapping("adminCatPage")
    public String adminCatPage(PetBean pet, Model model) {
        System.out.println("고양이 리스트 페이지 진입");

        List<PetBean> cat_list = adminService.cat_list(pet);
        model.addAttribute("cat_list", cat_list);

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

    // 관리자 테스트 페이지(나중에 지우기)
    @GetMapping("adminTest")
    public String adminTest() {
        System.out.println("토스트ui 테스트 페이지로 이동");
        return "adminPage/admin_test";
    }

    @GetMapping("adminTest2")
    public String adminTest2() {
        System.out.println("캘린더 예시1로 이동");
        return "adminPage/admin_test2";
    }

    @GetMapping("adminTest3")
    public String adminTest3() {
        System.out.println("캘린더 예시2로 이동");
        return "adminPage/admin_test3";
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

    // 관리자 등록 (Admin table) // 시간 나면 하기

}