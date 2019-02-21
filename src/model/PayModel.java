package model;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.Cart;
import mybatis.Corder;
import mybatis.DAO;
import mybatis.VOCS;
import mybatis.VOPD;

public class PayModel implements MainModel, Serializable {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String act_name = request.getParameter("act_name");
		String addr = request.getParameter("addr");
		String code = request.getParameter("code");
		String req_msg = request.getParameter("req_msg");
		String act_phone = request.getParameter("act_phone");
		String total_price = request.getParameter("sum_p_price"); //결제액
		String payment = request.getParameter("payment"); //결제방법
		String method = request.getParameter("buy_method"); //결제 정보(주문 내역에서 조회 가능하도록)
		
		// ","로 연결된 문자열로 들어오는 자료
		String p_name = request.getParameter("p_name").trim();
		String p_num_arr = request.getParameter("p_num_arr");
		String p_su_arr = request.getParameter("p_su_arr");
		
		Corder co = new Corder();
		co.setId(id);
		co.setAct_name(act_name);
		co.setAddr(addr);
		co.setCode(code);		
		co.setReq_msg(req_msg);
		co.setAct_phone(act_phone);
		co.setPayment(payment);
		co.setP_name(p_name);
		co.setP_num(p_num_arr);
		co.setTotal_price(Integer.parseInt(total_price));
		co.setMileage((int)(Integer.parseInt(total_price)*0.07));
		co.setBuy_method(method); //결제수단 삽입시키기
		int res = DAO.getPurchase(co);
		
		//VOPD의 자료가 필요해서 히든으로 다 받아서 배열로 만듬
		String[] p_su = p_su_arr.split(",");
		String[] p_num = p_num_arr.split(",");
		
		for (int i = 0; i < p_num.length; i++) {
			//상품 구매 후 재고에서 -1씩 해주기
			Cart ct = DAO.getChkCartList(id, p_num[i]);
			
			//p_num의 코드를 가진 상품 호출(나중에 category나 idx를 같이 보내서 맵형태로 처리하던가
			// 조인을 이용해서 맵퍼에서 한번에 처리하는 것도 시도, 지금 아래의 코드는 그냥 무식하게 해당 상품을 뽑아서
			// 재고 고치는 식임 즉, 코드 낭비, 효율성 저하가 예상됨)
			VOPD pd = DAO.getPd_StockforObj(p_num[i]);
			
			//p_su만큼 빼줘야 함
			//만약 수량이 재고보다 많은 경우는 이전의 페이지(pd_onelist에서 해결해야한다.)
			pd.setP_stock(pd.getP_stock() - ct.getP_su());
			DAO.getStockUpdate(pd);
			
			//구매후 카트리스트 목록 삭제
			DAO.getCartListDel(id, p_num[i]);
		}

		//System.out.println("오더넘버 "+co.getOrderNum());
		//여기 오더넘버를 pk하여 바로 위에서 시퀀스로 오더넘버를 생성한 것을 받아야 하는데 같은 클래스 내에서 처리가 안됬나? ㅠ
		//Corder cor = DAO.getHistOPurch(id, co.getOrderNum()); //id값을 넣어서 이 사람이 구매한 내역을 반환
		//request.setAttribute("cor", cor);
		
		VOCS cs = DAO.getCustInfo(id);
		String pw = cs.getPw();
		request.setAttribute("co", co);
		request.setAttribute("pw", pw);
		request.setAttribute("cs", cs);
		
		/*
		여기로 온 주문정보를 받아서 구매내역에 보내고
		카트리스트의 상품은 삭제시키고
		마이코팡에서 구매내역을 통해서 확인할 수 있게 만든다
		*/
		
		return "view/afterpurchse.jsp";
	}
}
