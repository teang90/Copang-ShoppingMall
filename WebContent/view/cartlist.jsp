<%@page import="mybatis.Cart"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	//List<Cart> c_list = DAO.getCartList(request.getParameter("id"));
	//session.getAttribute("c_list");
	//System.out.println("c_list 크기 = " + c_list.size());
	String id = request.getParameter("id");
	session.setAttribute("id", id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.body{
display: flex;
font: 18px;
text-align: center;
margin: auto;
}
.input_su{
	width: 50px;
}
.total_sum{
text-align: center;
margin: 0 37%;
font-size: 20px;
font-weight: bold;
}
#under_tfoot{
	margin-bottom: 3.5%;
	text-align: center;
}
.container{
margin-top: 1.5%;
margin-bottom: 2.5%;
}

/*
table {
	border: 1px solid black;
	border-collapse: collapse;
	margin: auto;
	text-align: center;
	width: 1000px;
	
}

tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
#ctg_body{
	width: 150px;
}

#clist_body{
	margin:auto;	
	margin-left: 5%; 
	width: 70%;	
}
#intable{
	width: 100px;
	height: 130px;
	border : 0px solid white; 
}

 */

</style>
<script type="text/javascript" src = "js/jquery-3.3.1.js" ></script>
<script type="text/javascript">
	function pd_del(f) {
		var pd_confirm = confirm("선택한 상품을 장바구니에서 삭제하시겠습니까?");
		if (!pd_confirm) {
			return ;
		}else{
			alert("선택하신 제품이 삭제되었습니다.");
		}
		
		//근데 생각해 보니까 어차피 클릭한거 js에서 일케 처리 안해도 어차피 선택해서 넘기면 getParameterValues로 걍 받을 수 있지 않나?
		//굳이 일케 할 필요 있나?
		var chk = document.getElementsByName("del_ch");
		var p = new Array();
		for (var i = 0; i < chk.length; i++) {
			if (chk[i].checked == true) {
				p.push(chk[i].value);
			}
		}
		f.action="/1001_JSP_Project/Controller?cmd=cartlist_del&p_num="+p+"&id=${id}";
		f.submit();
	}
	
	 
	 var chck_tf = false;
	 function check() {
		var chk = document.getElementsByName("del_ch");
		if (chck_tf == false) {
			for (var i = 0; i < chk.length; i++) {
				document.getElementsByName("del_ch")[i].checked = true;
				//f.del_ch[i].checked = true; 이거는 왜 안되지?
			}
			chck_tf = true;
		}else{
			for (var i = 0; i < chk.length; i++) {
				document.getElementsByName("del_ch")[i].checked = false;
				//f.del_ch[i].checked = true; 이거는 왜 안되지?
			}
			chck_tf = false;
		}
	}
	
	function buy(f) {
		//장바구니 상품이 없는 경우 다음화면으로 못넘어감(상품을 선택하라고 alert 떠야함)		
		if (f.del_ch == null) {
			// f.del_ch.value == null로 하면 알트가 안떳는데, 위처럼 조건문 바꾸니까 뜸
			alert("구매하실 상품을 장바구니에 담아주세요.");
			return;
		}
		
		/*  특정상품(군)을 선택해서 구매하기 누르면 장바구니에서는 사라지고, 구매내역에는 남아있어야 한다.*/
		var chk = document.getElementsByName("del_ch");
		var p_buy = new Array();
		for (var i = 0; i < chk.length; i++) {
			if (chk[i].checked == false) {
				p_buy.push(chk[i].value);
			} else {
				p_buy.push(chk[i].value);
			}
		}
		var amt = document.getElementsByName("p_su");
		var p_su_arr = new Array();
		for (var i = 0; i < amt.length; i++) {
			p_su_arr.push(amt[i].value);
		}
		
		alert("구매 화면으로 이동합니다.");
		f.action = "/1001_JSP_Project/Controller?cmd=buy_go&p_num="+p_buy;
		f.submit();
	}
</script>
</head>
<body>
<jsp:include page="banner.jsp" />

	<div class="body">
		<div id="ctg_body">
			<jsp:include page="category.jsp"/>
		</div>
	
		<div class="container">
		<form method="post" name="f" >
			<table class="table table-bordered table-hover" id="">
				<thead>
					<tr>
						<th style="font-size: large;">
						<a onclick="check(this.form)"><input type="checkbox"></a>
						<th style="font-size: large;">상품명</th>
						<th style="font-size: large;">가격</th>
						<th style="font-size: large;" class="input_su">수량</th>
						<th style="font-size: large;">배송비</th>
						<th style="font-size: large;">상품 합계</th>
					</tr>
				</thead>
				
				<tbody>
						<c:set var="total_sum" value="0" />
						<c:if test="${!empty c_list}">
						<c:forEach var="k" items="${c_list}">
							<tr>
								<td width="5%;">
								<input type="checkbox" name="del_ch" value="${k.p_num}">
								</td>
								<td width="30%">
								<img src="images/${k.p_image_s}" width="150px" height="=100px" />
								<p>${k.p_name}</p>
								</td>
								<td width="20%;"> <c:set var="total_sum" value="${total_sum + k.p_price * k.p_su}" />${k.p_price}원</td>
								<td width="10%;"> <input type="number" class="input_su" name="p_su" value="${k.p_su}" > </td>
								<td width="10%;">2500원</td>
								<c:set var="each_sum" value="0" />
								<c:set var="each_sum" value="${each_sum + k.p_price * k.p_su}" />
								<td width="25%;"><c:out value="${each_sum + 2500}"/>원</td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty c_list}">
							<tr> <td colspan="6"> 장바구니에 상품이 없습니다. </td> </tr>
						</c:if>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="6">
							<span class="total_sum">총 주문 금액은 <c:out value="${total_sum}" />원 입니다. </span>
						</td>
					</tr>
				</tfoot>
			</table>
		
			<span id="under_tfoot">
				<input type="button" class="btn btn-primary btn-sm" value="선택 상품 삭제" onclick="pd_del(this.form)">
				<input type="button" class="btn btn-primary btn-sm" value="구매하기" onclick="buy(this.form)">
				<!--결제 정보에 들어갈 정보-->			
				<input type="hidden" name="total_price" value="${total_sum + k.p_price * k.p_su}" />
				<!--주문자 정보-->
				<input type="hidden" name="id" value="${id}" />
				<input type="hidden" name="p_name" value="${p_name}" />
				<input type="hidden" name="phone" value="${phone}" />
			</span>
			</form>
		</div> <!--컨테이너 클레스 끝-->
	</div> <!--바디 아이디 끝-->
</body>
</html>

