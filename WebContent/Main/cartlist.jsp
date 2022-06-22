<%@page import="pack.product.ProductBean"%>
<%@page import="pack.order.OrderBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="cartMgr" class="pack.order.CartMgr"  scope="session" />
<jsp:useBean id="productMgr" class="pack.product.ProductMgr" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 정보</title>
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
<!-- <link href="../css/style.css" rel="stylesheet" type="text/css"> -->
<script src="../js/script.js">

</script>
</head>
<body>
<h2>장바구니에 저장된 목록</h2>
<%@include file="guest_top.jsp" %>
<!-- header -->
     <header class="custom_header">
        <nav class="navbar">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="guest_index.jsp" id="index">
                        <img src="../img/pc_logo.png" style="width:40px;" alt="logo">
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="guest_index.jsp">메인페이지</a></li>
                        <li><a href="productlist.jsp">전체 상품보기</a></li>
                        <li><a href="../board/boardlist.jsp">커뮤니티</a></li>
                        <li><a href="../referenceboard/referboardlist.jsp">자료실</a></li>
                    </ul>

                    <!-- 우측 회원 메뉴 -->
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%=memid%><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="../member/register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                <li><a href="guest_mypage.jsp"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
                                <li><a href="cartlist.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
                                <li><a href="orderlist.jsp"><span class="glyphicon glyphicon-list-alt"></span> 주문목록</a></li>
                                <% if (memid == null) { %>
           				 		<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        						<% } else { %>
           					 	<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        						<% } %>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header> 
<table class="table table-striped table-bordered table-hover">
	<tr>
		<th>주문상품</th><th>가격(소계)</th><th>수량</th><th>수정/삭제</th><th>조회</th>
	</tr>
	<%
	
	int totalPrice = 0;		//총계 구하기위해
	Hashtable hcart = cartMgr.getCartList();
	if(hcart.size() == 0){
%>
	<tr><td colspan="5">주문 건수가 없습니다.</td></tr>
<%
	}else{
		Enumeration enu = hcart.keys();
		while(enu.hasMoreElements()){
			OrderBean orderBean = (OrderBean)hcart.get(enu.nextElement());
			ProductBean productBean = productMgr.getProduct(orderBean.getProduct_no());
			
			int price = Integer.parseInt(productBean.getPrice());
			int quantity = Integer.parseInt(orderBean.getQuantity());
			int subTotal = price * quantity;		//소계
			
			totalPrice += subTotal;		//총계
			
%>

<tr>
	<td><%=productBean.getName() %></td>
	<td><%=subTotal %></td>
	<form action="cartproc.jsp" method="get">
			<input type="hidden" name="flag">
			<input type="hidden" name="product_no" value="<%=productBean.getNo() %>">
	<td><input type="text" name="quantity" value="<%=quantity %>" size="5" style="text-align: center;"></td>
	<td>
		<input class="btn btn-default" type="button" value="수정" onclick="cartUpdate(this.form)">	
		<input class="btn btn-default" type="button" value="삭제" onclick="cartDelete(this.form)">	
	</td>
	</form>
<%-- 	<td><a href="javascript:productDetail_guest('<%=productBean.getNo()%>')">상세보기</a></td> --%>
	<td><button type="button" class="btn btn-default" onclick="javascript:productDetail_guest('<%=productBean.getNo()%>')">상세보기</button></td>
</tr>


<% 
		}
		
		%>
		<tr>
		<td colspan="5">
			<br>
			<b>총 결제 금액 : <%=totalPrice %></b>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" class="btn btn-default" onclick="location.href='orderproc.jsp'">주문하기</button>
		</td>
	</tr>
	<%	
	}
	%>
</table>
<%@include file="guest_bottom.jsp" %>

<form action="productdetail_guest.jsp" name="detailFrm" >
	<input type="hidden" name="no">
</form>
</body>
</html>



















