package model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.DAO;
import mybatis.VOPD;

public class MakeProduct implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/images");
		String str = "";
		try {
			MultipartRequest mr = new MultipartRequest(request, path, 500*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		
			VOPD pd = new VOPD();
			//pd.setSubcategory(mr.getParameter("subcategory"));
			pd.setCategory(mr.getParameter("category"));
			pd.setP_num(mr.getParameter("p_num"));
			pd.setP_name(mr.getParameter("p_name"));
			pd.setP_company(mr.getParameter("p_company"));
			pd.setP_image_s(mr.getFilesystemName("p_image_s"));
			pd.setP_content(mr.getParameter("smartEditor"));
			pd.setP_price(Integer.parseInt(mr.getParameter("p_price")));
			pd.setP_saleprice(Integer.parseInt(mr.getParameter("p_saleprice")));
			pd.setP_stock(Integer.parseInt(mr.getParameter("p_stock")));
			
			
			int res = DAO.getAddPd(pd);
			if (res > 0) {
				str = "view/adminPdList.jsp?category="+mr.getParameter("category")+"-";
			}else {
				str = "view/home.jsp";
				}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return str;
	}

}
