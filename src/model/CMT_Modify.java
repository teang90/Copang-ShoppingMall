package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;

public class CMT_Modify implements MainModel {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String cmt_idx = request.getParameter("cmt_idx");
		String cmt_content = request.getParameter("cmt_content");
		String qna_idx = request.getParameter("qna_idx");
		String cPage = request.getParameter("cPage");
		DAO.getCMT_Modify(cmt_idx, cmt_content);
		return "Controller?cmd=detail_qna&cPage="+cPage+"&qna_idx="+qna_idx;
	}
}