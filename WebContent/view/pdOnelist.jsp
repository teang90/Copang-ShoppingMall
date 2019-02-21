<%@page import="java.util.List"%>
<%@page import="mybatis.DAO"%>
<%@page import="mybatis.VOPD"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");
	VOPD pd = DAO.getPdOnelist(request.getParameter("p_num"), request.getParameter("p_name"));
	session.setAttribute("pd", pd);
	String id = request.getParameter("id");
	session.setAttribute("id", id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코팡 상품 : ${pd.p_name} 상세페이지</title>

<link href="/1001_JSP_Project/Resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/1001_JSP_Project/Resources/js/bootstrap.min.js" ></script>
<style type="text/css">

*{box-sizing:border-box; }
.body-center{
	display: flex;
	flex-direction: row;
}

.body-center {
}
.pd-content{
width: 100%;
}

.upper-info{
	flex-direction: row;
	text-align: center;
}
.pd_mainbody{
	margin: 3% 0px 0px 7%;
}
.recommanded-pd{

}
.card-deck{
display: inline-block;
}
.card-img-top{
	margin: auto;
	cursor: pointer;
	text-align: center;
}
.img_part, .pd-info{
	display: inline-block;
}
.card{
display: inline-block;
}
.cener{
text-align: center;
}
.inlie{
display: inline-block;
}
.category{
	position: fixed;
	left: 0px;
	top: 100px;
}
</style>
<script type="text/javascript" src="/1001_JSP_Project/js/jquery-3.3.1.js"></script>
<script type="text/javascript">

/* function go_onelist(f) {
	//이거 왜 안먹지?(액션을 인식을 못하는데...)
	f.action="/1001_JSP_Project/Controller?cmd=pd_onelist";
	f.submit();
} */


function cart_insert(f) {
	
	if (f.amt.value > ${pd.p_stock}) {
		alert("상품재고가 부족합니다. "+ ${pd.p_stock} +"개보다 적은 수량을 입력해주세요");
		return;
	}
	
	f.action = "/1001_JSP_Project/Controller?cmd=addCartlist&id=${id}&p_num=${pd.p_num}&p_name=${pd.p_name}&p_price=${pd.p_price}&p_saleprice=${pd.p_saleprice}";
	f.submit();
 	
/* 
	이거 왜 안먹지?
	var id = ${id};
	if (id == null) {
		var conf = confirm("로그인하신 고객님만 장바구니에 추가할 수 있습니다. \n로그인 하시겠습니까?");
		if (conf == true) {
			location.href="/1001_JSP_Project/view/login.jsp";
		}
	}  
 */	
	
//해당 상품의 재고가 구매수량보다 작은경우 재고보다 작은 수를 구입할 수 있게 해야한다. 또는 구매불가하게해야한다.
	
};
</script>
</head>
<body>
<jsp:include page="banner.jsp" />

	<div class="body-center">
		<div class="category">
			<jsp:include page="category.jsp" />
		</div>

		<div class="pd-content">
			<form method="post" id="form_tag" name="f">
			<div class="upper-info">
	<div>
				<div class="img_part">
					<img align="bottom" alt="${pd.p_image_s}" src="images/${pd.p_image_s}" width="300px;" height="300px;">
				</div>
	
				<div class="pd-info">
					<div style="text-align:center; font-size: 20px;"><b> ${pd.p_name}</b></div>
					<div style="text-align:right; font-size: 20px;">${pd.p_price - pd.p_saleprice}원</div>
					<div style="text-align:right; font-size: 20px;"> 택배비 2500원</div>
					
					<c:if test="${!empty id}">
						<input type="number" name="amt" id="amt" value="1" >
						<span><input type="button" value="장바구니 담기" onclick="cart_insert(this.form)"></span>	
						<span><a href="/1001_JSP_Project/Controller?cmd=cartlist&id=${id}"> 장바구니 보기</a> </span>
					</c:if>
					<c:if test="${empty id}">
						[장바구니를 이용하시려면 로그인 해주시기 바랍니다.]
					</c:if>
					<input type="hidden" value="${pd.p_image_s}" name="p_image_s" >	
				</div>
	</div>
			</div>
			<hr>
		
			
			<!-- 같은 카테고리의 추천상품 5~6개 띄우기 -->

		
			<div class="cener">
			<p>[같은 카테고리의 다른 상품]</p>
			<div class="recommanded-pd">
			<div class="">
				<c:forEach var="k" items="${ctg_list}" begin="1" step="1" end="5">
				
				<!-- jumbotron 스타일 적용 -->
				<div class="inlie">
				
				<!-- onclick="go_onelist(this.form)" -->
					<a class="card-img-top" href="/1001_JSP_Project/Controller?cmd=pd_onelist&p_num=${k.p_num}&p_name=${k.p_name}&id=${id}">
					<img alt="추천상품" id="go_onelist"  class="card-img-top" src="/1001_JSP_Project/images/${k.p_image_s}" style="width: 130px; height: 130px;" />
					</a>
					<hr>
					<div class="card-body">
						<div class="card-text">${k.p_name}</div>
						<div class="card-text">${k.p_saleprice}</div>
					</div>
				</div>
				<input type="hidden" name="p_num" value="${k.p_num}">
				<input type="hidden" name="p_name" value="${k.p_name}">
				<input type="hidden" name="id" value="${id}">
				</c:forEach>
			<br>
			</div>
			</div>
			</div>
		
		
			<hr>
			<div class="pd_mainbody">
				${pd.p_content}
			</div>
			
		</form>
		</div>
	</div> <!--body_div-->

</body>
</html>


