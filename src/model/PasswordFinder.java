package model;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;
import mybatis.MyAuthenticator;
import mybatis.VOCS;

public class PasswordFinder implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String sentence = " 인증번호 입니다.";
		VOCS cs = DAO.getCustomer_Password(name, id);
		if (cs == null) {
			request.setAttribute("msg_ps", "이름과 아이디 조건에 일치하는 비밀번호가 없습니다.");
			return "view/FindPassword.jsp";
		}
		
		// 비밀번호를 찾기 위한 고객의 이름과 아이디 정보를 받아서 그로부터 고객의 객체를 반환한다.
		// 그 객체에서 비번이랑 메일 추출하여 메일로 인증번호를(sms대신) 보내고 인증번호를 맞춘(인증한)사람에게 비밀번호를 다시 보낸다
		String certification_number = String.valueOf((int)(Math.random()*10*99999));
		if (certification_number.length() != 6) certification_number += "5"; 
		
		EmailModel mail = new EmailModel();
		mail.mailService(cs.getEmail(), name, certification_number, sentence, request);

		request.setAttribute("cs", cs);
		request.setAttribute("certification_number", certification_number);
		return "view/FindPassword2.jsp";
	}

}
