<%@page import="pack.product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productMgr" class="pack.product.ProductMgr"/>
<%
String no = request.getParameter("no");
ProductBean bean = productMgr.getProduct(no);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세보기</title>
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
<%@ include file="admin_top.jsp" %>
<br>
<br>
<br>
<br>
<table class="table table-striped table-bordered table-hover">
	<tr>
		<td style="width:20%">
			<img src="../data/<%=bean.getImage()%>" width="150">	
		</td>
		<td style="width: 50%; vertical-align:top;">
			<table>
			<tr><td style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번호 : </td><td><%=bean.getNo()%></td></tr>
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;상품명 : </td><td><%=bean.getName()%></td></tr>
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;가격 : </td><td><%=bean.getPrice()%></td></tr>
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;등록일 : </td><td><%=bean.getSdate().substring(0,10)%></td></tr>
			<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;재고량 : </td><td><%=bean.getStock()%></td></tr>
			</table>
		</td>
		<td style="width:30%; vertical-align:top;">
		<b>상품설명</b><br>
			<%=bean.getDetail() %>
		</td>
	</tr>
	<tr>
		<td colspan="3" style="text-align: center;">
		<button type="button" class="btn btn-default"><a href="javascript:ProductUpdate('<%=bean.getNo()%>')">수정하기</a></button>
		&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-default"><a href="javascript:ProductDelete('<%=bean.getNo()%>')">삭제하기</a></button>
		</td>
	</tr>
</table>
<%@ include file="admin_bottom.jsp" %>
<form action="productupdate.jsp" name="updateForm" method="post">
<input type="hidden" name="no">
</form>

<form action="productprocess_control.jsp?flag=delete" name="delForm" method="post">
<input type="hidden" name="no">
</form>
</body>
</html>