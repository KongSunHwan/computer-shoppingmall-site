<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="BoardMgr" class="pack.board.BoardMgr"/>
    <jsp:useBean id="dto" class="pack.board.BoardDto"/>
    
   <%
   
   String num = request.getParameter("num");
   String spage = request.getParameter("page");
   dto = BoardMgr.getReplyData(num);
   
   %>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>reply</title>
<!-- <link rel="stylesheet" type="text/css" href="../css/board.css"> -->
<script>
function check(){
	if(frm.name.value==""){
		alert("이름을 입력하세요");
		frm.name.focus();
	}else if(frm.pass.value ==""){
		alert("비밀번호를 입력하세요");
		frm.pass.focus();
	}else if(frm.mail.value ==""){
		alert("이메일을 입력하세요");
		frm.mail.focus();
	}else if(frm.title.value ==""){
		alert("제목을 입력하세요");
		frm.title.focus();
	}else if(frm.cont.value ==""){
		alert("내용을 입력하세요");
		frm.cont.focus();
	}else
		frm.submit(); //replysave.jsp로 넘어가게 됨
}
</script>
</head>
<body>
<h2 style="text-align:center;">답글 쓰기</h2>
<hr>
<form name="frm" method="post" action="replysave.jsp">
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="page" value="<%=spage %>">
<input type="hidden" name="gnum" value="<%=dto.getGnum() %>">
<input type="hidden" name="onum" value="<%=dto.getOnum() %>">
<input type="hidden" name="nested" value="<%=dto.getNested() %>">

	<table border="1" class="table table-striped table-bordered">
		<tr>
			<td align="center" width="100">이름</td>
			<td width="430"><input name="name" size="15"></td>
		</tr>
		<tr>
			<td align="center">암호</td>
			<td><input type="password" name="pass" size="15"></td>
		</tr>
		<tr>
			<td align="center">메일</td>
			<td><input name="mail" size="25"></td>
		</tr>
		<tr>
			<td align="center">제목</td>
			<td><input name="title" size="50" value="[답글]<%=dto.getTitle() %>"></td>
		</tr>
		<tr>
			<td align="center">내용</td>
			<td><textarea name="cont" cols="50" rows="10"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center" height="30">
				<input type="button" class="btn btn-primary" value="작성" onClick="check()">&nbsp;
				<input type="button" class="btn btn-primary" value="목록" onClick="location.href='boardlist.jsp?page=<%=spage%>'"></td>
		</tr>
	</table>
</form>

</body>
</html>