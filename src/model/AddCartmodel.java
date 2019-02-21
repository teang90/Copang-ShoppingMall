package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.Cart;
import mybatis.DAO;
import mybatis.VOPD;

public class AddCartmodel implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String amt = request.getParameter("amt");
		String p_num = request.getParameter("p_num");
		String p_name = request.getParameter("p_name");
		String p_price = request.getParameter("p_price");
		String p_image_s = request.getParameter("p_image_s");
		String p_saleprice = request.getParameter("p_saleprice");
		String str = "";
		System.out.println("p_name 좀 보자"+p_name);
		
		
		Cart ct = DAO.getChkCartList(id, p_num);
		
		if(ct == null) {
			Cart ct2 = new Cart();
			ct2.setId(id);
			ct2.setP_num(p_num);
			ct2.setP_name(p_name);
			ct2.setP_price(Integer.parseInt(p_price));
			ct2.setP_su(Integer.parseInt(request.getParameter("amt")));
			ct2.setP_saleprice(Integer.parseInt(request.getParameter("p_saleprice")));
			ct2.setP_image_s(p_image_s);
			DAO.getInsertCartList(ct2);
			str = "Controller?cmd=pd_onelist&p_num="+ct2.getP_num()+"&p_name="+ct2.getP_name();
		}else {
			ct.setP_su(Integer.parseInt(request.getParameter("amt")));
			DAO.getCartUpdate(ct);
			str = "Controller?cmd=pd_onelist&p_num="+ct.getP_num()+"&p_name="+ct.getP_name();
		}

		return str;
	}
}
