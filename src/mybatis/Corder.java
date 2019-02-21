package mybatis;

public class Corder {
	//주문 정보 => 12개
	
	private int total_price, mileage ;
	private String orderNum, id, act_name, addr, code, req_msg, order_date, act_phone, payment, p_name, p_num, buy_method ;

	
	public String getBuy_method() {
		return buy_method;
	}
	public void setBuy_method(String buy_method) {
		this.buy_method = buy_method;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
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
	public String getAct_phone() {
		return act_phone;
	}
	public void setAct_phone(String act_phone) {
		this.act_phone = act_phone;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAct_name() {
		return act_name;
	}
	public void setAct_name(String act_name) {
		this.act_name = act_name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getReq_msg() {
		return req_msg;
	}
	public void setReq_msg(String req_msg) {
		this.req_msg = req_msg;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	
}

