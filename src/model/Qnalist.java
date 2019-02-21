package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.CST_QNA;
import mybatis.DAO;
import mybatis.Page;

public class Qnalist implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		Page pg = new Page();
		int cnt = DAO.getCount();
		//System.out.println("cnt?"+cnt);
		pg.setTotalRecord(cnt);
		pg.setTotalPage();
		
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			pg.setNowPage(Integer.parseInt(cPage));
		}else {
			pg.setNowPage(1);
		}
		//리스트 목록 범위
		pg.setBegin((pg.getNowPage()-1) * pg.getNumPerPage() + 1 );
		pg.setEnd(pg.getBegin() + pg.getNumPerPage() - 1);

		List<CST_QNA> qna = DAO.getQnaList(pg.getBegin(), pg.getEnd());
		request.getSession().setAttribute("qna", qna);
		
		pg.setBeginPage(((int)((pg.getNowPage()-1)/pg.getPagePerBlock()))*pg.getPagePerBlock()+1);
		pg.setEndPage(pg.getBeginPage()+pg.getPagePerBlock()-1);
		
		//endPage가 totalPage보다 큰 경우 방지
		if (pg.getEndPage() > pg.getTotalPage()) {
			pg.setEndPage(pg.getTotalPage());
		}
		
		request.setAttribute("beginPage", pg.getBeginPage());
		request.setAttribute("endPage", pg.getEndPage());
		request.setAttribute("pagePerBlock", pg.getPagePerBlock());
		request.setAttribute("nowPage", pg.getNowPage());
		request.setAttribute("totalPage", pg.getTotalPage());
		return "view/qna.jsp?id="+id;
	}
}
