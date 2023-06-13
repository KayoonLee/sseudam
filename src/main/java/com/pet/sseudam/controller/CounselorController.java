package com.pet.sseudam.controller;

import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.service.CounselorService;
import com.pet.sseudam.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class CounselorController {
    @Autowired
    private CounselorService cs;

    @Autowired
    private MemberService ms;

    // 상담사 회원가입
    @PostMapping("insertCounsel")
    public String counsel_join(Member member, Counselor counselor, HttpSession session){
        ms.insert(member);
        int c_name = cs.getNumber(member); //nick에 해당하는 회원번호 갖고 오기
        counselor.setC_id(c_name);

        cs.insert_counsel(counselor);
        session.invalidate(); //메인 창으로 돌아가서 로그인 하게 끔

        return "login/after_join";
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
}
