<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제하기</title>
<style type="text/css">
table, tr, th, td{
	border: 1px solid black;
	margin: auto;
	text-align: center;
}
</style>
<script type="text/javascript">
	function delt(f) {
		if (f.pwd.value == "${qna.pwd}") { //name이  pwd인 것을 호출
			var chk = confirm("삭제하시겠습니까?");
			if (chk) {
				f.action="/1001_JSP_Project/Controller?cmd=del&qna_idx=${qna.qna_idx}&cPage=${cPage}";
				f.submit();								
			}else{
				history.go(-1);	
			}
		}else{
			alert("게시글의 비밀번호가 틀렸습니다. 다시 시도해주세요");
			f.pwd.value="";
			f.pwd.focus();
			return ;
		}
	}
</script>
</head>
<body>
	<!--상세보기에서 삭제버튼 클릭시 커맨드 들렸다가 여기로 와서 
	글 비밀번호 쓰고 삭제하기 버튼 클릭시 confirm으로 삭제하심까? 확인 후에
	삭제 진행하고 다시 게시글 리스트로 이동하기 	추가 수정, 해당글의 작성자 
	아이디로 로그인한 사람만 삭제버튼 뜨게(이게 조금 시간 걸린다면 로그인한 상태의 사람만 삭제버튼 뜨게)
	-->
<jsp:include page="banner.jsp"/>

<div id="make_body">
<h3 style="text-align: center;">코팡 게시글 상세보기</h3>
<form name="f" method="post">
	<table id="qna_table">
	<thead>	
		<tr> <th colspan="2"> 고객님의 말씀을 귀기울여 듣겠습니다</th>  </tr>
	</thead>
		<tbody>
			<tr><th width="13%">분류</th> 
			<td>${qna.qna_ctg}</td>
			</tr>
			<tr><th width="13%">고객 ID</th>  <td> ${qna.id}</td></tr>
			<tr><th width="13%">제목     </th>  <td> ${qna.title}</td></tr>
			<tr><th width="13%">비밀번호</th> <td><input type="password" name="pwd"></td></tr>
			<tr><th width="13%">내용      </th> <td><pre><textarea cols="60px;" rows="15px;">${qna.content}</textarea></pre></td></tr>
		</tbody>
		<tfoot>
			<tr> 
			<td colspan="6">
			<input type="hidden" name="id" value="${qna.id}" > 
			<input type="button" value="삭제" onclick="delt(this.form)" />
			</td>
			</tr>
		</tfoot>
	</table>
</form>
</div>
</body>
</html>