package com.pet.sseudam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class FreeController {

    @GetMapping("home.do")
    public String home(){
        System.out.println("home.do 도착");

        return "freeBoard/freeboard";
    }
}
