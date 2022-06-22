<%@page import="pack.product.ProductMgr"%>
<%@page import="pack.product.ProductBean"%>
<%@page import="pack.order.OrderBean"%>
<%@page import="pack.order.OrderMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="OrderMgr" class="pack.order.OrderMgr"/>
    <jsp:useBean id="ProductMgr" class="pack.product.ProductMgr"/>
    
    <%
    OrderBean order = OrderMgr.getOrderDetail(request.getParameter("no"));
    ProductBean product = ProductMgr.getProduct(order.getProduct_no());
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세</title>
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
<!-- <link rel="stylesheet" type="text/css" href="../css/board.css"> -->
<script src="../js/script.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<h2> ** 주문 상세 보기 **</h2>
<%@ include file ="admin_top.jsp" %>
<form action="orderproc_admin.jsp" name="detailFrm" method="get">
<table class="table table-striped table-bordered table-hover">
	<tr>
		<td>고객 ID :<%=order.getId() %></td>
		<td>주문번호 :<%=order.getNo() %></td>
		<td>상품번호 :<%=order.getProduct_no() %></td>
		<td>상 품 명 :<%=product.getName() %></td>
	</tr>
	<tr>
		<td>상품 가격 :<%=product.getPrice() %></td>
		<td>주문 수량 :<%=order.getQuantity() %></td>
		<td>재 고 량 :<%=product.getStock() %></td>
		<td>주 문 일 :<%=order.getSdate() %></td>
	</tr>
	<tr>
		<td colspan="4">총 결제 금액 :
		<%=Integer.parseInt(order.getQuantity()) * Integer.parseInt(product.getPrice()) %>
	</td>
	</tr>	
	<tr>
	 	<td colspan="4" style="text-align:center;">
	 		주문상태 :
	 		<select name="state">
	 			<option value="1"> 접수</option>
	 			<option value="2"> 입금확인</option>
	 			<option value="3"> 배송준비</option>
	 			<option value="4"> 배송중</option>
	 			<option value="5"> 처리완료</option>	 			
	 		</select>
	 		<script type="text/javascript">
	 		 document.detailFrm.state.value = <%=order.getState()%>
	 		</script>
	 		<br>
	 	</td>
	</tr>
	<tr>
	 	<td colspan="4" style="text-align:center;">
	 	<input type="button" class="btn btn-default" value="수정" onclick="orderUpdate(this.form)">
	 	
	 	<input type="button" class="btn btn-default" value="삭제" onclick="orderDelete(this.form)">
	
	<input type="hidden" name="no" value="<%=order.getNo()%>">
  	<input type="hidden" name="flag"> 
	 	</td>
	 </tr>
</table>
</form>
<%@ include file ="admin_bottom.jsp" %>
</body>
</html>