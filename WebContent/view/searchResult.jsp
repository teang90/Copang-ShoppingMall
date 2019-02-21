<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.total_body{
	margin-top:2.5%;
	display: flex;
	float:left;
	}
	.category_side{
	width: 200px;
	}
	.table_side{
	margin-left: 20%;
	/* width: 70%; */
	}
	.table_style{
	font-size: 17px;
	border: 1px solid silver;
	}
	tr, th, td{
	border: 1px solid silver;
	width: 100px;
	}
</style>
<script type="text/javascript" src = "js/jquery-3.3.1.js">
</script>
</head>
<body>
<jsp:include page="banner.jsp" />
	
<div class="total_body">
	
	<div class="category_side">
	<jsp:include page="category.jsp" />
	</div>
	
	<div class="table_side">
	<table class="table_style">
		<thead>
			<tr><th colspan="5"> <b>검색결과</b></th></tr>
			<tr>
				<td> 이름 </td>
				<td> 생산회사 </td>
				<td> 상품 </td>
				<td> 가격 </td>
				<td> 할인가 </td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${!empty srch_result}">
				<c:forEach var="k" items="${srch_result}" varStatus="vs">
						<tr>
							<td> ${k.p_name}</td>
							<td> ${k.p_company}</td>
							<td>
							<a href="/1001_JSP_Project/Controller?cmd=pd_onelist&p_num=${k.p_num}&p_name=${k.p_name}">
								<img src="images/${k.p_image_s}" width="200px;" height="200px"> </a>
							</td>
							<td> ${k.p_price}</td>
							<td> ${k.p_saleprice}</td>
						</tr>
				</c:forEach>
				</c:if>
				<c:if test="${empty srch_result}">
					<tr> <td colspan="5">검색어와 연관된 상품이 없습니다.</td> </tr>
				</c:if>
		</tbody>
	</table>
	</div> <!--테이블 body-->
	</div>
</body>
</html>