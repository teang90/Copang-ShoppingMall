<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	session.getAttribute("cs");
	session.getAttribute("cart_list");
	/* 값 오는지 확인, this, 함수변수 이용하기  */
%>
<!--여기서도 VOPD를 받아서 주문할때 재고보다 수량이 많은경우 수량 수정을 하게해야한다.-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코팡 주문정보 입력</title>
<style type="text/css">
	fieldset.fs {
		margin-left: 10%;
		margin-right: 10%;
	}
	tfoot input#payment {
		width: 20px;
	}
	#cart_table {
		text-align: center;
	}
	#btn{
		margin-top:1.5%;
		text-align: center;
	}
	#total_fs{
		margin-bottom: 2.5%;
	}
	span.req_msg{
		float: left;
	}
	input#nm{
		text-align:center;
		background-color: white; 
		border: 0px;
		font-size: 15px;
		font-style: #ffffff;
		font-weight: 5;
		font-family: 휴먼;
	}
</style>
<script type="text/javascript">
 function payment_go(f) {
		//수령인 정보 공란 체크(배송요청 제외)
		if (f.act_name.value == "" || f.act_phone.value == "" || f.addr.value == "" || f.code.value == "" ) {
			alert("받으시는 분의 정보를 입력해주세요");
			return ;
		}
		if (f.payment.value == "") {
			alert("결제방법을 선택해 주세요");
			return;
		}
		if (f.method.value == "") {
			go_payment();
			return ;
		}
		var name = document.getElementsByName("p_name");
		var pname = new Array();
			for (var i = 0; i < name.length; i++){
				pname.push(name[i].value);
			}
		var quantity = document.getElementsByName("p_su");
		var p_su_arr = new Array();
			for (var i = 0; i < quantity.length; i++) {
				p_su_arr.push(quantity[i].value);
			}
		var chk = document.getElementsByName("p_num");
		var p_num_arr = new Array();
			for (var i = 0; i < chk.length; i++){
				p_num_arr.push(chk[i].value);
			}
		f.action="/1001_JSP_Project/Controller?cmd=pay&p_name="+ pname+"&p_num_arr="+p_num_arr+"&p_su_arr="+p_su_arr;
		f.submit();
	}

 	//결제수단 방법별로 결제 정보 받기
	/* 함수 변수로 만들어서 호출한 값을 다시 받아오게 이떄 this를 사용해서 받자
	var go_payment = new 이 방식 말고 걍 윈도우 자식 창에서 opener로 값 다시 받음*/
	 
	 function go_payment() {
		var popName = "결제정보";
		var option = "width=500, height=450, resizable=no, scrollbars=yes, status=no; left=15%, top=25%";
		if (f.payment.value == 'account') {
			var url = "/1001_JSP_Project/view/paymethod.jsp?method="+f.payment.value;
			open(url, popName, option);			
		}else if(f.payment.value == "card"){
			var url = "/1001_JSP_Project/view/paymethod.jsp?method="+f.payment.value;
			open(url, popName, option);		
		}else if(f.payment.value == "cellphone"){
			var url = "/1001_JSP_Project/view/paymethod.jsp?method="+f.payment.value;
			open(url, popName, option);	
		}else if(f.payment.value == "deposit"){
			var url = "/1001_JSP_Project/view/paymethod.jsp?method="+f.payment.value;
			open(url, popName, option);
		}
	} 
	//함수 끝
	
	
</script>
</head>
<body>
	<jsp:include page="banner.jsp" />
	<br>
	<br>
	
<form method="post" name="f">
	<fieldset id="total_fs">
		<legend id="legend">
			<b style="font-size: 20px;">주문정보</b>
		</legend>
		
		<fieldset class="fs" id="product_info">
			<legend> <b>구매자 정보</b></legend>

			<div>
				구매자 아이디 <input class="input" type="text" name="id" disabled="disabled" value="${cs.id}">
			</div>
			
			<br>
			<div>
				구매자 이름 <input class="input" type="text" name="name" disabled="disabled" value="${cs.name}">
			</div>
			
			<br>
			<div>
				휴대전화 <input class="input" type="text" name="phone" disabled="disabled" value="${cs.phone}">
			</div>
		</fieldset>
		<br>

		<fieldset class="fs" id="corder_info">
			<legend> <b>수령인 정보</b></legend>
			<div>
				수령인 이름 <input class="input" type="text" name="act_name">
			</div>
			<br>

			<div>
				수령인 연락처 <input class="input" type="text" name="act_phone" placeholder=" 'ㅡ'를 넣어서 입력해주세요">
			</div>
			<br>

			<div>
				수령인 주소 <input class="input" type="text" name="addr"> &nbsp;
				상세 주소  <input class="input" type="text" name="code">
			</div>
			<br>

			<div>
				<span class="req_msg">
				배송 요청사항
				</span>
				<p class="req_msg">
					<textarea rows="3" cols="40" name="req_msg"></textarea>
				</p>
			</div>	
		</fieldset >
		
		<br>
		<fieldset class="fs" id="cartlist_info">
			<legend><b>배송상품</b></legend>
			<div>
				<c:set var="sum_p_price" value="0" />
				<c:set var="sum_p_saleprice" value="0" />
				<c:set var="total_p_price" value="0" />
				<table id="cart_table">
					<thead>
					<tr> 
					 	<th>번호 </th> 
						<th>상품명</th> 
						<th>구매수량</th> 
						<th>구매가격</th> 
						<th>할인가격</th> 
						<th>결제액</th> 
					</tr>
					</thead>
					<tbody>
						<c:forEach var="k" items="${cart_list}" varStatus="vs">
						 	<input type="hidden" name="p_num" value="${k.p_num}" /> 
						 	<input type="hidden" name="p_su" value="${k.p_su}" />
							<tr> 
								<td>${vs.count} </td> 
								<td><input type="text" name="p_name" id="nm" disabled="disabled" value="${k.p_name}"> </td> 
								<td>${k.p_su} 개 </td> 
								<td>${k.p_price} 원</td> 
								<td>${k.p_saleprice} 원</td> 
								<td>${(k.p_price-k.p_saleprice)*k.p_su} 원</td> 
								<c:set var="sum_p_price" value="${sum_p_price + (k.p_su)*(k.p_price - k.p_saleprice)}"/>
								<c:set var="sum_p_saleprice" value="${sum_p_saleprice + (k.p_su)*(k.p_saleprice)}"/>
								<c:set var="total_p_price" value="${total_p_price + (k.p_su)*(k.p_price)}"/>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</fieldset>
		<br>
		<fieldset class="fs" id="payment_info">
			<legend><b>결제정보</b></legend>
			<div>
			<table>
				<tbody> 
					<tr> <td>총 상품가격</td> <td> <c:out value="${total_p_price}" />원 </td> </tr>
					<tr> <td>할인</td> <td><c:out value="-${sum_p_saleprice}" />원 </td> </tr> 
					<tr> <td>배송비</td> <td> <%-- ${2500} --%>3000 원 </td> </tr> 
					<tr> <td>총 결제금액</td> <td> <c:out value="${sum_p_price}" />원  </td> </tr> 
				</tbody>
				<tfoot id="tfoot">
					 <tr><td colspan="1"> 
						 <select name="payment">
							<option>결제방법</option>
						 	<option value="account">계좌이체 </option>
						 	<option value="card">신용/체크카드</option>
						 	<option value="cellphone">휴대폰 요금</option>
						 	<option value="deposit">무통장 입금</option>
						 </select>
					  </td></tr>
				</tfoot>
			</table>
			</div>
		</fieldset>
		<div id="btn">
			<input type="button" value="결제" id="ll" onclick="payment_go(this.form)" />
			<input type="hidden" name="total_p_price" value="${total_p_price}">
			<input type="hidden" name="sum_p_saleprice" value="${sum_p_saleprice}">
			<input type="hidden" name="sum_p_price" value="${sum_p_price}">
			<input type="hidden" name="id" value="${cs.id}">
			<input type="hidden" name="buy_method" id="method" >
		</div>

	</fieldset>
	</form>
</body>
</html>