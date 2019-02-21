package model;


import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;

public class CartListDel implements MainModel, Serializable{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String p_num_arr = request.getParameter("p_num");
		String id = request.getParameter("id");
		String[] p_num = p_num_arr.split(",");
		
		int crt = 0 ;
		for (int i = 0; i < p_num.length; i++) {
			crt = DAO.getCartListDel(id, p_num[i]);
			
		}
		return "Controller?cmd=cartlist&id="+id;
	}
}
