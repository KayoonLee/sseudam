package com.pet.sseudam.controller;

import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.service.CounselorService;
import com.pet.sseudam.service.MemberService;
import com.pet.sseudam.service.SendEmailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class CounselorController {
    @Autowired
    private CounselorService cs;

    @Autowired
    private MemberService ms;

    @Resource(name = "SendEmailService")
    private SendEmailService emailService;

    // 상담사 회원가입
    @PostMapping("insertCounsel")
    public String counsel_join(Member member, Counselor counselor, HttpSession session){
        ms.insert(member);
        int c_name = cs.getNumber(member); //nick에 해당하는 상담사 회원번호 갖고 오기
        counselor.setC_id(c_name);

        cs.insert_counsel(counselor);
        session.invalidate(); //메인 창으로 돌아가서 로그인 하게 끔

        return "login/after_join";
    }

    // 회원가입 시 이메일 인증
    @RequestMapping("emailAuth")
    @ResponseBody
    public String authEMail(String email){
        System.out.println("상담사 email인증 진입:"+ email);
        String result = null;

        String auth= UUID.randomUUID().toString().replace("-","");
        auth = auth.substring(0,5);//tempPw를 앞에서부터 5자리 잘라줌
        System.out.println("인증번호 " + auth);

        emailService.sendAuthmail(email, auth); //mail 발송

        result="true";
        System.out.println(result);
        return auth;
    }

    //email 중복검사
    @PostMapping("counselEmailChk.do")
    public String emailChk(@RequestParam("email") String email, Model model){
        System.out.println("counselor-emailchk 진입:"+email);
        System.out.println("email:"+email);

        int cnt = cs.emailChk(email);
        System.out.println("cnt:" + cnt);
        model.addAttribute("cnt",cnt);
        return "login/emailCheck";
    }

    //nick 중복검사
    @RequestMapping("counselNickChk.do")
    public String nickChk(@RequestParam("nick") String nick,Model model){
        System.out.println("counselor-nickchk 진입:"+nick);
        int cnt = cs.nickChk(nick);

        System.out.println("cnt:" + cnt);
        model.addAttribute("cnt", cnt);

        return "login/nickCheck";
    }


    //상담사 목록
    @RequestMapping("counsel_list")
    public String counsel_list(Model model, Member member){
        System.out.println("상담사 목록 진입");

        List<Member> counselorList = ms.counselorList(member);
        System.out.println("counsel list:"+counselorList);

        model.addAttribute("counselorList", counselorList);

        return "counselorPage/counsel_list";
    }









}
