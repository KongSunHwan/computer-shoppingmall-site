<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String adminid = (String)session.getAttribute("adminKey");
if(adminid == null){
	response.sendRedirect("adminlogin.jsp");
	return;
}
%>
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
                    <a class="navbar-brand" href="admin_index.jsp" id="index">
                        <img src="../img/pc_logo.png" style="width:40px;" alt="logo">
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="admin_index.jsp">메인페이지</a></li>
                        <li><a href="../admin/membermanager.jsp">회원 관리</a></li>
                        <li><a href="productmanager.jsp">상품 관리</a></li>
                        <li><a href="ordermanager.jsp">주문 관리</a></li>
                        <li><a href="adminlogout.jsp">로그아웃</a></li>
                    </ul>

                    <!-- 우측 회원 메뉴 -->
                    <%-- <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%=memid%><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="JoinForm.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                <li><a href="mypage.html"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
                                <li><a href="../Shopping/Order_Details.jsp"><span class="glyphicon glyphicon-list-alt"></span> 주문목록</a></li>
                                <% if (memid == null) { %>
           				 		<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        						<% } else { %>
           					 	<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        						<% } %>
                            </ul>
                        </li>
                    </ul> --%>
                </div>
            </div>
        </nav>
    </header> 

