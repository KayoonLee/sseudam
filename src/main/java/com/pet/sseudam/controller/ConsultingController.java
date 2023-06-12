package com.pet.sseudam.controller;

import com.pet.sseudam.service.ConsultingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ConsultingController {
    @Autowired
    private ConsultingService con;

    /* 상담사 예약으로 이동*/
    @RequestMapping("choose_counselor")
    public String choose_counselor() {
        //상담사 이름 modal 주입
        con.find_counselor();
        System.out.println(con.find_counselor());




        return "consulting/choose_counselor";
    }

}
