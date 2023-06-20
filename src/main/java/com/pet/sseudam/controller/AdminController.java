package com.pet.sseudam.controller;

import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.model.ReportBean;
import com.pet.sseudam.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    //일반회원 페이지 상세
    @GetMapping("adminViewPage")
    public String adminViewPage(Model model, Integer m_id, PetBean petBean){
        System.out.println("상세페이지 보이기");

        Member memberDto = adminService.adminSelect(m_id);
        petBean = adminService.petSelect(m_id);

        System.out.println(memberDto);
        System.out.println(petBean);
        model.addAttribute("memberDto",memberDto);
        model.addAttribute("pet",petBean);
        return "adminPage/admin_member_view";
    }


    // 일반회원 신고 페이지
    @GetMapping("adminMemberReport")
    public String adminMemberReport(Model model) {

        System.out.println("신고받은 회원 페이지로 이동");

        List<ReportBean> report_list = adminService.admin_report_list();
        System.out.println("report_list" + report_list);

        model.addAttribute("report_list",report_list);

        return "adminPage/admin_member_report";
    }

    // 신고 자세한 페이지
    @GetMapping("adminReportView")
    public String adminReportView(ReportBean report_board, Model model){

        System.out.println("신고받은 회원 페이지로 이동");
        System.out.println("m_id = "+report_board.getM_id());
        System.out.println("num = "+report_board.getNum());
        System.out.println("board_num = "+report_board.getBoard_num());

        report_board = adminService.admin_report_view(report_board);
        System.out.println("report_board : "+report_board);

        model.addAttribute("report_board", report_board);

        return "adminPage/admin_member_report_view";
    }

    // 상담사 관리 페이지
    @GetMapping("adminCounselorPage")
    public String adminCounselorPage(Member member, Model model) {
        System.out.println("상담사 관리 페이지로 이동");
        System.out.println(member.getIdentifier());

        List<Member> counsel_list = adminService.admin_counsel_list(member);

        model.addAttribute("counsel_list", counsel_list);

        return "adminPage/admin_counselor_page";
    }

    // 상담사 신청관리 페이지
    @GetMapping("adminCounselorApply")
    public String adminCounselorApply(Member member, Model model) {
        System.out.println("상담사 신청 페이지로 이동");

        member.setIdentifier("3");

        List<Member> apply_list = adminService.admin_counsel_list(member);
        System.out.println("apply_list : "+ apply_list);

        model.addAttribute("apply_list", apply_list);

        return "adminPage/admin_counselor_apply";
    }

    //상담사 자세한 정보
    @GetMapping("adminCounselorView")
    public String adminCounselorView(Member member, Model model) {
        System.out.println("상담사 정보 페이지로 이동");
        System.out.println("getM_id : " + member.getM_id());

        member = adminService.admin_counsel_select(member);
        System.out.println("member : "+ member);


        model.addAttribute("member", member);

        return "adminPage/admin_counselor_view";
    }

    // 상담사 승인
    @ResponseBody
    @GetMapping("adminCounselorAccept")
    public int adminCounselorAccept(Member member, Model model) {
        System.out.println("상담사 승인 페이지로 이동");

        System.out.println("getM_id : " + member.getM_id());
        System.out.println("getIdentifier : " + member.getIdentifier());
        int result = adminService.admin_counsel_accept(member);
        System.out.println("counselor : "+result);

        return result;
    }

    // 상담사 승인 거부/삭제
    @ResponseBody
    @GetMapping("adminCounselorDecline")
    public int adminCounselorDecline(Member member, Model model) {
        System.out.println("상담사 거부 페이지로 이동");

        System.out.println("getM_id : " + member.getM_id());
        int result = adminService.admin_counsel_decline(member);
        System.out.println("counselor : "+result);

        return result;
    }

    // 상담사 상태값 변경
    @ResponseBody
    @GetMapping("adminStateChange")
    public int adminStateChange(Member member){
        System.out.println("상담사 상태값 변경 페이지로 이동");

        if(member.getState() == 1){
            member.setState(0);
        }else if(member.getState() == 0){
            member.setState(1);
        }

        int result = adminService.admin_state_change(member);

        return result;
    }

    // 관리자페이지 닉네임 변경
    @ResponseBody
    @PostMapping("AdminNickChange")
    public int AdminNickChange(Member member){
        System.out.println("관리자전용 닉네임 변경 페이지로 이동");

        System.out.println("getM_id"+ member.getM_id());
        System.out.println("getNick"+ member.getNick());

        int result = adminService.admin_nick_change(member);

        return result;
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
