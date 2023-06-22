package com.pet.sseudam.controller;

import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.service.CounselorService;
import com.pet.sseudam.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String csUpdateform( HttpSession session, Model model){
        System.out.println("상담사 수정 폼 진입성공");
        Member member = (Member) session.getAttribute("member");
        int c_id = member.getM_id(); // 상담사 번호 구하기

        Member myModel = ms.userCheck(member.getEmail());
        Counselor counsel = cs.counselChk(c_id);

        model.addAttribute("myModel", myModel);
        model.addAttribute("counsel", counsel);
        return "counselorPage/counselorpage_updateform";
    }

    // 상담사 정보 수정
    @RequestMapping("counselor_update")
    public String csUpdate(Model model, Member member, Counselor counselor, HttpSession session){
        System.out.println("member: "+member);
        System.out.println("counselor 정보 수정 컨트롤러"+counselor);

        // member테이블 컬럼 수정
        int res = ms.csMyUpdate(member);

        // 상담 테이블 컬럼 수정
        int result = cs.csUpdate(counselor);
        if (result == 1) {
            System.out.println(result +": 수정 성공");

        }


        model.addAttribute("res", res);
        model.addAttribute("result", result);

        return "counselorPage/csupdate_result";
    }



    // 상담사 비밀번호 수정 폼
    @RequestMapping("counselorpage_PwUpdateForm")
    public String csPwUpdateForm(HttpSession session, Model model){
        System.out.println("상담사 비번 수정 폼 진입");
        Member member = (Member) session.getAttribute("member");
        int c_id = member.getM_id(); // 상담사 번호 구하기

        Member myModel = ms.userCheck(member.getEmail());
        Counselor counsel = cs.counselChk(c_id);
        System.out.println("myModel:"+myModel);
        System.out.println("counsel:"+counsel);
        model.addAttribute("myModel", myModel);
        model.addAttribute("counsel", counsel);
        return "counselorPage/counselorpage_PwUpdateForm";
    }

    // 상담사 비번 수정
    @RequestMapping("csMyPwUpdate")
    public String csMyPwUpdate(Member member, Model model){
        System.out.println("상담사 비번 수정 컨트롤러");
        //Member member = (Member) session.getAttribute("member");

        int result = ms.csMyPwUpdate(member);
        if(result==1){
            System.out.println("비번 수정 성공");
        }
        Member myModel = ms.userCheck(member.getEmail());

        model.addAttribute("myModel", myModel);
        return "counselorPage/counselorpage_main";
    }

    // 탈퇴폼 진입
    @RequestMapping("counselorpage_deleteform")
    public String csdeleteForm(String email, Model model){
        System.out.println("상담사 탈퇴폼진입");
        Member myModel = ms.userCheck(email);

        model.addAttribute("myModel", myModel);
        return "counselorPage/counselorpage_deleteform";
    }

    // 상담사 탈퇴
    @RequestMapping("counsel_delete")
    public String counsel_delete(Member member, Model model, HttpSession session){
        System.out.println("탈퇴 도착");
        int result = ms.deletemember(member.getEmail());
        if (result == 1)
            System.out.println("탈퇴 성공");

        session.invalidate(); //session 끊기
        model.addAttribute("result",result);
        return "counselorPage/counselor_out";
    }








    
    // 상담예약서목록
    @RequestMapping("counselorpage_request")
    public String counselorPageRequest(){
        System.out.println("상담예약서 목록으로 진입성공");
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
