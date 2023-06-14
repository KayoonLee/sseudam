package com.pet.sseudam.controller;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.service.TempAdminService;
import com.pet.sseudam.service.TempAdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class TempAdminController {

    @Autowired
    private TempAdminServiceImpl adminservice;

    // 일반회원 페이지
/*
    @GetMapping("adminMemberPage")
    public String memberPage(Member member, Model model) {
        System.out.println("회원관리 페이지로 이동");
        List<Member> admin_list = adminservice.admin_list(member);

        model.addAttribute("admin_list",admin_list);

        return "adminPage/admin_member_page";
    }
*/

}
