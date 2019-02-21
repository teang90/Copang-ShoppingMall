package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import mybatis.CST_QNA;
import mybatis.CST_qna_cmt;
import mybatis.DAO;

public class QnaOnelist implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String cPage = request.getParameter("cPage");
		String qna_idx = request.getParameter("qna_idx");
	
		CST_QNA qna = DAO.getQnaOnelist(qna_idx);
		qna.setQna_hit(qna.getQna_hit());
		int res = DAO.getQna_oneHitUp(qna);
		List<CST_qna_cmt> cmt_list = DAO.getCmtList(qna_idx);
		
		request.getSession().setAttribute("cmt_list", cmt_list);
		request.getSession().setAttribute("qna", qna);
		return "view/qna_detail.jsp?cPage="+cPage+"&qna_idx="+qna_idx;
	}

}
