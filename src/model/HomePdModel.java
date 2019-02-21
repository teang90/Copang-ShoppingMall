package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;
import mybatis.VOPD;

public class HomePdModel implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<VOPD> pd_list = DAO.getPdList();
		request.getSession().setAttribute("pd_list", pd_list);
		
		return "view/home.jsp";
	}
}
