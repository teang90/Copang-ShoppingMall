<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%
	String id = request.getParameter("id");
	session.setAttribute("id", id);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>banner</title>
<link href="/1001_JSP_Project/Resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/1001_JSP_Project/Resources/js/bootstrap.min.js" ></script>
<style type="text/css">
div#banner {
	display: flex;
	flex-direction: row;
	position: static;
	margin-top:5px;
	margin-bottom: 8px;
}
div#centerpart {
	text-align: center;
	margin: auto;
}
#subcategory {
	display: none;
}
#a_tag{
text-decoration: none;
}
a:visited#a_tag{
	text-decoration: none;
	color: #007bff;
}
a:link#a_tag {
	color: #007bff;
	text-decoration: none;
}
.container-fluid{
font: 16px bold;
margin-top: 0.5%;
text-align: right;
}
#sch{
display: flex;
}
#searcher{
	width: 200px;
}
#sch_go{
margin-left: 7px;
}

</style>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	function search_go() {
		location.href = "/1001_JSP_Project/Controller?cmd=search&keyword="
				+ document.getElementsByName("keyword")[0].value;
		/*+ "&sch_ctg="+ document.getElementsByName("sch_ctg")[0].value  */
	}
</script>
</head>
<body>
 <div class="container-fluid">
		<!--비회원 홈 화면의 버튼-->
		<c:if test="${empty id}">
			<span class="home_butt"><a href="/1001_JSP_Project/Controller?cmd=pd_list">홈</a></span>
			<span class="home_butt"><a href="/1001_JSP_Project/Controller?cmd=logingo">로그인</a></span>
			<span class="home_butt"><a href="/1001_JSP_Project/Controller?cmd=Qnalist&id=${cs.id}">고객센터</a></span>
		</c:if>

		<!--일반 회원 홈 화면의 버튼-->
		<c:if test="${!empty id}">
		
			<!-- 회원이 관리자인 경우 -->
			<c:if test="${id.equals('admin')}">
				<!--  관리자로 로그인한 경우 관리자 페이지 버튼이 추가로 필요함-->
				<span id="admin_butt"> <!-- 관리자 버튼을 화면 좌상단에 놓자 --> 
				<a style="text-decoration: none;" href="/1001_JSP_Project/Controller?cmd=manage_pro&category=clothes&id=${id}">
						<button class="btn btn-primary btn-sm">상품관리</button></a>
				<a style="text-decoration: none;" href="/1001_JSP_Project/Controller?cmd=manage_customer&id=${id}">
						<button class="btn btn-primary btn-sm">고객관리</button></a>
				</span>
			</c:if>

			<!-- 일반 회원의 경우 -->
			<span class="home_butt"><a href="/1001_JSP_Project/Controller?cmd=pd_list&id=${id}">홈</a></span>
			<span class="home_butt"><a href="/1001_JSP_Project/Controller?cmd=mycopang&id=${id}">마이코팡</a></span>
			<span class="home_butt"><a href="/1001_JSP_Project/Controller?cmd=logout&id=${id}">로그아웃</a></span>
			<span class="home_butt"><a href="/1001_JSP_Project/Controller?cmd=cartlist&id=${id}">장바구니</a></span>
			<span class="home_butt"><a href="/1001_JSP_Project/Controller?cmd=Qnalist&id=${id}">고객센터</a></span>
		</c:if>
	</div>
	<div id="banner">
		<div id="centerpart">
			<h1 id="h1" style="text-align: center; text-decoration: none;">
			<a id="a_tag" href="/1001_JSP_Project/Controller?cmd=pd_list">C O P A N G</a></h1>
				<span id="sch">
					<input type="text" id="searcher" class="form-control" name="keyword" placeholder="검색어를 입력하세요">
					<button id="sch_go" class="btn btn-primary btn-sm offset-md-1" onclick="search_go()">검색</button>
				</span>
		</div><!-- centerpart div 끝 -->
	</div><!--전체  banner div 끝-->
	<hr>
</body>
</html>