package mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class DAO {
	private static SqlSession ss;
	
	// 싱글턴 패턴 :  프로그램이 끝날 때 까지 해당 객체 하나 가지고 사용
	private synchronized static SqlSession getSession() {
		if(ss == null) {
			// 수동 커밋 (트랜잭션 처리 할때 사용)
			// ss = DBService.getFactory().openSession(false);
            // 자동 커밋 
			ss = DBService.getFactory().openSession(true);
		}
		return ss;
	}
	
	// 로그인
	public static VOCS getLogin(VOCS cs) {
		 return getSession().selectOne("login", cs);
	}
	
	//회원가입
	public static int getJoin(VOCS cs) {
		return getSession().insert("join", cs);
	}
	
	//상품 리스트
	public static List<VOPD> getPdList() {
		return getSession().selectList("pd_list");
	}
	
	//카테고리별 제품 리스트
	public static List<VOPD> getPdList_ctg(String category) {
		//System.out.print("DAO?"+category);
		return getSession().selectList("pd_list_ctg", category);
	}
	
	public static List<VOPD> getPD_num_list(String p_num) {
		//System.out.print("DAO?"+category);
		return getSession().selectList("pd_num_list_ctg", p_num);
	}
	
	//관리자가 상품등록(추가)하기
	public static int getAddPd(VOPD pd) {
		return getSession().insert("pd_insert", pd);
	}

	//상품 상세정보 보기
	public static VOPD getPdOnelist(String p_num, String p_name) {
		Map<String, String> map = new HashMap<>();
		map.put("p_num", p_num);
		map.put("p_name", p_name);
		return getSession().selectOne("pd_onelist", map);
	}
	
	//해당 아이디의 카트리스트 목록 뿌리기
	public static List<Cart> getCartList(String id) {
		return getSession().selectList("cartlist", id);
	}
	
	//카트 리스트에 상품 담기
	public static int getInsertCartList(Cart ct) {
		return getSession().insert("cartinsert", ct);
	}
	
	//이미 있는 상품 카트리스트에서 수량 추가
	public static int getCartUpdate(Cart ct) {
		//System.out.println("DAO p_su= "+ ct.getP_su());
		//System.out.println("DAO Id= "+ ct.getId());
		//System.out.println("DAO p_num= "+ ct.getP_num());
		return getSession().update("cartup", ct);
	}
	
	//카트리스트에 파라미터값을 만족하는 상품 있나 확인
	public static Cart getChkCartList(String id, String p_num) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("p_num", p_num);
		return getSession().selectOne("chkcart", map);
	}

	public static int getAdminListDel(String p_num) {
		return getSession().delete("AdmPdList", p_num);
	}

	public static int getCartListDel(String id, String p_num) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("p_num", p_num);
		//System.out.println("test_DAO P_NUM=" + p_num);
		//System.out.println("test_DAO id=" + id);
		return getSession().delete("Cartlistdel", map);
	}

	public static int getMakeQna(CST_QNA qna) {
		return getSession().insert("insert_qna", qna);
	}
	
	//고객센터 게시글 불러오기
	public static List<CST_QNA> getQnaList(int begin, int end){
		//System.out.println("DAO_begin=?"+begin);
		//System.out.println("DAO_end=?"+end);
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);		
		map.put("end", end);
		return getSession().selectList("qnalist", map);
	}

	public static int getCount() {
		return getSession().selectOne("qna_totalRecord");
	}
	
	public static int getMyCopangCount(String id) {
		return getSession().selectOne("corder_totalRecord", id);
	}
	
	//qna 게시글 상세보기
	public static CST_QNA getQnaOnelist(String qna_idx) {
		return getSession().selectOne("qna_onelist", qna_idx);
	}

	public static int getQNAOneUpdate(CST_QNA qna) {
		return getSession().update("QNAonelist_update", qna);
	}

	public static int getDelQna(String qna_idx, String pwd) {
		return getSession().delete("qna_del", qna_idx);
	}

	public static VOPD getPdOnelist_two(String category, String p_num) {
		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("p_num", p_num);
		return getSession().selectOne("onelist_two", map);
	}

	public static int getAdminPdUpdate(VOPD pd) {
		return getSession().update("adminUpdate", pd);
	}

	public static VOCS getCustInfo(String id) {
		return getSession().selectOne("infoCustomer", id);
	}

	public static int getPurchase(Corder co) {
		return getSession().insert("purchse", co);
	}

	public static Corder getHistOPurch(String id, String ordernum) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("ordernum", ordernum);
		return getSession().selectOne("orderlist", map);
	}

	public static VOCS getListCs(String id) {
		return getSession().selectOne("eachCsInfo", id);
	}

	public static int getModifyCustomer(VOCS cs) {
		return getSession().update("csUpdate", cs);
	}

	public static int getCS_Delete(String id) {
		return getSession().delete("cs_secession", id);
	}
	public static int getAdminCS_Delete(String cs_idx) {
		return getSession().delete("admin_cs_secession", cs_idx);
	}

	public static String getIdDupleChk(String id) {
		String res = "0"; 
		List<VOCS> cs_list = getSession().selectList("idcheck", id);
		if(cs_list.size() > 0) {
			res = "1";
		}
		return res;
	}

	public static List<VOCS> getCustList() {
		return getSession().selectList("cstlist");
	}

	public static List<VOPD> getSearchPD(String keyword) {
		return getSession().selectList("srchPD", keyword);
	}

	public static int getCMT_Inst(CST_qna_cmt cmt) {
		//System.out.println("cmt_id2 = "+cmt.getCmt_id());
		return getSession().insert("cmt_insert", cmt);
	}
	
	public static List<CST_qna_cmt> getCmtList(String qna_idx){
		return getSession().selectList("cmt_list", qna_idx);
	}

	public static int getCMT_Delete(String cmt_idx) {
		return getSession().delete("cmt_del", cmt_idx);
	}
	
	public static int getCMT_Modify(String cmt_idx, String cmt_content) {
		Map<String, String> map = new HashMap<>();
		map.put("cmt_idx", cmt_idx);
		map.put("cmt_content", cmt_content);
		return getSession().update("cmt_mdf", map);
	}
	
	//조회수 올리는 DAO
	public static int getHitUp(VOPD pd) {
		return getSession().update("hit_up", pd);
	}
	
	//고객이 구매한 만큼 재고 감소
	public static int getStockUpdate(VOPD pd) {
		return getSession().update("stock_update", pd);
	}
	
	public static VOPD getPd_StockforObj(String p_num) {
		return getSession().selectOne("StockOfPd", p_num);
	}
	
	//고객 게시판 게시글 조회수 업
	public static int getQna_oneHitUp(CST_QNA qna) {
		return getSession().update("oneQna_hitup", qna);
	}

	public static VOCS getCustomer_Id(String name, String email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		return getSession().selectOne("find_id_through_email", map);
	}

	public static VOCS getCustomer_Password(String name, String id) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("id", id);
		return getSession().selectOne("find_password_by_id", map);
	}

	public static List<Corder> getMyCpList(int begin, int end, String id) {
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("id", id);
		return getSession().selectList("mycopang_corderlist",map);
	}
	
	

	
	
	
}








