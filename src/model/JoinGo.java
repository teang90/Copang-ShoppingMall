package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JoinGo implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "view/join.jsp";
	}

}
