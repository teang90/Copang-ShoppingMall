<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String id = request.getParameter("id");
	pageContext.setAttribute("id", id);
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/1001_JSP_Project/Resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/1001_JSP_Project/Resources/js/bootstrap.min.js" ></script>

<style type="text/css">
/*
 li {
	list-style-type: none;
	margin-left: 10%;
}
#subctg_ELCT {
	margin-left: 10%;
}
.subctg_ELCT {
	display: none;
}
#category{
border-top: 0.5px solid #ccc;
border-bottom: 0.5px solid #ccc;
line-height: 1.5em;
}
a{text-decoration: none;}
 */
#cursor{
	cursor: pointer; 
}
.inline_block{
	display: none;
}

</style>
<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(function() {
		$("#subctg_EL").click(function() {
				$(".inline_block").toggle("show");
		});
	});
</script>
</head>
<body>
<!--https://getbootstrap.com/docs/4.1/components/scrollspy/#item-3-1 [nested nav] 참고
https://getbootstrap.com/docs/4.1/components/navs/#base-nav 참고 [dropdown] 
https://getbootstrap.com/docs/4.1/examples/ 부트 스트랩 예제 -->
<!--https://programmingsummaries.tistory.com/category/CSS 감성프로그래밍  -->

	<div class="navbar navbar-light">
		<ul id="cursor" class="list-group w-18 p-3 h-auto">
			<li class="list-group-item list-group-item-action">패션</li>
			<li class="list-group-item list-group-item-action">뷰티</li>
			<li class="list-group-item list-group-item-action">출산/유아</li>
			<li class="list-group-item list-group-item-action">식품</li>
			<li class="list-group-item list-group-item-action">주방용품</li>
			<li class="list-group-item list-group-item-action">생활용품</li>
			<li class="list-group-item list-group-item-action">홈 인테리어</li>
			<li class="list-group-item list-group-item-action" id="subctg_EL">전자제품
				<ul class="nav nav-pills flex-column w-21">
					<li class="list-group-item-action ml-4"><a class="inline_block" href="/1001_JSP_Project/Controller?cmd=category&category=NT&id=${id}">노트북/태블릿</a></li>
					<li class="list-group-item-action ml-4"><a class="inline_block" href="/1001_JSP_Project/Controller?cmd=category&category=PC&id=${id}">PC/PC부품</a></li>
					<li class="list-group-item-action ml-4"><a class="inline_block" href="/1001_JSP_Project/Controller?cmd=category&category=Phone&id=${id}">휴대폰</a></li>
					<li class="list-group-item-action ml-4"><a class="inline_block" href="/1001_JSP_Project/Controller?cmd=category&category=SoundApp&id=${id}">음향기기/이어폰</a></li>
					<li class="list-group-item-action ml-4"><a class="inline_block" href="/1001_JSP_Project/Controller?cmd=category&category=VideoApp&id=${id}">TV/영상제품</a></li>
					<li class="list-group-item-action ml-4"><a class="inline_block" href="/1001_JSP_Project/Controller?cmd=category&category=LifeApp&id=${id}">생활가전</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<%-- 후에 서브 카테고리 추가 작업할 때 사용할 양식
	<li class="list-group-item-action ml-4"><a class="inline_block" href="/1001_JSP_Project/Controller?cmd=category&category=ELC appliance&subcategory=NT&id=${id}">노트북/태블릿</a></li> --%>

</body>
</html>