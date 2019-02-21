package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;
import mybatis.VOCS;

public class PersInfo implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		VOCS cs = DAO.getListCs(id);
		request.setAttribute("cs", cs);
		return "view/New_Mycopang_PersInfo.jsp?id="+id;
	}

}
