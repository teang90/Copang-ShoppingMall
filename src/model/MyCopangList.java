package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.Corder;
import mybatis.DAO;
import mybatis.Page;

public class MyCopangList implements MainModel {

	//ajax 마이코팡 화면에서 구매내역 출력, ajax로 만들려고 한건데 실패한거...
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		System.out.println("id? "+id);
		Page pg = new Page();
		List<Corder> order_list = DAO.getMyCpList(pg.getBegin(), pg.getEnd(), id);
		StringBuffer sf = new StringBuffer();
		sf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sf.append("<corders>");
		for (Corder k : order_list) {
			sf.append("<corder>");
			sf.append("<ordernum>"+k.getOrderNum()+"</ordernum>");
			sf.append("<id>"+k.getId()+"</id>");
			sf.append("<act_name>"+k.getAct_name()+"</act_name>");
			sf.append("<addr>"+k.getAddr()+"</addr>");
			sf.append("<code>"+k.getCode()+"</code>");
			sf.append("<req_msg>"+k.getReq_msg()+"</req_msg>");
			sf.append("<order_date>"+k.getOrder_date()+"</order_date>");
			sf.append("<act_phone>"+k.getAct_phone()+"</act_phone>");
			sf.append("<payment>"+k.getPayment()+"</payment>");
			sf.append("<p_name>"+k.getP_name()+"</p_name>");
			sf.append("<total_price>"+k.getTotal_price()+"</total_price>");
			sf.append("<p_num>"+k.getP_num()+"</p_num>");
			sf.append("</corder>");
		}
		sf.append("</corders>");
		String res = sf.toString();
		return res;
	}
}
