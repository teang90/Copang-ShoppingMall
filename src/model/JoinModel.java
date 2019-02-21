package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;
import mybatis.VOCS;

public class JoinModel implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		VOCS cs = new VOCS();
		cs.setId(request.getParameter("id"));
		cs.setEmail(request.getParameter("email"));
		cs.setPw(request.getParameter("pw"));
		cs.setName(request.getParameter("name"));
		cs.setPhone(request.getParameter("phone"));
		cs.setAddr(request.getParameter("addr"));
		cs.setCode(request.getParameter("code"));
		DAO.getJoin(cs);
		
		return "view/login.jsp";
	}
}
