package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;
import mybatis.VOPD;

public class ManageProduct implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//상품 리스트 쭉 나오고, 그리고 상품 등록 / 삭제 버튼 있으면 될듯
		//카테고리에 따른 상품 리스트 반환 => 필요정보: 카테고리  
		String category = request.getParameter("category");
		System.out.println("category?(model)"+category);
		List<VOPD> pd_list_ctg = DAO.getPdList_ctg(category);
		request.getSession().setAttribute("pd_list_ctg", pd_list_ctg);
		return "view/adminPdList.jsp?category=" + category ;
	}

}
