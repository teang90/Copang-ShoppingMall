<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/1001_JSP_Project/Resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/1001_JSP_Project/Resources/js/bootstrap.min.js" ></script>
<style type="text/css">

.container{
	margin: 2.5% 0%;
	width: 100%;
}
.text-center{
	text-align: center;
	margin: auto;
}
tr {
	text-align: center;
}

</style>
<script type="text/javascript">
	function delcs(f) {
		var cs_idx = new Array();
		var idxbox = f.chkbox;
		
		for (var i = 0; i < idxbox.length; i++) {
			if (idxbox[i].checked == true) {
				cs_idx.push(idxbox[i].value);			
			}
		}	
		f.action="/1001_JSP_Project/Controller?cmd=cs_delete&cs_idx="+cs_idx;
		f.submit();
	}
</script>
</head>
<body>

	<jsp:include page="banner.jsp" />

	<div class="container">
	<form name="f" method="post">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th><input id="allCheck" type="checkbox" onclick="allChk(this.form)" /></th>
						<th>번호</th>
						<th>고객명</th>
						<th>아이디</th>
						<th>연락처</th>
						<th>주소</th>
						<th>이메일</th>
						<th>가입일</th>
						<!-- 총 7개
			<th>판매량(나중에 추가시킬 것)</th>-->
					</tr>
				</thead>
				<tbody>
					<c:forEach var="k" items="${cst_list}" varStatus="vs">
						<tr>
							<td><input type="checkbox" name="chkbox" value="${k.cs_idx}"></td>
							<td>${cst_list.size()-vs.index}</td>
							<td>${k.name}</td>
							<td>${k.id}</td>
							<td>${k.phone}</td>
							<td>${k.addr}&nbsp;&nbsp;${k.code}</td>
							<td>${k.email}</td>
							<td>${k.regdate}</td>
							<%-- .substring(0,10) --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<input type="button" class="btn btn-primary btn-sm" value="회원삭제" onclick="delcs(this.form)">
			<nav class="pagination justify-content-center">
				<ul class="pagination pagination-sm">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</form>
	</div>
	
</body>
</html>