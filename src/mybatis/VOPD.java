package mybatis;

import java.io.Serializable;

public class VOPD implements Serializable { //상품 VO
	private String category, p_num, p_name, p_company,
					p_image_s, p_image_l, p_content, p_date ; //subcategory
					
	
	private int  pd_idx, p_price, p_saleprice, p_stock, p_hit; 
	
	/*
	private String subcategory ; 
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	*/

	//hit는 상품을 열람한 횟수로서 hit조회순으로 검색 시 사용할 수 있다
	//stock은 재고파악이나 구매 페이에서 쓸 수도 있다
	//제조사에 맞는 제조사 코드도 추후에 추가하면 좋을 듯... 스케일이 커진다면...

	// 별도 추가 (장바구니)
	private int quant, totalprice;

	//세일가격으로 세일 퍼센트 계산(할인률)
	public int getPercent() {
		float per = (p_price - p_saleprice)*100/p_price ;
		return (int) per;
	}
	
	//장바구니 수량 변경시 총금액 자동적으로 수정
	public void setQuant(int quant) {
		this.quant = quant;
		setTotalprice(quant*p_saleprice);
	}
	
	public int getPd_idx() {
		return pd_idx;
	}

	public void setPd_idx(int pd_idx) {
		this.pd_idx = pd_idx;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getP_num() {
		return p_num;
	}

	public void setP_num(String p_num) {
		this.p_num = p_num;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_company() {
		return p_company;
	}

	public void setP_company(String p_company) {
		this.p_company = p_company;
	}

	public String getP_image_s() {
		return p_image_s;
	}

	public void setP_image_s(String p_image_s) {
		this.p_image_s = p_image_s;
	}

	public String getP_image_l() {
		return p_image_l;
	}

	public void setP_image_l(String p_image_l) {
		this.p_image_l = p_image_l;
	}

	public String getP_content() {
		return p_content;
	}

	public void setP_content(String p_content) {
		this.p_content = p_content;
	}

	public String getP_date() {
		return p_date;
	}

	public void setP_date(String p_date) {
		this.p_date = p_date;
	}

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getP_saleprice() {
		return p_saleprice;
	}

	public void setP_saleprice(int p_saleprice) {
		this.p_saleprice = p_saleprice;
	}

	public int getP_stock() {
		return p_stock;
	}

	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}

	public int getP_hit() {
		return p_hit;
	}

	public void setP_hit(int p_hit) {
		this.p_hit = p_hit;
	}

	public int getQuant() {
		return quant;
	}


	public int getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}


}
