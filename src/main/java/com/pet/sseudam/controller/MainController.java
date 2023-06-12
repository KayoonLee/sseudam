package com.pet.sseudam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    // 메인페이지
    @GetMapping("main_page")
    public String mainPage() {
        System.out.println("메인페이지 진입");
        return "mainPage/main_page";
    }

}
