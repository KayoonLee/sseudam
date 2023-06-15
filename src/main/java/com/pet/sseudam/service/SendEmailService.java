package com.pet.sseudam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service("SendEmailService")

public class SendEmailService {

@Autowired
private JavaMailSender mailSender;
private static final String from_address ="testbootforme@gmail.com";

    public void sendAuth(String email, String auth){
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom(SendEmailService.from_address);
        msg.setSubject("[쓰담쓰담] 회원가입 인증 이메일입니다.");
        msg.setTo(email);
        msg.setText("안녕하세요. 회원가입에 필요한 인증번호는 "+ auth + " 입니다."+"감사합니다.");
        mailSender.send(msg);
    }

// 메일 보내기
    public void sendEmail(String email,String nick, String tempPw){
        // 메일 보낼 객체 생성
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(SendEmailService.from_address);
        message.setSubject("[쓰담쓰담]"+nick+"님의 임시 비밀번호 안내 입니다."); // 메일 제목
        message.setTo(email);
        message.setText("안녕하세요. 임시비밀번호 안내 관련 메일입니다."+ "[" + nick + "]" +"님의 임시 비밀번호는 "
            + tempPw + " 입니다.");

        mailSender.send(message);
    }

    // 6자리 랜덤 비번 생성
//    public String getRandom(){
//        String[] charSet = new String[] { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F",
//                "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
//        String randomPw = "";
//        int idx = 0;
//        for (int i = 0; i<6; i++){
//            int random = (int)(Math.random()*charSet.length);
//            randomPw += charSet[idx];
//        }
//        return randomPw;
//    }

}
