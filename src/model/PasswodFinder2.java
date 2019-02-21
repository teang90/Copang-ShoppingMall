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

public class PasswodFinder2 implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String certification_result = request.getParameter("certification_result"); //고객이 입력한 인증번호
		String certification_number = request.getParameter("certification_number"); //로직에서 만든 인증번호
		String str = "";
		String sentence = " 님의 비밀번호 입니다.";
		
		VOCS cs = DAO.getCustomer_Password(name, id);
		String pw = cs.getPw();
		
		if (certification_result.equals(certification_number)) {
			str = "view/login.jsp";
		}else {
			return "view/FindPassword2.jsp"; 
		}

		EmailModel mail = new EmailModel();
		mail.mailService(cs.getEmail(), name, pw, sentence, request);
		
		return str;
	}

}
