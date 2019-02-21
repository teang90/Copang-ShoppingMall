package model;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.Cart;
import mybatis.DAO;
import mybatis.VOPD;

public class Cartlistmodel implements MainModel, Serializable {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		Cart ct = new Cart();
		List<Cart> c_list = DAO.getCartList(id);
		

		request.setAttribute("c_list", c_list);
		return "view/cartlist.jsp";
	}
}
