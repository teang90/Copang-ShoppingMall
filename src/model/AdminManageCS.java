package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;
import mybatis.VOCS;

public class AdminManageCS implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		List<VOCS> cst_list = DAO.getCustList();
		request.getSession().setAttribute("cst_list", cst_list);
		return "view/adminCsList.jsp";
	}

}
