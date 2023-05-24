package com.example.inhavote.Service;

import com.example.inhavote.RandomCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
    @Autowired
    private JavaMailSender emailSender;

    // 이메일 인증 발송
    public boolean sendMail(String userEmail, String code) {
        SimpleMailMessage message = new SimpleMailMessage();

        message.setFrom("chohyeonK3@gmail.com");
        message.setTo(userEmail);
//        message.setTo("tkrhkaktq@naver.com");
        message.setSubject("인하대 투표웹 인증 메일입니다.");
        message.setText("인증번호: " + code);

        emailSender.send(message);
        return true;
    }
}