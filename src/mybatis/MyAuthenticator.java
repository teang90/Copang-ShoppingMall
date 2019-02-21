package mybatis;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import sun.security.util.Password;

public class MyAuthenticator extends Authenticator{
	PasswordAuthentication password;
	
	public MyAuthenticator() {
		String id = "teang90";
		String pw = "jty815815!!";
		password =  new PasswordAuthentication(id, pw);
	}
	
	//시스템에서 사용하는 인증정보
	public PasswordAuthentication getPasswordAuthentication() {
		return password;
	}
	
}

