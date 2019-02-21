package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeltOfQna implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String cPage = request.getParameter("cPage");
		String qna_idx = request.getParameter("qna_idx");
		return "view/delqna.jsp?cPage="+cPage+"&qna_idx="+qna_idx;
	}

}
