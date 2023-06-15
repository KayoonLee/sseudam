package com.pet.sseudam.controller;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.service.MemberPageService;
import com.pet.sseudam.service.PagingPgm;
import com.pet.sseudam.service.PetPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class MemberPageController {

    @Autowired
    private MemberPageService mps;

    public MemberPageController(MemberPageService mps) {
        this.mps = mps;
    }

    
    // 나의 프로필(마이페이지 default)
    @GetMapping("memberpage_main")
    public String memberPageMain(HttpSession session, Member member, Model model){


        System.out.println("일반회원 페이지로 진입성공");
        return "memberPage/memberpage_main";
    }

    // 나의 프로필 수정
    @GetMapping("memberpage_update")
    public String memberUpdateForm(){
        System.out.println("나의 프로필 수정");
        return "memberPage/memberpage_update";
    }
    
    // 나의 반려동물 관련 컨트롤러는 PetPageController에서


    // 내가 쓴 글
    @GetMapping("memberpage_mypost")
    public String memberPagePost(){
        System.out.println("내가 쓴 글로 진입성공");
        return "memberPage/memberpage_mypost";
    }

    // 내가 쓴 댓글
    @GetMapping("memberpage_myreply")
    public String memberPageReply(){
        System.out.println("내가 쓴 댓글로 진입성공");
        return "memberPage/memberpage_myreply";
    }

    // 내가 좋아요 한 글
    @GetMapping("memberpage_mylike")
    public String memberPageLike(){
        System.out.println("내가 좋아요 한 글로 진입성공");
        return "memberPage/memberpage_mylike";
    }

    // 상담신청내역
    @GetMapping("memberpage_mypaper")
    public String memberPagePaper(){
        System.out.println("상담신청내역으로 진입성공");
        return "memberPage/memberpage_mypaper";
    }

    // 즐겨찾는 상담사
    @GetMapping("memberpage_mycounselor")
    public String memberPageCounselor(){
        System.out.println("즐겨찾는 상담사로 진입성공");
        return "memberPage/memberpage_mycounselor";
    }


}
