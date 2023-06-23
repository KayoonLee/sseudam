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

// 가입 시 메일 인증 (일반 회원용)
    public void sendAuth(String email, String auth){
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom(SendEmailService.from_address);
        msg.setSubject("[쓰담쓰담] 회원가입 인증 이메일입니다.");
        msg.setTo(email);
        msg.setText("안녕하세요. [쓰담쓰담] 입니다. 회원가입에 필요한 인증번호는 "+ auth + " 입니다."+" 감사합니다.");
        mailSender.send(msg);
    }

// 가입 시 메일 인증 (상담자용)
    public void sendAuthmail(String email, String auth){
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom(SendEmailService.from_address);
        msg.setSubject("[쓰담쓰담] 회원가입 인증 이메일입니다.");
        msg.setTo(email);
        msg.setText("안녕하세요. 회원가입에 필요한 인증번호는 "+ auth + " 입니다."+"감사합니다.");
        mailSender.send(msg);
    }


// 임시 비번 메일 보내기
    public void sendEmail(String email,String nick, String tempPw){
        // 메일 보낼 객체 생성
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(SendEmailService.from_address);
        message.setSubject("[쓰담쓰담]"+nick+"님의 임시 비밀번호 안내 입니다."); // 메일 제목
        message.setTo(email);
        message.setText("안녕하세요. 임시비밀번호 안내 관련 메일입니다. <br> "+ "[" + nick + "]" +"님의 임시 비밀번호는 "
            + tempPw + " 입니다.");

        mailSender.send(message);
    }

    // 상담사 승인 축하 메일
    public void joinMail(String email, String nick) {
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom(SendEmailService.from_address);
        msg.setSubject("[쓰담쓰담] 상담사 승인 안내 메일입니다.");
        msg.setTo(email);
        msg.setText("안녕하세요. [쓰담쓰담] 입니다. "+ nick+"님의 가입 심사가 승인되었습니다."+" 감사합니다.");
        mailSender.send(msg);
    }

    // 상담사 승인 거절 메일
    public void rejectMail(String email, String nick) {
        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setFrom(SendEmailService.from_address);
        msg.setSubject("[쓰담쓰담] 상담사 승인 거절 메일입니다.");
        msg.setTo(email);
        msg.setText("안녕하세요. [쓰담쓰담] 입니다. "+ nick+"님의 가입 심사가 거절되었습니다.<br>"+" 귀하의 역량과 자질이 우수하나\n" +
                "제한된 인원을 선발할 수 밖에 없음을 이해하여 주시기 바랍니다. <br> 다음에 더 좋은 모습으로 찾아뵙길 기대하겠습니다. 감사합니다.");
        mailSender.send(msg);
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
