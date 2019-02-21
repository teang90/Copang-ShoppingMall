<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코팡 Email 인증 서비스</title>
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

	function find_password(f) {
		f.action="/1001_JSP_Project/view/FindPassword.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<h1 style="font-size: 50px; text-align: center;"><a id="banner" href="/1001_JSP_Project/view/home.jsp">COPANG</a></h1>
	<div class="container"  >
	
		<p class="form-group" style="text-align: left; font-size: 20px">COPANG ID찾기</p>
	</div>
	
	<hr>
	<div class="container">
	<form action="/1001_JSP_Project/Controller?cmd=id_finder" method="post" >
		<div class="main">
			<div> 고객님의 성함과 이메일을 입력하세요. </div>
			<div>
				<input class="form-control" type="text" name="name" placeholder="성함을 입력해주세요" autofocus>
			</div>
			<div>
				<input type="email" class="form-control" name="email" placeholder="이메일을 입력해주세요">
			</div>
			<div id="button">
				<div class="bt">
					<input type="submit" class="btn btn-primary btn-block" value="완료" >
				</div>
				<div class="bt">
					<button class="btn btn-primary btn-block" onclick="find_password(this.form)">비밀번호 찾기</button>
				</div>
			</div>
		</div>
	</form>
	</div>
</body>
</html>


