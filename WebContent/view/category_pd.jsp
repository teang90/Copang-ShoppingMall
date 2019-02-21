<%@page import="mybatis.VOPD"%>
<%@page import="java.util.List"%>
<%@page import="mybatis.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	List<VOPD> pd_sublist = DAO.getPdList_ctg(request.getParameter("category"));
	/* pageContext.setAttribute("pd_sublist", pd_sublist); */
	String id = request.getParameter("id");
	pageContext.setAttribute("id", id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#body_id{
margin-top:2.5%;
display: flex;
height: 60%;
}
#ctg_id{
	width: 150px;
}
#product_id{
margin-left: 15%;
width:60%;
border: 1px solid silver;
}


table.pd_table {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-collapse: collapse;
	margin-left: 5%;
	margin-top: 2%;
	width: 300px;
	height: 300px;
	text-align: center;
	float: left;
	margin-bottom: 2%;
	border-collapse: collapse;
	overflow: scroll;
}

</style>
<script type="text/javascript" src = "js/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="banner.jsp" />
<div id="body_id">
	<div id="ctg_id">
		<jsp:include page="category.jsp" />
	</div>

	<div id="product_id">
		<c:forEach var="k" items="${pd_sublist}">
			<table class="pd_table">
						<tbody>
							<tr class="border_top">
								<td colspan="2">${k.p_name}</td>
							</tr>
							
							<tr>
								<td colspan="2">
								<a href="/1001_JSP_Project/Controller?cmd=pd_onelist&p_name=${k.p_name}&p_num=${k.p_num}&id=${id}"> 
									<img src="images/${k.p_image_s}" width="200px" height="200px">
								</a></td>
							</tr>
							
							<tr class="border_bott">
								<!-- <td>가격</td> -->
								<td>${k.p_price - k.p_saleprice}원</td>
							</tr>
						</tbody>
					</table>
		</c:forEach>
	</div>
</div>

</body>
</html>