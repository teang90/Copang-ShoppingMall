<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script type="text/javascript" src="/1001_JSP_Project/smarteditor2-2.8.2.3/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/1001_JSP_Project/js/jquery-3.3.1.js"></script>
<script type="text/javascript">
 
/* 출처
	http://hellogk.tistory.com/62?category=528476 [IT Code Storage]
	http://lux.cuenet.kr/45
*/

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
	    	bUseVerticalResizer : true,  
	    	//모드 탭(Editor | HTML | TEXT => true: 사용 / false: 사용X)
	    	bUseModeChanger : false,
	    }
	});

	//전송버튼 클릭 이벤트
	$("#savebutton").click(function() {
		//id가 smarteditor인 textarea에 에디터에서 대입
		editor_object.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
		/* $("#frm").action="/1001_JSP_Project/Controller?cmd=editor&editor_object="+editor_object; */
		$("#frm").submit();
	});
}); 
</script>
</head>
<body>

<form action="/1001_JSP_Project/Controller?cmd=editor" method="post" id="frm">
    <textarea name="smartEditor" id="smartEditor" rows="10" cols="100" style="width:766px; height:412px;"></textarea>
    <input type="button" id="savebutton" value="등록" />
</form>

<%-- 
<%
	request.setCharacterEncoding("utf-8");
	String smartEditor = request.getParameter("smartEditor");
%>
 --%>
</body>
</html>