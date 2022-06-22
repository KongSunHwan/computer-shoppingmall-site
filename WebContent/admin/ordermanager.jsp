<%@page import="pack.product.ProductMgr"%>
<%@page import="pack.product.ProductBean"%>
<%@page import="pack.order.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="orderMgr" class="pack.order.OrderMgr"/>
    <jsp:useBean id="ProductMgr" class="pack.product.ProductMgr"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문된 상품 목록</title>
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
<h2> ** 주문된 상품 목록 **</h2>
<%@ include file="admin_top.jsp" %>
<table class="table table-striped table-bordered table-hover">
	<tr style="text-align:center;">
		<th style="text-align:center;">주문번호</th>
		<th style="text-align:center;">주문고객 ID</th>
		<th style="text-align:center;">상품명</th>
		<th style="text-align:center;">주문량</th>
		<th style="text-align:center;">주문 날짜</th>
		<th style="text-align:center;">주문 상태</th>
		<th style="text-align:center;">보기</th>
	</tr>
	<%
	ArrayList<OrderBean> list = orderMgr.getOrderAll();
	if(list.size() == 0){
		%>
		<tr><td colspan="7">주문 내역이 없습니다</td></tr>
		
		
	<%	
	}else{
		for(int i=0; i < list.size(); i++){
			OrderBean order = (OrderBean)list.get(i);
			ProductBean product = 
					ProductMgr.getProduct(order.getProduct_no());
		%>
		<tr style="text-align: center;">
		<td><%=order.getNo() %></td>
		<td><%=order.getId() %></td>
		<td><%=product.getName() %></td>
		<td><%=order.getQuantity() %></td>
		<td><%=order.getSdate() %></td>	
		<td>
		<%
		switch(order.getState()){
		case "1":out.println("접수"); break;
		case "2":out.println("입금확인"); break;
		case "3":out.println("배송준비"); break;
		case "4":out.println("배송중"); break;
		case "5":out.println("처리완료"); break;
		default:out.println("접수중");
		}
		 %>
		</td>
		<td>
			<button type="button" class="btn btn-default"><a href="javascript:orderDetail('<%=order.getNo()%>')">주문처리</a></button>
		</td>
		</tr>
		<%
		}
	}
	%>
</table>
<%@ include file="admin_bottom.jsp" %>


<form action="orderdetail.jsp" name="detailFrm" method="post">
<input type="hidden" name="no">
</form>
</body>
</html>