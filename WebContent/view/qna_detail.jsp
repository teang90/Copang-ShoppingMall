<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%
    String cPage = request.getParameter("cPage");
    session.setAttribute("cPage", cPage);
    //System.out.print("qna_detail의 cPage=?"+cPage);
    
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<style type="text/css">
#make_body{
margin-top: 3%;
}
table, tr, th, td{
	border: 1px solid black;
	margin: auto;
	text-align: center;
}
.fld{
	margin: auto;
	width: 20%;
	height: 10%;
}
#fld{
	margin:auto;
	width: 500px;
}
#span_butt{
	margin-right: 5%;
	text-align: right;
}
</style>
<script type="text/javascript">
function modify(f) {
	f.action="/1001_JSP_Project/Controller?cmd=qna_modify&qna_idx=${qna.qna_idx}&cPage=${cPage}";
	f.submit();
}
function delt(f) {
	f.action="/1001_JSP_Project/Controller?cmd=qna_delt&qna_idx=${qna.qna_idx}&cPage=${cPage}";
	f.submit();
}
function qna_listgo(f) {
	f.action="/1001_JSP_Project/Controller?cmd=Qnalist&id=${qna.id}&cPage=${cPage}";
	f.submit();
}
function cmt_add(f) {
	f.action="/1001_JSP_Project/Controller?cmd=qna_cmt_add";
	f.submit();
}

function mdf(f) {
	if (f.cmt_pw1.value == ""||f.cmt_pw1.value == null) {
		alert("답글의 비밀번호를 입력해주세요");
		return;
	}
	if (f.cmt_pw1.value != f.cmt_pw2.value) {
		alert("비밀번호가 틀립니다.");
		return;
	}
	
	f.action="/1001_JSP_Project/Controller?cmd=cmt_modify&cPage=${cPage}";
	f.submit();
}

function delcmt(f) {
	if (f.cmt_pw1.value == "" || f.cmt_pw1.value == null) {
		alert("답글의 비밀번호를 입력해주세요");
		return;
	}
	if (f.cmt_pw1.value != f.cmt_pw2.value) {
		alert("비밀번호가 틀립니다.");
		return;
	}
	f.action="/1001_JSP_Project/Controller?cmd=cmt_delete&cPage=${cPage}";
	f.submit();
}

</script>
</head>
<body>
<jsp:include page="banner.jsp"/>
	
<div id="make_body">
<h3 style="text-align: center;">코팡 게시글 상세보기</h3>
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
			<tr><th width="13%">제목</th>        <td> ${qna.title} </td>  </tr>
			<tr><th width="13%">내용</th>        <td> <pre><textarea cols="60px;" rows="15px;">${qna.content}</textarea> </pre></td> </tr>
			<c:if test="${!empty qna.filename}">
			<tr><th width="13%">파일첨부</th>     <td> <img src="../images/${qna.filename}" width="200px;" height="200px;" /></td>  </tr>
			</c:if>
			<c:if test="${empty qna.filename}">
			<tr><th width="13%">파일첨부</th>     <td>첨부파일이 없습니다.</tr>
			</c:if>
		</tbody>
		<tfoot>
			<tr> 
			<td colspan="6">
			<input type="button" value="수정" onclick="modify(this.form)">
			<%-- <input type="hidden" name="qna_idx" value="${qna.qna_idx}" > --%>
			<input type="button" value="삭제" onclick="delt(this.form)">
			<input type="button" value="목록" onclick="qna_listgo(this.form)">
			</td>
			</tr>
		</tfoot>
	</table>
</form>
<br>
<br>
<form method="post" action="/1001_JSP_Project/Controller?cmd=qna_cmt_add">
	<div id="comment">
	<fieldset class="fld">
	<legend>답글 쓰기</legend>
	
		<div>아이디:</div>
		<span>
			<c:if test="${!empty id}">
			<!--이거만 보내는데 왜 안가지? 일단 밑에서 히든으로 보냄-->
			<input type="text" name="cmt_id"  disabled="disabled" value="${id}" >
			</c:if>
			
			<c:if test="${empty id}">
			<input type="text" id="cmt_id" name="cmt_id" >
			</c:if>
		</span><p></p>
		
		<div>비밀번호:</div>
		<span>
			<input type="password" id="cmt_pw" name="cmt_pw" placeholder="" >
		</span><p></p>
		
		<div>내      용</div>
			<span> <textarea rows="5" cols="70" name="cmt_content" style="resize: none;"></textarea></span>
		<div>
			<input type="submit" value="완료" onclick="cmt_add(this.form)" ></div>	
		<!-- 현재 사용자가 로그인한(글쓴이가 아닌 댓글을 달려고하는 사용자) -->
		<%-- <input type="hidden" name="cmt_id" value="${id}" > --%> 
		<input type="hidden" name="qna_idx" value="${qna.qna_idx}" >
		<input type="hidden" name="cPage" value="${cPage}" >
		<input type="hidden" name="cmt_id" value="${id}" >
	</fieldset>
	</div>
	<br>
</form>

<div  id="fld">
<form method="post" name="f">
<c:if test="${!empty cmt_list}">	
	<c:forEach var="k" items="${cmt_list}">
			<fieldset id="fld_list">
			<div>${k.cmt_id}님의 답글 &nbsp;&nbsp;&nbsp;[${k.cmt_write_date}]
			<br>			
			<span>
			비밀번호:
				<input type="password" name="cmt_pw1" placeholder="답글의 비밀번호 "> 
				<input type="hidden" name="cmt_pw2" value="${k.cmt_pw}" > 
			</span>
			
			&nbsp;&nbsp;&nbsp;
			<span id="span_butt">
			<input type="button" value="수정" onclick="mdf(this.form)">
			<button onclick="delcmt(this.form)">삭제</button></a></span>
			</div>
			<hr>
			<div>
			<textarea rows="5" cols="60" name="cmt_content">${k.cmt_content}</textarea>
				<input type="hidden" name="cmt_content" value="${k.cmt_content}">
				<input type="hidden" name="cmt_idx" value="${k.cmt_idx}">
				<input type="hidden" name="qna_idx" value="${k.qna_idx}">
			</div>
			</fieldset>
			<br>
	</c:forEach>
</c:if>
</form>
</div>

</div>
</body>
</html>