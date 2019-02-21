package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;
import mybatis.VOCS;
import mybatis.VOPD;

public class SearchResultModel implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String keyword = request.getParameter("keyword");
		String str = "";
		List<VOPD> srch_result = DAO.getSearchPD(keyword);
		request.setAttribute("srch_result", srch_result);
		return "view/searchResult.jsp";
	}
}
