package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeGo implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "Controller?cmd=pd_list";
	}

}
