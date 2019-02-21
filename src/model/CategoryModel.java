package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;
import mybatis.VOPD;

public class CategoryModel implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
		//String subcategory = request.getParameter("subcategory");
		
		List<VOPD> pd_sublist = null ;
		if (category.equals("ELC appliance")) {
			// 원래는 이게 맞는 코인데 내가 서브카테고리를 안만들어서 구라로 그냥 p_num에 서브카테고리 문자열 포함시켜서
			// 카테고리로 들어온 값을 p_num으로 다시 받아서 Like들어간 쿼리로 p_num에 서브 카테고리로 분류하여 출력
			// 즉 현  상황에서 여기 true part는 쓸모 없음
			pd_sublist = DAO.getPdList_ctg(category);
		}else{
			String p_num = category;
			pd_sublist = DAO.getPD_num_list(p_num);
		}
		
		request.getSession().setAttribute("pd_sublist", pd_sublist);
		
		String id = request.getParameter("id");
		if (id != null) {
			return "view/category_pd.jsp?id="+id;
		}else {
			return "view/category_pd.jsp";
		}
	}
}
