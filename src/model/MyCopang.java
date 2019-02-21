package model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.Corder;
import mybatis.DAO;
import mybatis.Page;

public class MyCopang implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
	System.out.println("마이코팡 로그인 아이디 출력 : "+id);
		
		//페이징 처리
		Page pg = new Page();
		int cnt = DAO.getMyCopangCount(id);//전체 게시물의 개수
	System.out.println(id+"의 구매이력 db조회 결과 : "+cnt);
		pg.setTotalRecord(cnt); //해당 조건의 전체 게시물 수
		pg.setTotalPage(); 
		
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			pg.setNowPage(Integer.parseInt(cPage));
		}else {
			pg.setNowPage(1);
		}
		
		//리스트 목록 범위를 구하여 출력할 리스트 구하기
		pg.setBegin((pg.getNowPage()-1)*pg.getNumPerPage() + 1);
		pg.setEnd(pg.getBegin() + pg.getNumPerPage() - 1);
	
		List<Corder> order_list = DAO.getMyCpList(pg.getBegin(), pg.getEnd(), id);
		pg.setBeginPage( ((int)(pg.getNowPage()-1)/pg.getPagePerBlock())*pg.getPagePerBlock() +1 );
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
		request.setAttribute("order_list", order_list);
	System.out.println(id+"의 오더리스트의 사이즈 : "+order_list.size());
		return "view/NEW_MYCOPANG.jsp?id="+id;
	}

}
