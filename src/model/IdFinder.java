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
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;
import mybatis.MyAuthenticator;
import mybatis.VOCS;

public class IdFinder extends Authenticator implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String email= request.getParameter("email");
		String sentence = " 님의 아이디 입니다.";		
		//이름, 이메일 받아서 고객 객체 반환
		VOCS cs = DAO.getCustomer_Id(name, email);
		if (cs == null) {
			//아래의 문구를 js에서 어케 다시 띄울까...alert()으로 띄우고 싶은데
			request.setAttribute("msg_id", "이름, 이메일과 일치하는 아이디가 없습니다.");
			return "view/EmailService.jsp";
		}
	
		String id = cs.getId();
		//반환받은 고객 객체로부터 getId만 뽑아내서 고객의 이메일 주소로 보낸다.
		
		EmailModel mail = new EmailModel();
		mail.mailService(email, name, id, sentence, request);
		
		return "Controller?cmd=logingo";
	}

}
