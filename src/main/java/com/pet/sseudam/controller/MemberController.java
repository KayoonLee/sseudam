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
import java.util.UUID;


@Controller
public class MemberController {
    @Autowired
    private MemberService ms;

    @Autowired
    private CounselorService cs;

    @Resource(name = "SendEmailService")
    private SendEmailService emailService;

    //일반회원 가입
    @RequestMapping("/insertMember")
    public String mem_join(Member member, HttpSession session){
        System.out.println("insert 진입");
        ms.insert(member);
        session.invalidate(); //메인 창으로 돌아가서 로그인 하게 끔

        return "login/after_join";
    }

    //로그인 - 구분코드에 따라서 분리
    @RequestMapping("login")
    public String mem_login(@RequestParam("email") String email,
                            @RequestParam("passwd") String passwd,
                            HttpSession session, Model model) {
        int result = 0;
        Member member = ms.userCheck(email);



        if (member == null) {//등록되지 않은 회원일 때
            result = 1;
            model.addAttribute("result", result);
            return "login/login_result";
        } else { //등록된 회원일 때 - 구분코드로 회원, 상담사 구분하기...
            if (member.getPasswd().equals(passwd)) {
                if (member.getIdentifier().equals("1")) { // 일반회원일 때
                        session.setAttribute("member", member);
                        String nick = member.getNick(); // 화면에 닉네임 보여주기
                        model.addAttribute("nick", nick);
                        return "mainPage/main_page";

                } else if (member.getIdentifier().equals("2")) { //상담사 회원일 때

                    session.setAttribute("member", member);
                    String nick = member.getNick();
                    model.addAttribute("nick", nick);
                    return "mainPage/main_page";

                } else { //상담사 승인 대기 중일 때
                    result = 3;
                    model.addAttribute("result", result);
                    return "login/login_result";
                }
            } else { // 비번 불일치
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

    // mail 인증
    @RequestMapping("mailCheck")
    @ResponseBody
    public String authMail(String email){
        System.out.println("mail인증 진입:"+ email);
        String result = null;

        String auth= UUID.randomUUID().toString().replace("-","");
        auth = auth.substring(0,5);//tempPw를 앞에서부터 5자리 잘라줌
        System.out.println("인증번호 " + auth);

        emailService.sendAuth(email, auth); //mail 발송

        result="true";
        System.out.println(result);
        return auth;
    }



    // email(아이디) 찾기 창
    @RequestMapping("findEmail.do")
    public String findEmailForm(){
        return "login/find_email";
    }

   // 나의 email 있는지 확인
    @RequestMapping("findUserEmail")
    @ResponseBody
    public Member findEmail(Member member){
        System.out.println("findUserEmail 진입");
        Member findmember = ms.searchEmail(member);
        System.out.println("findmember 확인:"+findmember);

        return findmember;
    }

   // 닉네임 일치하면 아이디랑 닉네임 알려주기
    @RequestMapping("notice_email.do")
    public String noticeEmail(String email, String nick, Model model){
        System.out.println("notice_email진입");
        model.addAttribute("email", email);
        model.addAttribute("nick", nick);
        return "login/notice_email";
    }

    // 비밀번호 찾기 폼
    @RequestMapping("findPasswd.do")
    public String findPasswdForm(){
        return "login/find_passwd";
    }

    //pw찾기 + 임시비번
    @RequestMapping("findpw")
    @ResponseBody
    public String findpw(Member member)throws Exception{
       Member findmember = ms.searchPwd(member);
        System.out.println(findmember);
        String result=null;
        //가입된 이메일이 존재한다면 이메일 전송
        if(findmember!=null) {

            //임시 비밀번호 생성(UUID이용)
            String tempPw= UUID.randomUUID().toString().replace("-","");
            tempPw = tempPw.substring(0,6);//tempPw를 앞에서부터 10자리 잘라줌
            System.out.println("임시 비밀번호 " + tempPw);

            findmember.setPasswd(tempPw);//임시 비밀번호 담기
            String email = findmember.getEmail();
            String nick = findmember.getNick();

            emailService.sendEmail(email,nick,tempPw); //mail 발송

            ms.updatePwd(findmember); //임시비번으로 비번 변경
            result="true";
            System.out.println(result);


        }else {
            result="false";
            System.out.println(result);
        }

        return result;
    }

    // 로그아웃
    @RequestMapping("logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "login/logout";
    }



}

