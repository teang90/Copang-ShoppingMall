package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;

public class Delete_CS implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String cs_idx_arr = request.getParameter("cs_idx").trim();
		String[] cs_idx = cs_idx_arr.split(","); 
		
		for (int i = 0; i < cs_idx.length; i++) {
			DAO.getAdminCS_Delete(cs_idx[i]);
		}
		//return "view/adminCsList.jsp"; 이걸로하면 삭제후 아직 리스트상에서 회원이 남아있음(디비상으로는 삭제됨)
		return "Controller?cmd=manage_customer"; 
		// 이건 삭제 후 리스트에서 고객이 사라지긴하지만, 리스트화면으로 들어가고, 
		// 새로고침 할떄마다 이미 진행된 이벤트가 계속 반복되는 문제가있음
		// 삭제후 뭔가 초기화? 새로고침? 같은 기능이 필요함
	}
}
