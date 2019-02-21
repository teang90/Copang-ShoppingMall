<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    String id = request.getParameter("id");
    request.setAttribute("id", id);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NEW_MYCOPANG</title>
<link href="/1001_JSP_Project/Resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/1001_JSP_Project/Resources/js/bootstrap.min.js" ></script>
<style type="text/css">
body{
font-size: 17.5px;
}
.container{
width: 100%;	
margin:auto;
margin-bottom: 5%;
}
#table_upperside{
	border-top: none;
}
#left_side{
	margin-left: 21%;
	margin-bottom: 0.5%;
	text-align: center;
}
#SpaceOfTable{
margin: 1.5% 0px;
}

</style>
<script type="text/javascript">
</script>
</head>
<body>
	<jsp:include page="banner.jsp"/>

		<div class="container">
				<!-- 버튼 두개 왜 테이블 좌상단으로 안가냐?...-->
					<div id="SpaceOfTable">
					<ul class="nav nav-pills">
						<li class="nav-item">
							<a class="nav-link active" href="/1001_JSP_Project/Controller?cmd=hist_shpp&id=${id}">구매내역&nbsp;</a>
						</li>
							
						<li class="nav-item">
							<a class="nav-link" href="/1001_JSP_Project/Controller?cmd=pers_info&id=${id}">&nbsp;개인정보</a>
						</li>
					</ul>
					</div>
			
		
				<table id="table_upperside" class="table table-hover">
					<thead>
						<tr>
							<th width="6%;">번호</th>
							<th width="10%;">구매자</th>
							<th width="11%;">받는사람</th>
							<th width="14%;">상품명</th>
							<th width="15%;">주소</th>
							<th width="9%;">결제금액</th>
							<th width="8%;">마일리지</th>
							<th width="9%;">결제방법</th>
							<th width="11%;">결제 상세</th>
							<th width="10%;">결제일</th>
						</tr>
					</thead>
					
					<tbody >
						<c:if test="${!empty order_list}">
						<c:forEach var="k" items="${order_list}" varStatus="vs">
							<tr class="each_tr">
								<td>${order_list.size()-vs.index}</td>
								<td>${k.id}</td>
								<td>${k.act_name}</td>
								<td>${k.p_name}</td>
								<td>${k.addr}&nbsp;&nbsp;${k.code}</td>
								<td>${k.total_price}원</td>
								<td>${k.mileage}원</td>
									
									<!-- 결제 방법에 따른 마이코팡 한글화 명세 -->
									<c:if test="${k.payment == 'card'}">
									<td>카드</td>
									<td> 카드 번호 ${k.buy_method}</td>
									</c:if>
									
									<c:if test="${k.payment == 'cellphone'}">
									<td>휴대폰 요금</td>
									<td> 휴대폰 번호 ${k.buy_method}</td>
									</c:if>
									
									<c:if test="${k.payment == 'account'}">
									<td>계좌이체</td>
									<td> 계좌번호 ${k.buy_method}</td>
									</c:if>
									
									<c:if test="${k.payment == 'deposit'}">
									<td>무통장 입금</td>
									<td>예금주 ${k.buy_method}</td>
									</c:if>
								
								<td>${k.order_date}</td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${empty order_list}">
							<tr> <td colspan="9">구매한 이력이 없습니다.</td> </tr>
						</c:if>
					</tbody>
				</table>
				
			<span class="center_align">
				<div class="text-center">
					<ul class="pagination justify-content-center">
					<c:if test="${beginPage <= pagePerBlock}">
						<li class="page-item disabled"><span class="page-link">Previous</span></li>					
					</c:if>
					
					<c:if test="${beginPage > pagePerBlock}">
						<li class="page-item">
						<span class="page-link">
						<a href="/1001_JSP_Project/Controller?cmd=mycopang&cPage=${beginPage-pagePerBlock}&id=${id}">Previous</a>
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
							<li class="page-item"><a class="page-link" href="/1001_JSP_Project/Controller?cmd=mycopang&cPage=${k}&id=${id}">${k}</a></li>
						</c:otherwise>
					</c:choose>
					</c:forEach>
					
					
					<c:if test="${endPage >= totalPage}">
						<li class="disable"><span class="page-link">Next</span></li>
					</c:if>
					<c:if test="${endPage<totalPage}">
						<li class="page-item">
						<a class="page-link" href="/1001_JSP_Project/Controller?cmd=mycopang&cPage=${beginPage + pagePerBlock}&id=${id}">Next</a>
						</li>
					</c:if>				
				</ul>
				</div>
			</span>
				
			</div> <!-- table_body 끝 -->
</body>
</html>