package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.DAO;

public class DELQNA implements MainModel {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String cPage = request.getParameter("cPage");
		String qna_idx = request.getParameter("qna_idx");
		String pwd = request.getParameter("pwd");
		String id = request.getParameter("id");
		
		System.out.println("모델 cPage&idx&pwd&id=?"+cPage+"&"+qna_idx+"&"+pwd+"&"+id);
		int res = DAO.getDelQna(qna_idx, pwd);
		
		return "Controller?cmd=Qnalist&cPage="+cPage;
	}

}
