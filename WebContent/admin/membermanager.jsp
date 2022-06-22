<%@page import="pack.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="memberMgr" class="pack.member.MemberMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원관리</title>
<!-- <link rel="stylesheet" type="text/css" href="../css/board.css"> -->
<!-- 구글 폰트 가져옴 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <!-- 부트스트랩 css파일 참조 -->
    <link rel="stylesheet" href="../css/bootstrap.css">

    <!-- jquery 파일 참조 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- 부트스트랩 js파일 참조 -->
    <script src="../js/bootstrap.js"></script>

    <!-- 개인 커스텀 디자인 -->
    <link rel="stylesheet" href="../css/style-computer.css">
<script src="../js/script.js"></script>
<script type="text/javascript">


</script>
</head>
<body>
<h2> ** 관리자-전체회원 관리 **</h2>
<%@ include file="../admin/admin_top.jsp" %>
<table class="table table-striped table-bordered table-hover">
	<tr style="text-align:center;">
		<th style="text-align:center;">아이디</th>
		<th style="text-align:center;">회원명</th>
		<th style="text-align:center;">이메일</th>
		<th style="text-align:center;">전화</th>
		<th style="text-align:center;">수정</th>	
	</tr>
	<%
	ArrayList<MemberBean> list = memberMgr.getMemberAll();
	for(MemberBean m:list){
	%>
	<tr style="text-align:center;">
		<td><%=m.getId() %></td>
		<td><%=m.getname() %></td>
		<td style="text-align:left;"><%=m.getEmail() %></td>
		<td><%=m.getPhone() %></td>
		<td><button type="button" class="btn btn-default"><a href="javascript:memUpdate('<%= m.getId() %>')">수정</a></button></td>
	<%	
	}
	%>	
</table>
<%@ include file="../admin/admin_bottom.jsp" %> 

<form action="memberUpdate_admin.jsp" name="updateFrm" method="post">
<input type="hidden" name="id">

</form>

</body>
</html>