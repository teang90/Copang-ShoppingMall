package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginGo implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "view/login.jsp";
	}

}
