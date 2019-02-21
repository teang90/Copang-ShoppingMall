<%@page import="mybatis.Page"%>
<%@page import="mybatis.CST_QNA"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    String id = request.getParameter("id");
    Page pg = new Page();
    session.setAttribute("id", id); //글 상세보기 -> 글 수정, 삭제 할 떄 필요
    /* List<CST_QNA> qna = DAO.getQnaList(pg.getBegin(), pg.getEnd());
    session.setAttribute("qna", qna); */
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고 객 센 터 </title>
<style type="text/css">
.center_align{
	margin: auto;
	text-align: center;
	margin-top: 0.5%;
}
#inl_blck{
display: block;
}
/* #body{
	margin-top: 3%;
} */
#qna-list{
margin-bottom: 1.5%;
}

</style>
<script type="text/javascript">
	function mkQna(f) {
		f.action = "/1001_JSP_Project/Controller?cmd=qnaInsert&id=${id}";
		f.submit();
	}
</script>
</head>
<body>
	<jsp:include page="banner.jsp" />
	
	<div class="container">
	<span  style="text-align: left; font-size: 20px"> COPANG 고객 게시글 목록 </span>
	<form method="post">
	<div class="center_align">
				<table class="table table-bordered table-hover">
				<thead>
				<tr>
					<th width="7%;">번호</th>
					<th width="10%;">항목</th>
					<th width="30%;">제목</th>
					<th width="15%;">글쓴이</th>
					<th width="13%;">조회수</th>
					<th width="25%;">게시일</th>
				</tr>
				</thead>
				
				<tbody>	
				<c:forEach var="k" items="${qna}" varStatus="vs">
				<tr>
					<td>${qna.size()-vs.index}</td>
					<td>${k.qna_ctg}</td>
					<td><a id="inl_blck" href="/1001_JSP_Project/Controller?cmd=detail_qna&cPage=${nowPage}&qna_idx=${k.qna_idx}">${k.title}</a></td>
					<td>${k.id}</td>
					<td>${k.qna_hit}</td>
					<td>${k.regdate}</td>
				</tr>
				</c:forEach>
				</tbody>
				</table>
			</div>
				<input type="button" id="btn_write" class="btn btn-primary btn-sm" value="글쓰기" onclick="mkQna(this.form)">
				
			<span class="center_align">
				<ul class="pagination justify-content-center">
					<c:if test="${beginPage <= pagePerBlock}">
						<li class="page-item disabled"><span class="page-link">Previous</span></li>					
					</c:if>
					
					<c:if test="${beginPage > pagePerBlock}">
						<li class="page-item">
						<span class="page-link">
						<a href="/1001_JSP_Project/Controller?cmd=Qnalist&cPage=${beginPage-pagePerBlock}">Previous</a>
						</span>
						</li>				
					</c:if>
					
					<c:forEach var="k" begin="${beginPage}" end="${endPage}" step="1">	
					<c:choose>	
						<c:when test="${k == nowPage}">
						<li class="page-item"><span class="page-link">${k}<span class="sr-only"></span>
						</span></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link" href="/1001_JSP_Project/Controller?cmd=Qnalist&cPage=${k}">${k}</a></li>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					
					<c:if test="${endPage >= totalPage}">
						<li class="disable"><span class="page-link">Next</span></li>
					</c:if>
					<c:if test="${endPage<totalPage}">
						<li class="page-item">
						<a class="page-link" href="/1001_JSP_Project/Controller?cmd=Qnalist&cPage=${beginPage + pagePerBlock}">Next</a>
						</li>
					</c:if>				
				</ul>
			</span>
	</form>
	</div>
	
</body>
</html>