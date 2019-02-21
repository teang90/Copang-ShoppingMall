<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>C O P A N G</title>
<link href="/1001_JSP_Project/Resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/1001_JSP_Project/Resources/js/bootstrap.min.js" ></script>

<style type="text/css">
body{
background-color: #eee;
}
#center {
	margin-top: 10%;
}
.form-group{
	width: 25%;
	margin: auto;
	margin-bottom: 0.5%;
}
#margin-bot-space{
	margin-bottom: 3.5%;
}
a:visited{
	text-decoration: none;
	color: #007bff;
}
a:link {
	color: #007bff;
	text-decoration: none;
}
</style>

<script type="text/javascript">
	function find_id(f) {
		// 팝업으로 이름이랑, 메일주소 보내서 디비에서 해당하는 해당하는 경우에 
		// 그 사람 이메일로 아이디 보내주기 
		f.action = "/1001_JSP_Project/view/EmailService.jsp";
		f.submit();
	}
	function find_pw(f) {
		// 비밀번호 찾기: 팝업으로 아이디, 비밀번호 입력한 경우 메일로 비밀번호정보 보내기
		f.action = "/1001_JSP_Project/view/FindPassword.jsp";
		f.submit();
	}
	function login_go(f) {
		// 에이작스로 db의 자료랑 비교하여 이미 없는 아이디(회원가입창으로 이동confirm이용)이거나, 
		// 아이디나 비번 틀린경우 alert()처리
		f.action = "/1001_JSP_Project/Controller?cmd=login";
		f.submit();
	}
	function join_go(f) {
		f.action = "/1001_JSP_Project/Controller?cmd=joingo";
		f.submit();
	}
</script>
</head>
<body >
		<div id="center" class="container text-center" >
		<h1 style="font-size: 50px;"><a id="banner" href="/1001_JSP_Project/view/home.jsp">COPANG</a></h1>
		<br>
		<br>
		<p class="form-group" style="text-align: left; font-size: 20px">COPANG 로그인하기</p>
			<form method="post" class="form-signin">
 			
 				<div class="form-group">
					<input type="text" class="form-control" name="id" placeholder="아이디를 입력해주세요" autofocus/>
				</div>
				
 				<div class="form-group" id="margin-bot-space">
					<input type="password" class="form-control" name="pw" placeholder="비밀번호를 입력해주세요" />
				</div>
			
				<div>
					<div>
						<button class="btn btn-primary form-group" onclick="login_go(this.form)">로그인</button>
					</div>
					<div>
						<button class="btn btn-primary form-group" onclick="join_go(this.form)">회원가입</button>
					</div>
					<div>
						<button class="btn btn-primary form-group" onclick="find_id(this.form)">아이디 찾기</button>
					</div>					
					<div>
						<button class="btn btn-primary form-group" onclick="find_pw(this.form)">비밀번호 찾기</button>
					</div>					
				</div>
			</form>
	</div>

</body>
</html>