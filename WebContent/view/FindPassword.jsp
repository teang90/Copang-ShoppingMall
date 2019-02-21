<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Copang 인증번호받기(비밀번호 찾기)</title>
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
		alert("고객님의 이메일로 인증번호를 보냈습니다. 인증해주시길 바랍니다.");
		f.action="/1001_JSP_Project/Controller?cmd=pw_certification"; //인증번호 만들어서 고객 메일로 보냄
		f.submit();
	}
	
</script>
</head>
<body>
	<h1 style="font-size: 50px; text-align: center;"><a id="banner" href="/1001_JSP_Project/view/home.jsp">COPANG</a></h1>
	<div class="container"  >
	
		<p class="form-group" style="text-align: left; font-size: 20px">코팡 비밀번호찾기-[인증번호 받기]</p>
	</div>
	
	<hr>
	<div class="container">
	<form action="/1001_JSP_Project/Controller?cmd=email_model" method="post" >
		<div class="main">
			<div>  고객님의 성함과 아이디를 입력해주십시오. </div>
			<div>
				<input class="form-control" type="text" name="name" placeholder="성함을 입력해주세요" autofocus>
			</div>
			<div>
				<input type="email" class="form-control" name="id" placeholder="아이디를입력해주세요">
			</div>
			<div id="button">
				<div class="bt">
					<input type="button" class="btn btn-primary btn-block" onclick="find_pw(this.form)" value="완료" >
				</div>
				<div class="bt">
					<button class="btn btn-primary btn-block" onclick="find_id(this.form)">아이디 찾기</button>
				</div>
			</div>
		</div>
	</form>
	</div>
	
	
</body>
</html>