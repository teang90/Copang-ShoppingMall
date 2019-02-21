package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;

public class CS_Secession implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		DAO.getCS_Delete(id); //고객 탈퇴
		return "Controller?cmd=logout";
	}

}
