package model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.java.swing.plaf.windows.WindowsTreeUI.CollapsedIcon;
import com.sun.javafx.collections.SortableList;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

import mybatis.DAO;
import mybatis.VOPD;

public class PdOnelist implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String p_num = request.getParameter("p_num");
		String p_name = request.getParameter("p_name");
		String id = request.getParameter("id");
		
		System.out.println("p_name좀 보자 pdonelist "+p_name);
		
		
		VOPD pd = DAO.getPdOnelist(p_num, p_name);
		pd.setP_hit(pd.getP_hit());

		int res = DAO.getHitUp(pd);
		//System.out.println("hit 업뎃 결과"+res);
		request.getSession().setAttribute("pd", pd);
		
		//인기상품 추천해주기 위해서 여기서 동일 카테고리의 상품리스트를 보내야한다
		List<VOPD> ctg_list = DAO.getPdList_ctg(pd.getCategory());
		
		/*Collections.sort(ctg_list, new Comparator<VOPD>() {
			
			@Override
			public int compare(VOPD pd1, VOPD pd2) {
				
				if (pd1.getP_hit() > pd2.getP_hit()) {
					return 1;
				} else if(pd1.getP_hit() < pd2.getP_hit()){
					return -1;
				} else {
					return 0;
				}
			}
		});*/
		
		// 해당 카테고리의 인기상품 순서로 정렬해서 ctg_list에 넣어서 보낸다
		request.getSession().setAttribute("ctg_list", ctg_list);
		return "view/pdOnelist.jsp?id="+id;
	}
}
