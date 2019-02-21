package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.CST_qna_cmt;
import mybatis.DAO;

public class Qna_CmtIst implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String cPage = request.getParameter("cPage");
		String qna_idx = request.getParameter("qna_idx");
		String cmt_id = request.getParameter("cmt_id");
		String cmt_pw = request.getParameter("cmt_pw");
		String cmt_content = request.getParameter("cmt_content");
		
		CST_qna_cmt cmt = new CST_qna_cmt();
		cmt.setCmt_id(cmt_id);
		cmt.setCmt_pw(cmt_pw);
		cmt.setCmt_content(cmt_content);
		cmt.setQna_idx(qna_idx);
		DAO.getCMT_Inst(cmt);

		//request.setAttribute("cmt", cmt);
		return "Controller?cmd=detail_qna&cPage="+cPage+"&qna_idx="+qna_idx+"-";
	}
}
