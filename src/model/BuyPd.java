package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.Cart;
import mybatis.DAO;
import mybatis.VOCS;

public class BuyPd implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String total_price = request.getParameter("total_price");
		String id = request.getParameter("id");
		//String name = request.getParameter("name");
		
		String p_num_arr = request.getParameter("p_num");
		System.out.println("바이피디 p_num_arr= "+p_num_arr);
		
		String[] p_num = p_num_arr.split(",");
		List<Cart> cart_list = DAO.getCartList(id);
		
		VOCS cs = DAO.getCustInfo(id);
		request.getSession().setAttribute("cs", cs);
		request.getSession().setAttribute("cart_list", cart_list);
		
		return "view/buyProduct.jsp?total_price="+total_price;
	}

}
