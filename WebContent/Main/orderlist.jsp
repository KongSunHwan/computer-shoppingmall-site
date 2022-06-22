<%@page import="pack.product.ProductBean"%>
<%@page import="pack.order.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="orderMgr" class="pack.order.OrderMgr"/>
    <jsp:useBean id="productMgr" class="pack.product.ProductMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문상품 목록</title>
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
</head>
<body>
<h2>주문 상품 확인</h2>
<%@ include file ="guest_top.jsp" %>
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
	<tr style="text-align:center;">
		<th style="text-align:center;">주문번호</th>
		<th style="text-align:center;">상품명</th>
		<th style="text-align:center;">주문량</th>
		<th style="text-align:center;">주문일</th>
		<th style="text-align:center;">주문상태</th>	
	</tr>
	<%
	String id = (String)session.getAttribute("idKey");
	ArrayList<OrderBean> list = orderMgr.getOrder(id);
	
	if(list.size() == 0){
	%>
		<tr><td colspan="5">주문한 상품이 없습니다.</td></tr>
	<%
	}else{
		for(OrderBean ord:list){
			ProductBean product = productMgr.getProduct(ord.getProduct_no());
	%>
		<tr style="text-align:center;">
		<td><%=ord.getNo() %></td>
		<td><%=product.getName() %></td>
		<td><%=ord.getQuantity() %></td>
		<td><%=ord.getSdate().substring(0,10) %></td>
		<td>
		<%
		switch(ord.getState()){
		case "1":out.println("접수"); break;
		case "2":out.println("입금확인"); break;
		case "3":out.println("배송준비"); break;
		case "4":out.println("배송중"); break;
		case "5":out.println("처리완료"); break;
		default:out.println("접수중");
		}
		 %>
		</td>
				
		</tr>	
	<%
		}
	}
	
	%>	
</table>
<%@ include file ="guest_bottom.jsp" %>
</body>
</html>