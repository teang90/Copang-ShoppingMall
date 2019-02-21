package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;

public class PdListDel implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
		String p_num_arr = request.getParameter("p_num");
		String[] p_num = p_num_arr.split(",");
		
		for (int i = 0; i < p_num.length; i++){
			DAO.getAdminListDel(p_num[i]);
		}
		//System.out.println("id?"+category);
		return "Controller?cmd=manage_pro&category="+category;
	}

}
