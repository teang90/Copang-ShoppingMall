<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매내역</title>
<style type="text/css">
.total_fs{
	margin-top: 2.5%;
}

#total_fs{
	width: 30%;
	margin: auto;
}
fieldset#center_go{
text-align: center;
	margin: auto;
}

#center_go{
margin: auto;
text-align: center;
}
#mycopang_go{
margin: auto;
text-align: center;
}

</style>
<script type="text/javascript">

	function home(f) {
		f.action="/1001_JSP_Project/Controller?cmd=login&id=${cs.id}";
		f.submit();
	}
	
	function mycopang(f) {
		f.action="/1001_JSP_Project/Controller?cmd=mycopang&id=${cs.id}";
		f.submit();
	}
	
	
</script>
</head>
<body>
	<jsp:include page="banner.jsp" />

	<form method="post">
		<fieldset class="total_fs" id="total_fs">
		<legend id="legend">
			<b style="font-size: 20px;">결제내역</b>
		</legend>
		
		<fieldset class="fs" id="product_info">
		<div>${cs.name}님 결제가 정상적으로 완료됐습니다.<br>
			COPANG을 이용해주셔서 감사합니다.</div>
		<br>		
		<div id="ord_h">주문내역</div>
			<p> 수령인은 ${co.act_name}님이며, 배송 목적지는 ${co.addr} ${co.code}입니다.
			수령인의 연락처는 ${co.act_phone}이며, 결제수단은${co.payment}으로 하셨습니다.
			총 결제 금액은 ${co.total_price}원이며, 이에대한 고객님의 마일리지는 코팡 정책에 따라 ${co.mileage}원 적립되셨습니다.
			모든 정보는 하단의 마이코팡 버튼을 클릭하여 마이코팡에서 확인 가능합니다.
			</p>
			
		</fieldset>
		<input type="button" id="center_go" value="쇼핑하러 가기" onclick="home(this.form)" /> 
		<input type="button" id="mycopang_go" value="마이코팡 이동" onclick="mycopang(this.form)" /> 
		<input type="hidden" name="pw" value="${pw}" /> 
		</fieldset>
	</form>

</body>
</html>