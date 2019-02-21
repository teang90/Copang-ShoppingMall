package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AddCartmodel;
import model.AdminManageCS;
import model.AdminOneUpdateOk;
import model.AdminOnelist;
import model.BuyPd;
import model.CMT_Delete;
import model.CMT_Modify;
import model.CS_Secession;
import model.CartListDel;
import model.Cartlistmodel;
import model.CategoryModel;
import model.DELQNA;
import model.Delete_CS;
import model.DeltOfQna;
import model.EmailModel;
import model.HomeGo;
import model.HomePdModel;
import model.IdFinder;
import model.JoinGo;
import model.JoinModel;
import model.Qnalist;
import model.LoginGo;
import model.LoginModel;
import model.Logoutmodel;
import model.MainModel;
import model.MakeProduct;
import model.MakeQna;
import model.ManageProduct;
import model.MyCopang;
import model.PasswodFinder2;
import model.PasswordFinder;
import model.PayModel;
import model.PdListDel;
import model.PdOnelist;
import model.PersInfo;
import model.PersInfo_Modify;
import model.QnaInsertModel;
import model.QnaOnelist;
import model.QnaOnelistModify;
import model.QnaUpdate;
import model.Qna_CmtIst;
import model.SearchResultModel;

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Controller() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MainModel mm = null;
		String cmd = request.getParameter("cmd");
		
		
		if(cmd.equals("login")) { //로그인화면에서 로그인 처리하여 홈으로 가기
			mm = new LoginModel();
		}else if (cmd.equals("logingo")) { //인덱스에서 로그인 화면가기
			mm = new LoginGo();
		}else if (cmd.equals("joingo")) { //인덱스에서 조인 화면가기
			mm = new JoinGo();
		}else if (cmd.equals("category")) {
			mm = new CategoryModel();
		}else if (cmd.equals("logout")) { //로그아웃
			mm = new Logoutmodel();
		}else if(cmd.equals("join")){ //회갑하기
			mm = new JoinModel();
		}else if (cmd.equals("pd_list")) { //홈에서 전체 목록보기
			mm = new HomePdModel();
		}else if (cmd.equals("search")) { //검색하기
			mm = new SearchResultModel();
		}else if (cmd.equals("manage_pro")) { //관리자 상품 목록보기
			mm = new ManageProduct();
		}else if (cmd.equals("makePd")) { //관리자_상품 등록
			mm = new MakeProduct();
		}else if (cmd.equals("pd_onelist")) { //상품 상세보기
			mm = new PdOnelist();
		}else if (cmd.equals("cartlist")) { //고객 자신의 장바구니 보기
			mm = new Cartlistmodel();
		}else if (cmd.equals("addCartlist")) { //고객이 원하는 상품 장바구니에 추가하기
			mm = new AddCartmodel();
		}else if (cmd.equals("adminPdListDel")) {//관리자가 상품 삭제
			mm = new PdListDel();
		}else if (cmd.equals("cartlist_del")) { //고객이 장바구니에서 상품 제거하기
			mm = new CartListDel();
		}else if (cmd.equals("makeQna")) { //게시글 작성
			mm = new MakeQna();
		}else if(cmd.equals("Qnalist")) { //고객센터, 게시글 목록 화면 가기
			mm = new Qnalist();
		}else if (cmd.equals("detail_qna")) {// 게시글 목록에서 글 상세 db처리 후 상세보기 화면으로 이동
			mm = new QnaOnelist();
		}else if (cmd.equals("qna_modify")) {// 게시글 수정1
			mm = new QnaOnelistModify();
		}else if(cmd.equals("update")){ //게시글 수정2
			mm = new QnaUpdate();
		}else if(cmd.equals("qna_delt")) { //게시글 삭제1
			mm = new DeltOfQna();
		}else if (cmd.equals("del")) {//게시글 삭제2
			mm = new DELQNA();
		}else if (cmd.equals("admin_onelist")) {
			mm = new AdminOnelist();
		}else if (cmd.equals("adminOneUpdate")) {//관리자가 상품 수정
			mm = new AdminOneUpdateOk();
		}else if (cmd.equals("buy_go")) { // 카트리스트에서 주문정보 입력으로 이동
			mm = new BuyPd();
		}else if (cmd.equals("pay")) { //상품 최종 구매
			mm = new PayModel();
		}else if (cmd.equals("mycopang")) {
			mm = new MyCopang();
		}else if (cmd.equals("pers_info")) {
			mm = new PersInfo();
		}else if (cmd.equals("manage_customer")) {
			mm = new AdminManageCS();
		}else if (cmd.equals("per_modify")) { //회원이 자신의 정보 수정
			mm = new PersInfo_Modify();
		}else if (cmd.equals("pers_secession")) { //회원 탈퇴
			mm = new CS_Secession();
		}else if (cmd.equals("qnaInsert")) { // 게시글쓰기 화면으로 이동
			mm = new QnaInsertModel();
		}else if (cmd.equals("cs_delete")) { // 회원 삭제
			mm = new Delete_CS();
		}else if (cmd.equals("qna_cmt_add")) { //댓글삽입
			mm = new Qna_CmtIst();
		}else if (cmd.equals("cmt_modify")) {
			mm = new CMT_Modify();
		}else if (cmd.equals("cmt_delete")) {
			mm = new CMT_Delete();
		}else if (cmd.equals("id_finder")) {
			mm = new IdFinder();
		}else if (cmd.equals("pw_certification")) { //인증번호 보내기
			mm = new PasswordFinder();
		}else if (cmd.equals("password_finder")) { // 인증번호 확인하여 비밀번호 메일로 보내기
			mm = new PasswodFinder2();
		}
		
		
		String path = mm.exec(request, response);
		if (path.contains("-")) {
			// 새로고침 할때마다 중복삽입 현상 방지하기 위해서 센드 리다이렉트로 보냈음
			// 이름이나 속성등을 설정할때 - 대신에 _을 넣어야함(-넣으니까 리다이렉트되어서 null값뜸)
			response.sendRedirect(path.substring(0, path.length()-1));
		}else {
			request.getRequestDispatcher(path).forward(request, response);
		}
	}
}
