package com.pet.sseudam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CounselorPageController {

//    @Autowired
//    private final CounselorPageService cps;
//
//    public CounselorPageController(CounselorPageService cps){this.cps=cps;}

    // 메인페이지
    @GetMapping("counselorpage_main")
    public String counselorPageMain(){
        System.out.println("상담사회원 페이지로 진입성공");
        return "counselorPage/counselorpage_main";
    }

    // 상담예약서목록
    @GetMapping("counselorpage_request")
    public String counselorPageRequest(){
        System.out.println("상담예약서 목록으로 진입성공");
        return "counselorPage/counselorpage_request";
    }

    // 내가 쓴 글
    @GetMapping("counselorpage_mypost")
    public String counselorPagePost(){
        System.out.println("내가 쓴 글로 진입성공");
        return "counselorPage/counselorpage_mypost";
    }

    // 내가 쓴 댓글
    @GetMapping("counselorpage_myreply")
    public String counselorPageReply(){
        System.out.println("내가 쓴 댓글로 진입성공");
        return "counselorPage/counselorpage_myreply";
    }

    // 내가 좋아요 한 글
    @GetMapping("counselorpage_mylike")
    public String counselorLikeReply(){
        System.out.println("내가 좋아요 한 글로 진입성공");
        return "counselorPage/counselorpage_mylike";
    }
}
