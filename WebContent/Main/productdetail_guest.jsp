<%@page import="pack.product.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="productMgr" class="pack.product.ProductMgr" />

<%
String no = request.getParameter("no");
ProductBean bean = productMgr.getProduct(no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<!-- 구글 폰트 가져옴 -->
     <!-- 부트스트랩 css파일 참조 -->
        <link rel="stylesheet" href="../css/bootstrap.css">

        <!-- jquery 파일 참조 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
        <!-- 부트스트랩 js파일 참조 -->
        <script src="../js/bootstrap.js"></script>
    
        <!-- 개인 커스텀 디자인 -->
        <link rel="stylesheet" href="../css/style-computer.css">
        <link rel="stylesheet" href="../css/board_detail.css">
<!-- <link href="../css/style.css" rel="stylesheet" type="text/css"> -->
<script src="../js/script.js">

</script>
</head>
<body>
<h2>** 상품 상세보기 **</h2>
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
                        <li><a href="../fileUploads/FileList.jsp">자료실</a></li>
                    </ul>

                    <!-- 우측 회원 메뉴 -->
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%=memid%><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="JoinForm.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
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
<!--section-->
        <section>
        <form action="cartproc.jsp">
            <div class="container">
                <div class="row"  style="margin-bottom: 30px;">
                    <div class="col-xs-12">
                        <h2>상세보기<small></small></h2>
                        <hr>
                    </div>
                    <div class="col-sm-12 col-md-6"> <!--이미지 영역-->
                        <img src="../img/pc_one.jpg">
                    </div>
                    <div class="col-sm-12 col-md-6"> <!-- 본문 영역-->
                        <div class="detail-info">
                            <p class="title">[<%=bean.getNo() %>] <%=bean.getName() %></p>
                            <p class="price"><strong><%=bean.getPrice() %>원</strong></p>
                            <p class="delivery">
                                무료배송<br>
                                상품별배송 ㅣ 택배배송 ㅣ당일출고, 12시 이전 결제 건까지 해당 (주말, 공휴일 제외)<br>
                                <%=bean.getDetail() %><br>
                              <b>등록일 : <%=bean.getSdate().substring(0,10) %></b>
                            </p>
                        </div>
                        <div class="detail-control">
                            <div class="price">
                                <p class="left">총 재고량</p>
                                <p class="right">
                                    <strong><%=bean.getStock() %>개</strong>
                                </p>
                            </div>
                            <div class="detail-control">
                            <div class="price">
                                <p class="left">주문 수량</p>
                                <p class="right">
                                    <input type="text" name="quantity" value="1" size="5" style="text-align: center;">
                                </p>
                            </div>
                        <div class="detail-control">
                            <div class="price">
                                <p class="left">총 상품금액</p>
                                <p class="right">
                                    <strong><%=bean.getPrice() %>원</strong>
                                </p>
                            </div>
                            <div class="order">
                            	<input type="hidden" name="product_no" value="<%=bean.getNo() %>">
                                <button type="submit" class="left btn btn-default">장바구니</button> 
                                <button type="button" class="right btn btn-primary" onclick="location.href='Order_Page.jsp';">구매하기</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            </form>
        </section>

        <section style="margin-top: 10px;">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12">
                        <form class="reply-wrap"> <!-- 댓글 작성 영역-->
                            <div class="reply-image"> <!--position으로!-->
                                <img src="../img/profile.png">
                            </div>
                            <div class="reply-content"> <!--transition 사용해 마우스 올라가면 넓어지게-->
                                <textarea class="form-control" rows="3"></textarea>
                                <div class="reply-group">
                                    <div class="left">
                                        <input type="text" class="form-control" placeholder="이름">
                                        <input type="password" class="form-control" placeholder="비밀번호">
                                    </div>
                                    <button class="right btn btn-info">등록하기</button>
                                </div>
                            </div>
                        </form>
                        <div class="reply-wrap" style="margin-bottom: 20px;"> <!-- 댓글 영역-->
                            <div class="reply-image">
                                <img src="../img/profile.png">
                            </div>
                            <div class="reply-content">
                                <div class="reply-group">
                                    <strong class="left">kongcom</strong>
                                    <small>2022/05/25</small>
                                    <a href="#" class="right"><span class="glyphicon glyphicon-pencil">수정</span></a>
                                    <a href="#" class="right"><span class="glyphicon glyphicon-remove">삭제</span></a>
                                </div>
                                <p>여기에 리뷰 쓰면됩니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
 
<%@include file="guest_bottom.jsp" %>
</body>
</html>
















