 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    String method = request.getParameter("method");
    session.setAttribute("method", method);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 정보 입력</title>

<script type="text/javascript">
function payment_end(f) {
	alert("결제정보 입력이 완료되었습니다. 결제를 원하시면 결제버튼을 눌러주세요.");	
	window.opener.document.getElementById("method").value = f.method.value;
	window.close();
}

</script>

</head>
<body>
	<h1 style="text-align: center;"> COPANG 결제정보 입력</h1>
		<div>
		<fieldset>
		<form method="post" name="f">
			<c:if test="${method == 'account'}">
				계좌번호 : <input type="text" name="method">
			</c:if>
			<c:if test="${method == 'card'}">
				카드번호 : <input type="text" name="method">
			</c:if>
			<c:if test="${method == 'cellphone'}">
				핸드폰 번호 : <input type="text" name="method">
			</c:if>
			<c:if test="${method == 'deposit'}">
				예금주 : <input type="text" name="method">
			</c:if>
			<input type="button" value="결제입력" onclick="payment_end(this.form)" >
			
		</form>
		</fieldset>
		</div>
</body>
</html>