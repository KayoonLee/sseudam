package com.pet.sseudam.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;

@Controller
public class MemberPageController {

//    @Autowired
//    private final MemberPageService mps;
//
//    public MemberPageController(MemberPageService mps) {
//        this.mps = mps;
//    }




    // 마이페이지(일반회원)
//    @GetMapping("memberpage_main")
//    public String memberPageMain(HttpSession session, Model model){
//        String nick = (String)session.getAttribute("nick");
//
//        return "memberpage/memberpage_main";
//    }
    
    // 메인페이지
    @GetMapping("memberMain")
    public String memberPageMain(){
        System.out.println("일반회원 페이지로 진입성공");
        return "memberPage/memberpage_main";
    }
    
    // 나의 반려동물
    @GetMapping("memberPet")
    public String memberPagePet(){
        System.out.println("동물페이지로 진입성공");
        return "memberPage/memberpage_mypet";
    }
    

    // 내가 쓴 글
    @GetMapping("memberPost")
    public String memberPagePost(){
        System.out.println("내가 쓴 글로 진입성공");
        return "memberPage/memberpage_mypost";
    }

    // 내가 쓴 댓글
    @GetMapping("memberReply")
    public String memberPageReply(){
        System.out.println("내가 쓴 댓글로 진입성공");
        return "memberPage/memberpage_myreply";
    }

    // 내가 좋아요 한 글
    @GetMapping("memberLike")
    public String memberPageLike(){
        System.out.println("내가 좋아요 한 글로 진입성공");
        return "memberPage/memberpage_mylike";
    }

    // 상담신청내역
    @GetMapping("memberPaper")
    public String memberPagePaper(){
        System.out.println("상담신청내역으로 진입성공");
        return "memberPage/memberpage_mypaper";
    }

    // 즐겨찾는 상담사
    @GetMapping("memberCounselor")
    public String memberPageCounselor(){
        System.out.println("즐겨찾는 상담사로 진입성공");
        return "memberPage/memberpage_mycounselor";
    }


}
