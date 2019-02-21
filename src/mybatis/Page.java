package mybatis;

public class Page {
	
	private int nowPage = 1; // 현재 페이지
	private int nowBlock = 1; // 현재 블록
	
	private int totalRecord = 0; // 총 게시물의 수(원글의 수)
	private int numPerPage = 10; // 한 페이지의 게시되는 원글의 수
	private int pagePerBlock = 5; // 블록당 표현되는 페이지의 수
	
	private int totalPage = 0; // 전체 페이지의 수
	private int totalBlock = 0; // 전체 블록의 수
	
	private int begin = 0; // 시작번호
	private int end = 0; // 끝번호
	private int beginPage = 0 ; // 시작 블록
	private int endPage=0; // 끝블록
	
	//전체 게시물로 전체 페이지의 수 구하기
	public void setTotalPage() {
		if (totalRecord <= numPerPage) {
			totalPage = nowPage;
		}else {
			if (totalRecord % numPerPage ==0) {
				totalPage = totalRecord / numPerPage;
			}else {
				totalPage = (totalRecord/numPerPage) + 1;
			}
		}
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public int getPagePerBlock() {
		return pagePerBlock;
	}
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getTotalPage() {
		return totalPage;
	}
	
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	
	
}
