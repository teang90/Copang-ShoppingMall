<%@page import="mybatis.VOPD"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	
	request.setCharacterEncoding("utf-8");
	String category = request.getParameter("category");
	session.setAttribute("category", category);
	System.out.println("category=" + category);
	List<VOPD> pd_list_ctg = DAO.getPdList_ctg(category);
	session.setAttribute("pd_list_ctg", pd_list_ctg);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품 전체 리스트 출력</title>
<style type="text/css">
/* table, tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	margin: auto;
}
*/
tr {
	text-align: center;
}
.container{
}
#for_bottom_space{
margin-bottom: 3.5%;
}
#for_top_margin{
margin-top: 0.5%;
margin-bottom: 5px;
}
.ct{
text-align: center;
font:20px bold;
margin: auto;
}
.home_apl{
	margin-bottom: 2px; 
}

</style>
<script type="text/javascript">
	function addPd() {
		location.href="view/adminMakePd.jsp";
	}
	
	 var chck_tf = false;
	 function check() {
		var chk = document.getElementsByName("delbox");
		if (chck_tf == false) {
			for (var i = 0; i < chk.length; i++) {
				document.getElementsByName("delbox")[i].checked = true;
			}
			chck_tf = true;
		}else{
			for (var i = 0; i < chk.length; i++) {
				document.getElementsByName("delbox")[i].checked = false;
			}
			chck_tf = false;
		}
	 }
		
	
	//선택된 것만 삭제하기
	function delpd(f) {
		var p_num = new Array();
		var p_numChk = document.getElementsByName("delbox");
		for (var i = 0; i < p_numChk.length; i++) {
			if (p_numChk[i].checked == true) {
			p_num.push(p_numChk[i].value);
			//p_num[i] = p_numChk[i].value;			
			//document.write("노드리스트"+p_num[i]+"<br>");
			}
		}
		alert(p_num);
		f.action="/1001_JSP_Project/Controller?cmd=adminPdListDel&p_num="+p_num+"&category=${category}";
		f.submit();
	}
	
	function home() {
		location.href="/1001_JSP_Project/Controller?cmd=pd_list";
	}
		
</script>
</head>
<body>
	<jsp:include page="banner.jsp" />
	<div id="for_top_margin" class="container">
		<div class="row justify-content-center">
		<!--여기는 ajax로 처리해서 각 카테고리에 아이디 주고 클릭했을 때 해당 카테고리의 목록을 출력하도록 만들자-->
		<span class="ct"><a href="/1001_JSP_Project/Controller?cmd=manage_pro&category=clothes&id=${id}">Clothes&nbsp;&nbsp;&nbsp;</a> </span>
		<span class="ct"><a href="/1001_JSP_Project/Controller?cmd=manage_pro&category=beauty&id=${id}">Beauty&nbsp;&nbsp;&nbsp;</a> </span> 
		<span class="ct"><a href="/1001_JSP_Project/Controller?cmd=manage_pro&category=child&id=${id}">Child&nbsp;&nbsp;&nbsp;</a> </span> 
		<span class="ct"><a href="/1001_JSP_Project/Controller?cmd=manage_pro&category=food&id=${id}">Food&nbsp;&nbsp;&nbsp;</a> </span>
		<span class="ct"><a href="/1001_JSP_Project/Controller?cmd=manage_pro&category=kitchen&id=${id}">Kitchen&nbsp;&nbsp;&nbsp;</a> </span> 
		<span class="ct"><a href="/1001_JSP_Project/Controller?cmd=manage_pro&category=life&id=${id}">Life&nbsp;&nbsp;&nbsp;</a> </span> 
		<span class="ct"><a href="/1001_JSP_Project/Controller?cmd=manage_pro&category=home_interial&id=${id}">Home_interial&nbsp;&nbsp;&nbsp;</a> </span> 
		<span class="ct"><a href="/1001_JSP_Project/Controller?cmd=manage_pro&category=ELC appliance&id=${id}">ELC appliance&nbsp;&nbsp;&nbsp;</a> </span>
		</div>
		<hr>
	<div class="home_apl">
		<span > <button class="btn btn-primary btn-sm" onclick="home()">홈</button> </span>
		<span > <button class="btn btn-primary btn-sm" onclick="addPd()">상품등록</button> </span>
	</div>
	</div>
		


	<div class="container" id="for_bottom_space">
	<form name="chk" method="post">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th><input type="checkbox" onclick="check()" /></th>
						<th>카테고리</th>
						<th>제품번호</th>
						<th>제품명</th>
						<th>제품사진(s)</th>
						<th>가격</th>
						<th>할인가</th>
						<th>조회수</th>
						<th>재고수량</th>
						<th>등록일</th>
						<!-- 총 10개
			<th>판매량(나중에 추가시킬 것)</th>-->
					</tr>
				</thead>

				<tbody>
					<c:forEach var="k" items="${pd_list_ctg}">
						<tr>
							<td><input type="checkbox" name="delbox" value="${k.p_num}"></td>
							<td>${k.category}</td>
							<td>${k.p_num}</td>
							<td><a href="/1001_JSP_Project/Controller?cmd=admin_onelist&category=${k.category}&p_num=${k.p_num}">${k.p_name}</a></td>
							<td>
							<a href="/1001_JSP_Project/Controller?cmd=admin_onelist&category=${k.category}&p_num=${k.p_num}"><img alt="${k.p_name}" width="100px" height="=100px" src="images/${k.p_image_s}" />
							</a></td>
							<td>${k.p_price}</td>
							<td>${k.p_saleprice}</td>
							<td>${k.p_hit}</td>
							<td>${k.p_stock}</td>
							<td>${k.p_date}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<input type="button" class="btn btn-primary btn-sm" value="선택 상품삭제" onclick="delpd(this.form)">
	</form>
	</div>
	</div>

</body>
</html>