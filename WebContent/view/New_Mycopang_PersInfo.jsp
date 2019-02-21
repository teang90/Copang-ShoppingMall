<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = request.getParameter("id");
	session.setAttribute("id", id);
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{box-sizing: border-box;}
#left_side{
	margin: 1% 0px;
}
/* 
.body{
	display:flex;
	margin-top: 2%;
	width: 100%;
}
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 200px;
    background-color: #fafafa;
}
li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
}
li a.active {
    background-color: #4CAF50;
    color: white;
}
li a:hover:not(.active) {
    background-color: #0000ff;
    color: white;
}
table, tr, th, td{
	border: 1px solid black;
	text-align: center;
}
#pers_info{
	margin: auto;
}
table{
	width: 600px;
	height:600px;
	font-size: 20px;
}
.tb_input{
font-size: 20px;
font-weight:1.5;
height: 30px;
 border: 1px solid silver; 
text-align: center;
}
 */
</style>
<script type="text/javascript">

function modify(f) {
	f.action="/1001_JSP_Project/Controller?cmd=per_modify&id=${id}";
	f.submit();
};

function secession(f) {
	var secess_answer = confirm("탈퇴하시겠습니까?");
	if (!secess_answer) {
		return;
	}else{
		alert("코팡과 함께해주셔서 감사합니다.\n또 다시 만나길바랍니다.");
	}
	
	f.action="/1001_JSP_Project/Controller?cmd=pers_secession&id=${id}";
	f.submit();
};

</script>
</head>
<body>
<br><jsp:include page="banner.jsp"/>

<div class="container">
		<div id="left_side" class="justify-content-center">
		<ul class="nav nav-pills">
			<li class="nav-item">
				<a class="nav-link" href="/1001_JSP_Project/Controller?cmd=hist_shpp&id=${id}">구매내역&nbsp;</a>
			</li>
			
			<li class="nav-item">
				<a class="nav-link active" href="/1001_JSP_Project/Controller?cmd=pers_info&id=${id}">&nbsp;개인정보</a>
			</li>
		</ul>
		</div>

		<div id="pers_info">
				<form method="post">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<th colspan="2"> <b>[${id}]님의 개인정보</b> </th>
						</tr>
					</thead>
					
					<tbody>
							<tr><th>고객 ID</th><td> <input class="tb_input" type="text" disabled="disabled" name="id" value="${cs.id}"></td></tr>
							<tr><th>Email</th> <td> <input class="tb_input"  type="text" name="email" value="${cs.email}"></td></tr>
							<tr><th>이름</th>   <td> <input class="tb_input"  type="text" name="name" value="${cs.name}"></td></tr>
							<tr><th>연락처</th>  <td> <input class="tb_input"  type="text" name="phone" value="${cs.phone}"> </td></tr>
							<tr><th>주소</th>	<td> <input class="tb_input"  type="text" name="addr" value="${cs.addr}"></td></tr>
							<tr><th>상세주소</th> <td> <input class="tb_input"  type="text" name="code" value="${cs.code}"> </td></tr>
					</tbody>
					
					<tfoot>
						<tr >
						<td colspan="2">
						 <span class="nav justify-content-center">
							<span class="row justify-content-around">
								<span class="col-1"><input type="button" class="btn btn-primary" value="수정" onclick="modify(this.form)"></span>
								<span class="col-1"><input type="button" class="btn btn-primary" value="탈퇴" onclick="secession(this.form)"></span>
							</span>
						</span>
						</td>
						</tr>						
					</tfoot>			
						
				</table>
				</form>
		</div>
		
</div>
</body>
</html>