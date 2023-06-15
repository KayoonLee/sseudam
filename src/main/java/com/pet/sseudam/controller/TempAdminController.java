package com.pet.sseudam.controller;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.service.TempAdminService;
import com.pet.sseudam.service.TempAdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
public class TempAdminController {

    @Autowired
    private TempAdminService adminservice;

    // 일반회원 페이지
    @GetMapping("adminMemberPage")
    public String memberPage(Member member, Model model) {
        System.out.println("회원관리 페이지로 이동");
        List<Member> admin_list = adminservice.admin_list(member);
        System.out.println("admin_list = " + admin_list);
        model.addAttribute("admin_list",admin_list);

        return "adminPage/admin_member_page";
    }
    
    @GetMapping("adminViewPage")
    public String adminViewPage(Model model, Integer m_id ){
        System.out.println("상세페이지 보이기");
        Member memberDto = adminservice.adminSelect(m_id);
        System.out.println(memberDto);
        model.addAttribute("memberDto",memberDto);

        return "adminPage/admin_member_view";
    }


}
