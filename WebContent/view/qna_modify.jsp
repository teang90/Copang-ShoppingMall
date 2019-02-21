<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String cPage = request.getParameter("cPage");
    request.setAttribute("cPage", cPage);
    String qna_idx = request.getParameter("qna_idx");
    request.setAttribute("qna_idx", qna_idx);
    
    System.out.println("큐앤모디파이qna_idx&cPage= "+qna_idx+"&"+cPage);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, tr, th, td{
	border: 1px solid black;
	margin: auto;
	text-align: center;
}
</style>
<script type="text/javascript">
function modify_go(f) {
	f.action="/1001_JSP_Project/Controller?cmd=update&qna_idx=${qna_idx}&cPage=${cPage}";
	f.submit();
}
</script>
</head>
<body>
<jsp:include page="banner.jsp"/>
<h3 style="text-align: center;">코팡 게시글 상세보기</h3>
<div id="make_body">
<form method="post" enctype="multipart/form-data">
	<table id="qna_table">
	<thead>	
		<tr> <th colspan="2"> 고객님의 말씀을 귀기울여 듣겠습니다</th>  </tr>
	</thead>
		<tbody>
			<tr><th width="13%">분류</th> 
			<td>${qna.qna_ctg}</td>
			</tr>
			<tr><th width="13%">고객 ID</th>     	<td> ${qna.id} </td>  </tr>
			<tr><th width="13%">게시글 PW</th>        <td> <input type="password" name="pwd" value="${qna.pwd}">  </td>  </tr>
			<tr><th width="13%">제목</th>        <td> <input type="text" name="title" value="${qna.title}">  </td>  </tr>
			<tr><th width="13%">내용</th>        <td> <pre><textarea name="content" cols="60px;" rows="15px;">${qna.content}</textarea> </pre></td> </tr>
			<tr><th width="13%">파일첨부</th>     <td> <img src="../images/${qna.filename}" width="200px;" height="200px;" /></td>  </tr>
		</tbody>
		<tfoot>
			<tr> 
			<td colspan="6">
				<input type="button" value="수정" onclick="modify_go(this.form)">
			</td>
			</tr>
		</tfoot>
	</table>
</form>
</div>

</body>
</html>