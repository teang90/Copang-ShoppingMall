package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

public class Logoutmodel implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate();
		return "view/home.jsp";
	}
}
