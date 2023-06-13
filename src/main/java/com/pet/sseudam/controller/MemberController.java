package com.pet.sseudam.controller;



import com.pet.sseudam.model.Member;

import com.pet.sseudam.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.UUID;

@Controller
public class MemberController {
    @Autowired
    private MemberService ms;


    //일반회원 가입
    @RequestMapping("/insertMember")
    public String mem_join(Member member, HttpSession session){
        System.out.println("insert 진입");
        ms.insert(member);
        session.invalidate(); //메인 창으로 돌아가서 로그인 하게 끔

        return "login/after_join";
    }

    //로그인 - 구분코드에 따라서 분리
    @PostMapping("login")
    public String mem_login(@RequestParam("email") String email,
                            @RequestParam("passwd") String passwd,
                            HttpSession session, Model model){
        int result = 0;
        Member member = ms.userCheck(email);

        if (member == null){//등록되지 않은 회원일 때
            result=1;
            model.addAttribute("result", result);
            return "login/login_result";
        }else { //등록된 회원일 때 - 구분코드로 회원, 상담사 구분하기...
            if (member.getPasswd().equals(passwd)){
                if (member.getIdentifier().equals("1")){ // 일반회원일 때

                    session.setAttribute("member", member) ;
                    String nick = member.getNick(); // 화면에 닉네임 보여주기
                    model.addAttribute("nick", nick);
                    return "mainPage/main_page"; //!@!나중에 일반회원, 상담회원 메인 분리해서 링크 걸기!!!

                }else if(member.getIdentifier().equals("2")){ //상담사 회원일 때

                    session.setAttribute("member", member) ;
                    String nick = member.getNick();
                    model.addAttribute("nick", nick);
                    return "mainPage/main_page";

                }else { //상담사 승인 대기 중일 때
                    result=3;
                    model.addAttribute("result", result);
                    return "login/login_result";
                }
            }else { // 비번 불일치
                result = 2;
                model.addAttribute("result", result);
                return "login/login_result";
            }
        }
    }

    //email 중복검사
    @PostMapping("emailChk.do")
    public String emailChk(@RequestParam("email") String email,Model model){
        System.out.println("emailchk 진입:"+email);
        System.out.println("email:"+email);

       int cnt = ms.emailChk(email);
       System.out.println("cnt:" + cnt);
       model.addAttribute("cnt",cnt);
        return "login/emailCheck";
    }

    //nick 중복검사
    @RequestMapping("nickChk.do")
    public String nickChk(@RequestParam("nick") String nick,Model model){
        System.out.println("nickchk 진입:"+nick);
        int cnt = ms.nickChk(nick);

       System.out.println("cnt:" + cnt);
       model.addAttribute("cnt", cnt);

        return "login/nickCheck";
    }

//
//    // email(아이디) 찾기 폼
//    @GetMapping("findEmail.do")
//    public String findEmailForm(){
//        return "loginForm/find_emailForm";
//    }
//
//    // email 있는지 확인
//    @GetMapping("findUserEmail")
//    @ResponseBody
//    public Member findEmail(Member member){
//        Member findmember = ms.searchEmail(member);
//        System.out.println("findmember 확인:"+findmember);
//        if(findmember==null){
//            return findmember;
//        }
//        return findmember;
//    }
//
//    // 닉네임 일치하면 아이디랑 닉네임 알려주기
//    @GetMapping("noticeEmail.do")
//    public String noticeEmail(String email, String nick, Model model){
//        model.addAttribute("email", email);
//        model.addAttribute("nick", nick);
//        return "loginForm/noticeEmail";
//    }

    //임시 비밀번호 발송
//    @Transactional
//    @PostMapping("/sendEmail")
//    public String sendEmail(@RequestParam("email") String email){
//        Mail mail= ms.tempPw(email);
//
//        ms.mailSend(mail);
//
//        return "/login/login_form";
//    }






}

