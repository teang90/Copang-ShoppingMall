package mybatis;

import java.io.Serializable;

public class Cart implements Serializable {

	private String id, p_num, p_name, p_image_s;
	private int crt_idx, p_price, p_saleprice, p_su ;
	
	public int getP_saleprice() {
		return p_saleprice;
	}
	public void setP_saleprice(int p_saleprice) {
		this.p_saleprice = p_saleprice;
	}
	public int getCrt_idx() {
		return crt_idx;
	}
	public void setCrt_idx(int crt_idx) {
		this.crt_idx = crt_idx;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_su() {
		return p_su;
	}
	public void setP_su(int p_su) {
		this.p_su = p_su;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getP_image_s() {
		return p_image_s;
	}
	public void setP_image_s(String p_image_s) {
		this.p_image_s = p_image_s;
	}
	
}
