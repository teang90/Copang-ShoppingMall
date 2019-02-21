<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Let's join COPNAG!</title>
<link href="/1001_JSP_Project/Resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/1001_JSP_Project/Resources/js/bootstrap.min.js" ></script> 

<style type="text/css">
body{
background-color: #eee;
}
#hr_space{
text-align: center;
margin-bottom: 2%;
} 
a:visited{
	text-decoration: none;
	color: #007bff;
}
a:link {
	color: #007bff;
	text-decoration: none;
}
#join{
	margin-top: 4%;
}
.newline_label{
font-size: 15px;
}
.newline{
	width: 30%;
	margin: auto;
	margin-bottom: 1.5%;
}	
#id{
	width: 78%;
}
#id-flexbox{
	display: flex;
}
#join-btn-regulation{
	text-align: left;
	margin-top: 2%;
	margin-bottom: 3px;
}
#join-btn-go-center{
	margin-bottom: 5%;
	text-align: center;
}

</style>
<script type="text/javascript" src ="/1001_JSP_Project/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	function join_go(f) {
		if (f.pw.value != f.pw2.value) {
			alert("비밀번호와 비밀번호 확인의 번호가 일치하지 않습니다.");
			return ;
		}
		if (f.id.value == "" || f.pw.value == ""|| f.pw2.value == ""|| f.name.value == "" || f.phone.value == "" || f.code.value == "") {
			alert("회원정보를 모두 입력해주세요");
			return;
		}
		
		if (f.agree.checked != true) {
			alert("회원가입 약관을 읽고 동의해주십시오");
			regul_pop();
			return;
		}
		
		f.action="/1001_JSP_Project/Controller?cmd=join";
		f.submit();
	}
	
	/*약관 팝업으로 띄우기*/
	function regul_pop() {
		var pop_up = "회원가입 약관";
		var url = "/1001_JSP_Project/view/regulation.jsp";
		var option = "width=500, height=450, resizable=no, scrollbars=yes, status=no; left=15%, top=25%"; 
		open(url, pop_up, option);
	}
	
		//아이디 중복체크, 중복체크 후 가입 가능한 아이디면 아이디 칸에 입력한 아이디 나타나게
		//체크 안하고 가입 눌르면 가입 못하게 
		$(function chkDuplict(f) {
		$("#idchk").click(function() {
			var id = $("#id").val();
			if ($("#id").val() == "") {
				alert("아이디를 입력하세요");
				$("#id").focus();
				return ;
			}
			$.ajax({
				type:"get",
				data:"id="+$("#id").val(),
				url:"/1001_JSP_Project/AjaxController1",
				dataType:"text",
				success: function(data) {
					//alert(data);
					if (data > 0) {
						//등호는? (data=="0")이거 계속 안먹음
						alert("이미 존재하는 아이디입니다. 다른 아이디를 사용해주세요");
					}else{
						alert(id+"는 사용가능한 아이디입니다. 아이디를 다시 입력해주세요");
							$("#id").val(id); //이거 왜 안먹지?
						/* $(document).ready(function() { }); */
					}
				},
				error: function(data) {
					alert(data);					
				}
			});
		});
		});
		
</script>
</head>
<body class="container">
  
  <div id="join" >
	
	<h1 style="font-size: 50px; text-align: center;">
		<a  href="/1001_JSP_Project/view/home.jsp">COPANG</a>
	</h1>
	<hr id="hr_space">
		
	<form name="f" method="post" class="form-signin">
		<div class="newline">
		<label class="newline_label">아이디</label><br>
		<div id="id-flexbox" >
		<input type="text" class="form-control" name="id" id="id"> 
		<button id="idchk" class="btn btn-primary btn-sm offset-md-1" onclick="chkDuplict(this.form)">중복여부 확인</button>
		</div>
		</div>
		
		<div class="newline">
		<label class="newline_label">Email</label><br>
		<input type="text" id="Email" class="form-control" name="email">
		</div>
		
		<div class="newline">
		<label class="newline_label">비밀번호</label><br>
		<input type="password" class="form-control" name="pw">
		</div>				

		<div class="newline">
		<label class="newline_label">비밀번호 확인</label><br>
		<input type="password" class="form-control" name="pw2">
		</div>		
		
		<div class="newline">
		<label class="newline_label">이름</label><br>
		<input type="text" class="form-control" name="name">
		</div>		
		
		<div class="newline">
		<label class="newline_label">연락처</label><br>
		<input type="text" class="form-control" name="phone">
		</div>
			 
		<div class="newline">
		<label class="newline_label">주소</label><br>
		<input type="text" class="form-control" name="addr" >
		</div>
		
		<div class="newline">
		<label class="newline_label">우편번호</label><br>
		<input type="text" class="form-control" name="code"  >
		</div>		

		<div class="newline" id="join-btn-regulation">
		<button class="btn btn-primary btn-sm" onclick="regul_pop()" >
		회원가입 약관 보기</button>&nbsp;&nbsp;
		<input type="checkbox" name="agree"> 동의
		</div> 
		
		<div id="join-btn-go-center">
		<input type="button" value="회원가입" class="newline form-group btn btn-primary btn-sm offset-md-1" onclick="join_go(this.form)">
		</div>
	</form>
  </div>
</body>
</html>