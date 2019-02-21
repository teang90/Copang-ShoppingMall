package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;
import mybatis.VOCS;

public class PersInfo_Modify implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id =request.getParameter("id");
		
		VOCS cs = new VOCS();
		cs.setId(id);
		cs.setEmail(request.getParameter("email"));
		cs.setName(request.getParameter("name"));
		cs.setPhone(request.getParameter("phone"));
		cs.setAddr(request.getParameter("addr"));
		cs.setCode(request.getParameter("code"));
		DAO.getModifyCustomer(cs);
		request.getSession().setAttribute("cs", cs);
		return "Controller?cmd=mycopang&id="+id;
	}
}
