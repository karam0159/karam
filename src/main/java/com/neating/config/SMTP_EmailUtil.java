package com.neating.config;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.stereotype.Service;


@Service
public class SMTP_EmailUtil {

	public static String RandomNum()			// 이메일 인증 랜덤값
	{
		StringBuffer buffer = new StringBuffer();
		for ( int i = 0; i <= 6;  i ++)
		{
			int n = (int)(Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	public static void sendEmail(String email,String name, String authNum)
	{
		String host="smtp.gmail.com"; // smtp서버
		String subject = "Neating 인증번호 전달";
		String fromName = "Neating 관리자";
		String from = "neating12@gmail.com";
		String to1 = email;
		
		String content = name+"님 Neating 계정 검색 인증번호 ["+authNum+"] 입니다.";
		
		try
		{
			Properties props = new Properties();
			// G-Mail SMTP 사용시
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");
			
			Session mailSession = Session.getInstance(props,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication()
						{
							return new PasswordAuthentication(from,"neatingneating1@3");
						}
			});
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(
					fromName, "UTF-8", "B"))); // 보내는 사람 설정
			
			InternetAddress[] address1 = {new InternetAddress(to1) };
			msg.setRecipients(Message.RecipientType.TO, address1); // 받는 사람설정1
			msg.setSubject(subject); 	//제목 설정
			msg.setSentDate(new java.util.Date()); //보내는 날짜 설정
			msg.setContent(content, "text/html;charset=euc-kr"); // 내용설정(html 형식)
			
			Transport.send(msg);
		}
		catch(MessagingException e)
		{
			e.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
}
