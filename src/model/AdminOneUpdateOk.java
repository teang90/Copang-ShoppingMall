package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;
import mybatis.VOPD;

public class AdminOneUpdateOk implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String pd_idx = request.getParameter("pd_idx");
		String category = request.getParameter("category");
		String p_num = request.getParameter("p_num");
		
		VOPD pd = new VOPD();
		pd.setPd_idx(Integer.parseInt(pd_idx));
		pd.setCategory(category);
		pd.setP_num(p_num);
		pd.setP_name(request.getParameter("p_name"));
		pd.setP_company(request.getParameter("p_company"));
		pd.setP_content(request.getParameter("smartEditor"));
		pd.setP_price(Integer.parseInt(request.getParameter("p_price")));
		pd.setP_saleprice(Integer.parseInt(request.getParameter("p_saleprice")));
		pd.setP_stock(Integer.parseInt(request.getParameter("p_stock")));
		
		int res = DAO.getAdminPdUpdate(pd);
		System.out.println("컨트롤러 res?"+res);
		return "Controller?cmd=admin_onelist&category="+category+"&p_num="+p_num;
	}

}
