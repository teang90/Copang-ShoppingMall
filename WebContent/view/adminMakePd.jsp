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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품추가</title>
<link href="/1001_JSP_Project/Resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/1001_JSP_Project/Resources/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="/1001_JSP_Project/smarteditor2-2.8.2.3/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/1001_JSP_Project/js/jquery-3.3.1.js"></script>

<style type="text/css">
body{background-color: #eee;}
h3{
margin-top: 2%;
margin-bottom: 1.5%;
}
*{
box-sizing: border-box;
}
.width-controller{
	width: 800px;
}
.newline_label{
	font-size: 15px;
}
.newline{
	width: 70%;
	margin-bottom: 3%;
}
.container{
margin-top: 1.5%;
margin-left: 35%;
}
div.newline textarea{
 margin: auto; 
 background-color: #fff;
}
.button{
text-align: center;
margin-top:3%;
margin-bottom: 5%;
}
</style>
<script type="text/javascript">
	$(function() {
		
		var editor_object = [];
		
		nhn.husky.EZCreator.createInIFrame({
	    	oAppRef: editor_object,
		    elPlaceHolder: "smartEditor",
		    sSkinURI: "/1001_JSP_Project/smarteditor2-2.8.2.3/SmartEditor2Skin.html",
		    htParams: {
		    	//툴바 사용 여부(true: 사용 / false: 사용X)
		    	bUseToolbar : true,
		    	//입력창 크기 조절바 사용 여부(true: 사용 / false: 사용X)
		    	bUseVerticalResizer : false,  
		    	//모드 탭(Editor | HTML | TEXT => true: 사용 / false: 사용X)
		    	bUseModeChanger : false,
		    }
		});

		//전송버튼 클릭 이벤트
		$("#savebutton").click(function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			editor_object.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});
	});
	
	function prev() {
		history.go(-1);
	}
	
</script>
</head>
<body>
	<jsp:include page="banner.jsp" />
	<h3 style="text-align: center;">COPANG 상품 등록</h3>
	<hr>
	<div class="container">
	
		<form method="post" action="/1001_JSP_Project/Controller?cmd=makePd" name="f" enctype="multipart/form-data" id="frm" class="form-signin">
				<div class="width-controller">
						
						<div class="newline">
						<label class="newline_label">카테고리</label><br>
						<select class="form-control" name="category">
								<option value="clothes">clothes</option>
								<option value="beauty">beauty</option>
								<option value="child">child</option>
								<option value="food">food</option>
								<option value="kitchen">kitchen</option>
								<option value="life">life</option>
								<option value="home_interial">home_interial</option>
								<option value="ELC appliance">ELC appliance</option>
						</select>
						<%-- 이걸로 서브 카테고리 설정... 에이작스로 해야겠지?
						<c:set var="category" value="${category.value}" /> --%>
						</div>
					<!-- 서브 카테고리 만들곳  나중에 -->
					<%-- <tr>
						<td>하위 카테고리 </td>
						<td>
						<c:if test="${true}">
							<select name="subcategory">
								<option value="NT">노트북</option>
								<option value="PC">PC/PC부품</option>
								<option value="Phone">휴대폰</option>
								<option value="SoundApp">음향/이어폰</option>
								<option value="VideoApp">TV/영상제품</option>
								<option value="LifeApp">생활가전</option>
							</select>
						</c:if>
						</td>
					</tr> --%>
						
						<div class="newline">
						<label class="newline_label">상품코드</label><br>
						<div id="id-flexbox" >
						<input type="text" class="form-control" name="p_num">
						</div>
						</div>
						
						<div class="newline">
						<label class="newline_label">상품명</label><br>
						<input type="text" name="p_name" class="form-control">
						</div>
						
						<div class="newline">
						<label class="newline_label">제품회사</label><br>
						<input type="text" name="p_company" class="form-control">
						</div>
						
						<div class="newline">
						<div class="newline_label">메인 이미지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span><input type="file" name="p_image_s" /></span>
						<!-- 버튼 이미지 수정하는 방법 http://html5around.com/wordpress/tutorials/css-input-type-file/ -->
						</div>
						</div>
				</div>
						
						<div class="newline">
						<label class="newline_label" id="smartSection">상품정보</label><br>
						<textarea name="smartEditor" class="form-control" id="smartEditor" rows="10" cols="100" style="width:700px; height:350px;"></textarea>
						</div>

						<div class="width-controller">
						<div class="newline">
						<label class="newline_label">가격정보</label><br>
						<input type="number" name="p_price" class="form-control">
						</div>

						<div class="newline">
						<label class="newline_label">할인가</label><br>
						<input type="number" name="p_saleprice" class="form-control">
						</div>
						
						<div class="newline">
						<label class="newline_label">수량</label><br>
						<input type="number" name="p_stock" class="form-control">
						</div>
						
				</div>
		</form>
	</div>
						
	<div class="button">
		<input type="button" class="btn btn-primary btn-sm" id="savebutton" value="등록" />
		<input type="reset" class="btn btn-primary btn-sm" value="초기화">
		<a href="/1001_JSP_Project/view/home.jsp?id=${id}" class="btn btn-primary btn-sm">홈</a>
		<button class="btn btn-primary btn-sm" onclick="prev()">이전페이지</button>
	</div>
</body>
</html>