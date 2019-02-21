package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;
import mybatis.VOPD;

public class AdminOnelist implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
		String p_num = request.getParameter("p_num");
		
		VOPD pd = DAO.getPdOnelist_two(category, p_num);
		request.setAttribute("pd", pd);

		return "view/adminOnelist.jsp";
	}
}
