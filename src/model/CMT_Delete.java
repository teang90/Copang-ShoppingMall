package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;

public class CMT_Delete implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String qna_idx = request.getParameter("qna_idx");
		String cPage = request.getParameter("cPage");
		String cmt_idx = request.getParameter("cmt_idx");
		DAO.getCMT_Delete(cmt_idx);
		return "Controller?cmd=detail_qna&cPage="+cPage+"&qna_idx="+qna_idx;
	}

}
