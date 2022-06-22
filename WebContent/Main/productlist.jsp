<%@page import="pack.product.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="productMgr" class="pack.product.ProductMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품목록</title>
 <!-- 부트스트랩 css파일 참조 -->
    <link rel="stylesheet" href="../css/bootstrap.css">

    <!-- jquery 파일 참조 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- 부트스트랩 js파일 참조 -->
    <script src="../js/bootstrap.js"></script>

    <!-- 개인 커스텀 디자인 -->
    <link rel="stylesheet" href="../css/style-computer.css">
    <link rel="stylesheet" href="../css/board.css">
    
<!-- <link href="../css/style.css" rel="stylesheet" type="text/css"> -->
<script src="../js/script.js">

</script>
</head>
<body>
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
    
 <section>
        <div class="container">
            <h3>컴퓨터 상품리스트</h3>
            <hr>
            <div class="row">
             </div> <!-- row -->
            <%
			ArrayList<ProductBean> list = productMgr.getProductAll();
	
			for(ProductBean p: list){
			%>
                <div class="col-md-3 col-sm-6">
                    <div class="prod-list"> <!--부모 영역-->
                        <div class="prod-img" onclick="javascript:productDetail_guest('<%=p.getNo()%>')"> <!--이미지 영역-->
                            <img src="../data/<%=p.getImage()%>" width="800px;" hight="895px;" >
                        </div>
                        <div class="prod-content"> <!--부모영역-->
                            <div class="info"><!--left-->
                                <span><%=p.getName()%></span>
                                <span>수량 : <b><%=p.getStock() %></b> 개</span>
                            </div>
                            <div class="price"> <!--right-->
                                <strong>가격 : <%=p.getPrice() %></strong>
                            </div>
                        </div>
                    </div>
                </div>
                <%	
				}
				%>
				<!-- pagination -->
                <div class="text-center" style="clear: left;"> <!--부트스트랩의 text-align 기능-->
                    <ul class="pagination">
                        <li class="previous"><a href="#">Previous</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li class="next"><a href="#">Next</a></li>
                      </ul>
                </div>
                </div> <!-- container -->
</section>

<%@include file="guest_bottom.jsp" %>

<form action="productdetail_guest.jsp" name="detailFrm" method="post">
	<input type="hidden" name="no">
</form>
</body>
</html>















