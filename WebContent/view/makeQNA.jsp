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
<title>고객게시판 글쓰기</title>
<style type="text/css">
table, tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	margin-left: 10px;
	width: 50%;
	padding-top: 5px;
	padding-bottom: 10px;
}

table {
	margin: auto;
}
#qna_table{
	margin-top: 3.5%;
}
th{
	width: 20%;
}

tfoot {
	text-align: center;
}
</style>
<script type="text/javascript">
	function mkQna(f) {
		f.action = "/1001_JSP_Project/Controller?cmd=makeQna&id=${id}";
		f.submit();
	}
</script>
</head>
<body>
	<!-- <h1 style="text-align: center;">COPANG 고객센터</h1> -->
	<jsp:include page="banner.jsp"/>

<div id="make_body">
<form method="post" enctype="multipart/form-data">
	<table id="qna_table">
	<thead>	
		<tr> <th colspan="2"> 고객님의 말씀을 귀기울여 듣겠습니다</th>  </tr>
	</thead>
		<tbody>
			<tr><th width="13%">분류</th> 
			<td><select name="qna_ctg">
					<option >분류</option>
					<option value="as">A/S</option>
					<option value="mlg">마일리지</option>
					<option value="food">배송</option>
					<option value="pd">상품</option>
					<option value="free">자유</option>
			</select></td>
			</tr>
			<tr><th width="13%">고객 ID</th>  <td> <input type="text" disabled="disabled" name="id" value="${id}"> </td>  </tr>
			<tr><th width="13%">제목</th>    <td> <input type="text" name="title"> </td>  </tr>
			<tr><th width="13%">QnA PW</th> <td> <input type="password" name="pwd" > </td>  </tr>
			<tr><th width="13%">내용</th>    <td> <textarea name="content" rows="10" cols="40"> </textarea> </td> </tr>
			<tr><th width="13%">파일첨부</th> <td> <input type="file" name="filename" ></td>  </tr>
		</tbody>
		<tfoot>
			<tr> 
			<td colspan="6">
			<input type="button" value="글쓰기" onclick="mkQna(this.form)">
			<input type="reset" value="다시쓰기" />
			</td>
			</tr>
		</tfoot>
	</table>
</form>
</div>
</body>
</html>