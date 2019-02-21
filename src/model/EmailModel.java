package model;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import mybatis.DAO;
import mybatis.MyAuthenticator;
import mybatis.VOCS;

public class EmailModel extends Authenticator {
	
	public void mailService(String email, String name, String pers_info, String sentence, HttpServletRequest request) {
		Properties pt = System.getProperties();
		
		pt.put("mail.smtp.port", "465");
		pt.put("mail.smtp.host", "smtp.gmail.com");
		pt.put("mail.smtp.auth", "true");

		pt.put("mail.smtp.user", "teang90");
		pt.put("mail.smtp.starttls.enable", "true");
		pt.put("mail.smtp.socketFactory.port", "465");
		pt.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		pt.put("mail.smtp.socketFactory.fallback", "false");
		
		Authenticator auth = new MyAuthenticator();
		
		Session session = Session.getDefaultInstance(pt, auth);
		MimeMessage msg = new MimeMessage(session);
		
		//편지 보낸시간
		
		try {
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress("teang90");
			
			//이메일 발신자
			msg.setFrom(from);
			
			//이메일 수신자
			InternetAddress to = new InternetAddress(email);
			msg.setRecipient(Message.RecipientType.TO, to);
			
			//이메일 제목
			msg.setSubject("Copang 개인정보 서비스: [ "+name+" "+sentence+" ]", "utf-8");
			
			//이메일 내용
			String email_content = name+"님의 아이디는 "+pers_info+"입니다."+"<br><hr><br>"+"<a href='http://localhost:8090/1001_JSP_Project/view/home.jsp'>코팡으로 이동하기</a>";
			request.setAttribute("email_content", email_content);
			msg.setText(email_content, "utf-8");
			
			//이메일 헤더
			msg.setHeader("content-Type", "text/html");
			
			//메일 보내기
			javax.mail.Transport.send(msg);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		} 
		
	}
}
