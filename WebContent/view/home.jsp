<%@page import="mybatis.DAO"%>
<%@page import="mybatis.VOPD"%>
<%@page import="java.util.List"%>
<%@page import="model.HomePdModel"%>
<%@page import="mybatis.VOCS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>COPANG에 오신 것을 환영합니다.</title>
<link href="/1001_JSP_Project/Resources/css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="/1001_JSP_Project/img_slide/css/lightslider.css" rel="stylesheet"> -->

<style type="text/css">
body{

}
*{box-sizing: border-box;}
.ctg_calsel{
	margin-top:2.5%;
	display: flex;
	width: 100%;
	height: 600px;
}
.carousel-control-prev{
	margin-left: -5%;
}
.carousel-control-next{
	margin-right: 20%;
}	
ol.carousel-indicators{
	margin-left: -7%;
}
.carousel-caption{
	margin-left: -25%;
}
#img_carousel{
	margin-left: 17%;
}

/* 여기부터 카테고리별 상품 */
/* .each_category{
border: 1px solid #999;
} */
.out-of-pdbox{
margin: 1.5% 4%;
width: 100%;
}
.pdbox{
	width:90%;
	margin-bottom:5%;
	display:flex;
  	border: 1px solid #bbb;	
	box-shadow: 1px 1px 3px #aaa;
	flex-direction: row;
	padding: 1.5% 1.5%;
	/* overflow-x: scroll; */
	overflow: auto;
}
.card-img-top{
	text-align: center;
}
.col-md-2{
}
.card{
margin: 0px 1.7%;
}
.ctg-on-pdbox{
	font:23px lighter ;
	margin-bottom: 5px;
	color: #333; 

	/* 첫번째:수평그림자, 두번째:수직그림자, 세번째:흐림정도, 마지막:색  */
	text-shadow: 0.5px 0.5px 3px #aaa;
}

</style>
<script src="/1001_JSP_Project/Resources/js/bootstrap.min.js" ></script>
<!-- <script src="/1001_JSP_Project/img_slide/js/lightslider.js" ></script> -->
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<div class="banner">
		<jsp:include page="banner.jsp?id=${cs.id}" />
	</div>
	
	<div class="ctg_calsel">
		<div id="banner_ctg">
			<jsp:include page="category.jsp?id=${cs.id}" /> 
		</div>
		
		<!--  사진 뒷 배경 넣기-->
		<div id="img_carousel" class="container">
			 <div id="home_carsel" class="carousel slide" data-ride="carousel" >
				<ol class="carousel-indicators">
				    <li data-target="#home_carsel" data-slide-to="0" class="active"></li>
				    <li data-target="#home_carsel" data-slide-to="1"></li>
				    <li data-target="#home_carsel" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img alt="img1" class="w-75 h-25" src="/1001_JSP_Project/home_carsel_img/pexels-photo-603022.jpeg">
							<div class="container">
								<!-- <div class="carousel-caption text-left"> -->
				            	<div class="carousel-caption text-center">
				                <h3>가장 편안한 청바지가 당신을 기다립니다.</h3>
								<!--<p><a class="btn btn-lg btn-primary" role="button">Learn more</a></p>-->             
								</div>
           					</div>
					</div>
					<div class="carousel-item">
						<img alt="img2" class="w-75 h-25" src="/1001_JSP_Project/home_carsel_img/pexels-photo-325876.jpeg">
							<div class="container">
				            	<div class="carousel-caption">
				                <h3>당신의 정장을 코팡에서 찾아보세요</h3>
								<!--<p><a class="btn btn-lg btn-primary" role="button">Learn more</a></p>-->             
								</div>
           					 </div>
					</div>
					<div class="carousel-item">
						<img alt="img3" class="w-75 h-25" src="/1001_JSP_Project/home_carsel_img/pexels-photo-459653.jpeg">
						<div class="container">
				            <div class="carousel-caption">
				             <h3>합리적인 가격의 노트북을 코팡에서 만나보세요</h3>
								<!--<p><a class="btn btn-lg btn-primary" role="button">Learn more</a></p>-->             
							</div>
           				</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#home_carsel" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#home_carsel" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>
	<hr>
	
	<!-- 앨범식 상품 나열 -->
	<% /*간단 상품 리스트 나열(VOPD): 홈 화면서 필요한 정보 - 상품명/상품사진/가격*/
	List<VOPD> pd_list = DAO.getPdList();
	session.setAttribute("pd_list", pd_list);
	%>
			<div class="out-of-pdbox">

						<div class="ctg-on-pdbox">패션</div>
						<div class="pdbox">
								<c:forEach var="k" items="${pd_list}">
								<c:if test="${k.category =='clothes'}">
								<div class="card col-md-2">
										<a class="card-img-top" href="/1001_JSP_Project/Controller?cmd=pd_onelist&p_name=${k.p_name}&p_num=${k.p_num}&id=${cs.id}"> 
										<img class="card-img-top" src="/1001_JSP_Project/images/${k.p_image_s}" style="width: 100%; height: 225px;">
										</a>
										<hr style="background-color: #ccc">
										<h5 class="card-text">${k.p_name}</h5>
										<p class="card-text">${k.p_price - k.p_saleprice}원</p>
								</div> 
								</c:if>
								</c:forEach>
						</div>
						
								<%-- 
								반응형 적용
								<div class="pdbox row">
								<c:forEach var="k" items="${pd_list}">
								<c:if test="${k.category =='clothes'}">
								<div class="card col-md-2 col-sm">
										<a class="card-img-top" href="/1001_JSP_Project/Controller?cmd=pd_onelist&p_name=${k.p_name}&p_num=${k.p_num}&id=${cs.id}"> 
										<img class="card-img-top" src="/1001_JSP_Project/images/${k.p_image_s}" style="width: 100%; height: 225px;">
										</a>
										<hr style="background-color: #ccc">
										<h5 class="card-text">${k.p_name}</h5>
										<p class="card-text">${k.p_price - k.p_saleprice}원</p>
								</div> 
								</c:if>
								</c:forEach>
								</div> 
								--%>

						<div class="ctg-on-pdbox">뷰티</div>
						<div class="pdbox">
								<c:forEach var="k" items="${pd_list}">
								<c:if test="${k.category =='beauty'}">
								<div class="card col-md-2">
										<a class="card-img-top" href="/1001_JSP_Project/Controller?cmd=pd_onelist&p_name=${k.p_name}&p_num=${k.p_num}&id=${cs.id}"> 
										<img class="card-img-top" src="/1001_JSP_Project/images/${k.p_image_s}" style="width: 100%; height: 200px;">
										</a>
										<hr style="background-color: #ccc">
										<h5 class="card-text">${k.p_name}</h5>
										<p class="card-text">${k.p_price - k.p_saleprice}원</p>
								</div> 
								</c:if>
								</c:forEach>
						</div>
						
						
						<div class="ctg-on-pdbox">출산/유아</div>
						<div class="pdbox">
								<c:forEach var="k" items="${pd_list}">
								<c:if test="${k.category =='child'}">
								<div class="card col-md-2">
										<a class="card-img-top" href="/1001_JSP_Project/Controller?cmd=pd_onelist&p_name=${k.p_name}&p_num=${k.p_num}&id=${cs.id}"> 
										<img class="card-img-top" src="/1001_JSP_Project/images/${k.p_image_s}" style="width: 100%; height: 200px;">
										</a>
										<hr style="background-color: #ccc">
										<h5 class="card-text">${k.p_name}</h5>
										<p class="card-text">${k.p_price - k.p_saleprice}원</p>
								</div> 
								</c:if>
								</c:forEach>
						</div>
						
						<div class="ctg-on-pdbox">식품</div>
						<div class="pdbox">
								<c:forEach var="k" items="${pd_list}">
								<c:if test="${k.category =='food'}">
								<div class="card col-md-2">
										<a class="card-img-top" href="/1001_JSP_Project/Controller?cmd=pd_onelist&p_name=${k.p_name}&p_num=${k.p_num}&id=${cs.id}"> 
										<img class="card-img-top" src="/1001_JSP_Project/images/${k.p_image_s}" style="width: 100%; height: 200px;">
										</a>
										<hr style="background-color: #ccc">
										<h5 class="card-text">${k.p_name}</h5>
										<p class="card-text">${k.p_price - k.p_saleprice}원</p>
								</div> 
								</c:if>
								</c:forEach>
						</div>
						
						<div class="ctg-on-pdbox">주방용품</div>
						<div class="pdbox">
								<c:forEach var="k" items="${pd_list}">
								<c:if test="${k.category =='kitchen'}">
								<div class="card col-md-2">
										<a class="card-img-top" href="/1001_JSP_Project/Controller?cmd=pd_onelist&p_name=${k.p_name}&p_num=${k.p_num}&id=${cs.id}"> 
										<img class="card-img-top" src="/1001_JSP_Project/images/${k.p_image_s}" style="width: 100%; height: 200px;">
										</a>
										<hr style="background-color: #ccc">
										<h5 class="card-text">${k.p_name}</h5>
										<p class="card-text">${k.p_price - k.p_saleprice}원</p>
								</div> 
								</c:if>
								</c:forEach>
						</div>
						
						<div class="ctg-on-pdbox">생활용품</div>
						<div class="pdbox">
								<c:forEach var="k" items="${pd_list}">
								<c:if test="${k.category =='life'}">
								<div class="card col-md-2">
										<a class="card-img-top" href="/1001_JSP_Project/Controller?cmd=pd_onelist&p_name=${k.p_name}&p_num=${k.p_num}&id=${cs.id}"> 
										<img class="card-img-top" src="/1001_JSP_Project/images/${k.p_image_s}" style="width: 100%; height: 200px;">
										</a>
										<hr style="background-color: #ccc">
										<h5 class="card-text">${k.p_name}</h5>
										<p class="card-text">${k.p_price - k.p_saleprice}원</p>
								</div> 
								</c:if>
								</c:forEach>
						</div>
						
						<div class="ctg-on-pdbox">홈 인테리어</div>
						<div class="pdbox">
								<c:forEach var="k" items="${pd_list}">
								<c:if test="${k.category =='home_interial'}">
								<div class="card col-md-2">
										<a class="card-img-top" href="/1001_JSP_Project/Controller?cmd=pd_onelist&p_name=${k.p_name}&p_num=${k.p_num}&id=${cs.id}"> 
										<img class="card-img-top" src="/1001_JSP_Project/images/${k.p_image_s}" style="width: 100%; height: 200px;">
										</a>
										<hr style="background-color: #ccc">
										<h5 class="card-text">${k.p_name}</h5>
										<p class="card-text">${k.p_price - k.p_saleprice}원</p>
								</div> 
								</c:if>
								</c:forEach>
						</div>
						
						<div class="ctg-on-pdbox">전자제품</div>
						<div class="pdbox">
								<c:forEach var="k" items="${pd_list}">
								<c:if test="${k.category =='ELC appliance'}">
								<div class="card col-md-2">
										<a class="card-img-top" href="/1001_JSP_Project/Controller?cmd=pd_onelist&p_name=${k.p_name}&p_num=${k.p_num}&id=${cs.id}"> 
										<img class="card-img-top" src="/1001_JSP_Project/images/${k.p_image_s}" style="width: 100%; height: 200px;">
										</a>
										<hr style="background-color: #ccc">
										<h5 class="card-text">${k.p_name}</h5>
										<p class="card-text">${k.p_price - k.p_saleprice}원</p>
								</div> 
								</c:if>
								</c:forEach>
						</div>
			</div>
	
</body>
</html>