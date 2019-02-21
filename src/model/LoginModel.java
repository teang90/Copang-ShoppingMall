package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;
import mybatis.VOCS;

public class LoginModel implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//String hidden = request.getParameter("hidden");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		VOCS cs = new VOCS();
		cs.setId(id);
		cs.setPw(pw);
		cs = DAO.getLogin(cs);
		if (cs == null){return "view/login.jsp?login=no";}
		
		/*if (hidden != null) {
			request.getSession().setAttribute("cs", cs);
			return "view/home.jsp?id="+id;
		}*/

		request.getSession().setAttribute("cs", cs);
		return "view/home.jsp?id="+id;
	}
}
