package com.pet.sseudam.controller;

import com.pet.sseudam.model.CounselPaper;
import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.service.CounselorService;
import com.pet.sseudam.service.MemberService;
import org.apache.coyote.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class CounselorPageController {

    @Autowired
    private MemberService ms;

    @Autowired
    private CounselorService cs;

    //상담사 페이지 main
    @RequestMapping("counselorpage_main")
    public String memberPageMain(HttpSession session, Model model) {
        System.out.println("상담사 마이 페이지로 진입성공");

        Member member = (Member) session.getAttribute("member");
        int c_id = member.getM_id(); // 상담사 번호 구하기

        Member myModel = ms.userCheck(member.getEmail());
        Counselor counsel = cs.counselChk(c_id);
        System.out.println("career"+counsel.getCareer());
        System.out.println("license"+counsel.getLicense());

        model.addAttribute("myModel", myModel);
        model.addAttribute("counsel", counsel);
        return "counselorPage/counselorpage_main";
    }

    // 수정폼 진입 (정보수정은 mypageController에서 함)
    @RequestMapping("counselorpage_updateform")
    public String csUpdateform(HttpSession session, Model model){
        System.out.println("상담사 수정 폼 진입성공");

        Member member = (Member) session.getAttribute("member");
        int c_id = member.getM_id(); // 상담사 번호 구하기

        Member myModel = ms.userCheck(member.getEmail());
        Counselor counsel = cs.counselChk(c_id);

        model.addAttribute("myModel", myModel);
        model.addAttribute("counsel", counsel);
        return "counselorPage/counselorpage_updateform";
    }

    //상담사 목록 페이지--내일
    @RequestMapping("counselor_list")
    public String counselor_list(Member member, Model model){
        System.out.println("상담사 목록 진입");

        List<Member> counselorList = ms.counselorList(member);
        System.out.println("counselor list:"+counselorList);

        model.addAttribute("counselorList", counselorList);
        return "counselorPage/counselor_list";
    }

    
    // 상담예약서목록
    @RequestMapping("counselorpage_request")
    public String counselorPageRequest(String email, Model model, CounselPaper counselpaper,HttpSession session){
        System.out.println("상담예약서 목록으로 진입성공을 감축드립니다^^");
        // mapper 사용하려는데 m.m_id = c.c_id m_id c_id ?
        Member member = (Member) session.getAttribute("member");
        System.out.println("email: " + email);
        System.out.println("member : " + member);


        List<CounselPaper> requestList = ms.requestList(member.getM_id());

        System.out.println("requestList:" + requestList);

        model.addAttribute("requestList", requestList);
        model.addAttribute("member", member);
        return "counselorPage/counselorpage_request";
    }

    // 내가 쓴 글
    @RequestMapping("counselorpage_mypost")
    public String counselorPagePost(){
        System.out.println("내가 쓴 글로 진입성공");
        return "counselorPage/counselorpage_mypost";
    }

    // 내가 쓴 댓글
    @RequestMapping("counselorpage_myreply")
    public String counselorPageReply(){
        System.out.println("내가 쓴 댓글로 진입성공");
        return "counselorPage/counselorpage_myreply";
    }

    // 내가 좋아요 한 글
    @RequestMapping("counselorpage_mylike")
    public String counselorLikeReply(){
        System.out.println("내가 좋아요 한 글로 진입성공");
        return "counselorPage/counselorpage_mylike";
    }
}
