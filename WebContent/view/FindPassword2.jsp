<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Copang 비밀번호 찾기</title>
<link href="/1001_JSP_Project/Resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/1001_JSP_Project/Resources/js/bootstrap.min.js" ></script>
<style type="text/css">
body{
background-color: #eee;
}
h1{
margin-top: 5%;
margin-bottom: 2%;
}
#button{
margin-top: 10%;
}
.container{
	margin-top: 10px;
	width: 400px;
}
.main{
	margin-top: 40px;
}
.bt{
	margin-bottom: 3px;
}
a, a:hover{
	text-decoration: none;
	list-style: none;
}
</style>
<script type="text/javascript">
	function find_id(f) {
		
		f.action="/1001_JSP_Project/view/EmailService.jsp";
		f.submit();
	}
	
	function find_pw(f) {
		alert("이메일로 비밀번호를 보내드렸습니다.");
		f.action="/1001_JSP_Project/Controller?cmd=password_finder";
		f.submit();
	}
	
</script>
</head>
<body>
	
	<h1 style="font-size: 50px; text-align: center;"><a id="banner" href="/1001_JSP_Project/view/home.jsp">COPANG</a></h1>
	<div class="container">
		<p class="form-group" style="text-align: left; font-size: 20px">[비밀번호 찾기] 인증번호를 입력해주세요</p>
	</div>
	
	<hr>
	<div class="container">
	<form action="/1001_JSP_Project/Controller?cmd=email_model" method="post" >
		<div class="main">
			<div> 인증번호를 입력하세요 </div>
			<div>
				<input type="text" class="form-control" name="certification_result" placeholder="인증번호를 입력해주세요" autofocus>
			</div>
			<div id="button">
				<div class="bt">
					<input type="button" class="btn btn-primary btn-block" onclick="find_pw(this.form)" value="완료" >
				</div>
			</div>
		</div>
		<input type="hidden" name="id" value="${cs.id}" >
		<input type="hidden" name="name" value="${cs.name}" >
		<input type="hidden" name="certification_number" value="${certification_number}">
	</form>
	</div>
	
	
	
	
	
	
	
	
</body>
</html>