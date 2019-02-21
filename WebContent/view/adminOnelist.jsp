<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 상품 수정</title>
<link href="/1001_JSP_Project/Resources/css/bootstrap.min.css" rel="stylesheet">
<script src="/1001_JSP_Project/Resources/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="/1001_JSP_Project/smarteditor2-2.8.2.3/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/1001_JSP_Project/js/jquery-3.3.1.js"></script>

<style type="text/css"> 
body{
	background-color: #111;
}
h3{
margin-top: 2%;
margin-bottom: 1.5%;
}
*{box-sizing: border-box;}
.width-controller{
	width: 800px;
}
.newline_label{
	font-size: 15px;
}
.newline{
	width: 80%;
	margin-bottom: 3%;
}
.container{
margin-top: 1.5%;
}
textarea{
 background-color: #fff;
 width: 50%;
}
.button{
margin-top:3%;
margin-bottom: 5%;
text-align: center;
} 
#frm{
margin-left: 23%;}
</style>
<script type="text/javascript">
/* 	function update(f) {
		f.action="/1001_JSP_Project/Controller?cmd=adminOneUpdate";
		f.submit();
	}
	 */
	function prev() {
		history.go(-1);
	}
	
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
		// editor_object.getById["smartEditor"].exec("SET_IR", [""]);

		//전송버튼 클릭 이벤트
		$("#savebutton").click(function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			editor_object.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
		});
	});
</script>
</head>
<body>
	<jsp:include page="banner.jsp" />
	<h3 style="text-align: center;">COPANG 상품 등록</h3>
	<hr>
	<div class="container">
		<!-- enctype="multipart/form-data" 이거는 나중에 사진 수정할 때, 그 때 쓸것...-->
		<form method="post" action="/1001_JSP_Project/Controller?cmd=adminOneUpdate" id="frm">
		<div class="width-controller">
						
					<div class="newline">
						<label class="newline_label">카테고리</label><br>
						<select name="category" class="form-control">
							<option value="${pd.category}"> ${pd.category} </option>
							<option value="clothes">clothes</option>
							<option value="beauty">beauty</option>
							<option value="child">child</option>
							<option value="food">food</option>
							<option value="kitchen">kitchen</option>
							<option value="life">life</option>
							<option value="home_interial">home_interial</option>
							<option value="ELC appliance">ELC appliance</option>
						</select>
					</div>
					<!--
						서브 카테고리 만들 곳	
					 -->
					 	
					 	
					 	<div class="newline">
						<label class="newline_label">상품코드</label><br>
						<div id="id-flexbox" >
						<input type="text" class="form-control" name="p_num" value="${pd.p_num}">
						</div>
						</div>
					 
					 	<div class="newline">
						<label class="newline_label">상품명</label><br>
						<div id="id-flexbox" >
						<input type="text" class="form-control" name="p_name" value="${pd.p_name}">
						</div>
						</div>
					 
					 	<div class="newline">
						<label class="newline_label">제품회사</label><br>
						<div id="id-flexbox" >
						<input type="text" class="form-control" name="p_company" value="${pd.p_company}">	
						</div>
						</div>
					 
					 	<div class="newline">
						<label class="newline_label">메인 이미지</label><br>
						<div id="id-flexbox" >
						<img src="/1001_JSP_Project/images/${pd.p_image_s}" width="200px" height="200px;">	
						</div>
						</div>
	</div>
					 
					 	<div class="newline">
						<label class="newline_label">상품정보</label><br>
				<textarea name="smartEditor" class="form-control" id="smartEditor" rows="10" cols="100" style="width:700px; height:350px;">${pd.p_content}</textarea>	
						</div>
					
	<div class="width-controller">
						<div class="newline">
						<label class="newline_label">가격정보</label><br>
						<input type="number" class="form-control" name="p_price" value="${pd.p_price}">
						</div>
					
						<div class="newline">
						<label class="newline_label">할인가</label><br>
						<input type="number" class="form-control" name="p_saleprice" value="${pd.p_saleprice}">
						</div>
						
					
						<div class="newline">
						<label class="newline_label">재고</label><br>
						<input type="number" class="form-control" name="p_stock" value="${pd.p_stock}">
						</div>
						
						<input type="hidden" name="pd_idx" value="${pd.pd_idx}">
						<input type="hidden" name="category" value="${pd.category}">
						
		</div>
		</form>
				<div class="button">
					<input type="submit" class="btn btn-primary btn-sm" value="수정" id="savebutton" >
					&nbsp;&nbsp;
					<input type="button" class="btn btn-primary btn-sm" value="이전 페이지" onclick="prev()">
					&nbsp;&nbsp;
					<input type="reset" class="btn btn-primary btn-sm" value="초기화">
				</div>
	</div>
</body>
</html>