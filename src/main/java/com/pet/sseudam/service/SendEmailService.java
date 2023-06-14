package com.pet.sseudam.service;

import com.pet.sseudam.model.Mail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service("SendEmailService")

public class SendEmailService {

@Autowired
private JavaMailSender mailSender;
private static final String from_address ="testbootforme@gmail.com";

public Mail sendTo (String email, String nick){
    String str = getRandom();
    Mail mail = new Mail();
    mail.setAddress(email);
    mail.setTitle("[쓰담쓰담]"+nick+"님의 임시 비밀번호 안내 입니다.");
    mail.setMessage("안녕하세요. 임시비밀번호 안내 관련 메일입니다."+ "[" + nick + "]" +"님의 임시 비밀번호는 "
            + str + " 입니다.");
    return mail;
}

//1명에게 메일 보내기 (테스트용-수신자)
    public void sendEmail(){
        // 메일 보낼 객체 생성
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(SendEmailService.from_address);
        message.setSubject("test"); // 메일 제목
        message.setTo("sobeenee@gmail.com"); // 1명에게 전송
        message.setText("test");
        mailSender.send(message);
    }

    // 6자리 랜덤 비번 생성
    public String getRandom(){
        String[] charSet = new String[] { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F",
                "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z" };
        String randomPw = "";
        int idx = 0;
        for (int i = 0; i<6; i++){
            int random = (int)(Math.random()*charSet.length);
            randomPw += charSet[idx];
        }
        return randomPw;
    }

}
