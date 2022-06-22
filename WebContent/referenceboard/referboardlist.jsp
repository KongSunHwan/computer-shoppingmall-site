<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="fileupload.MyfileDAO"%>
<%@ page import="fileupload.MyfileDTO"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style-computer.css">
    <link rel="stylesheet" href="../css/bootstrap.css">

    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
    <script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!--폰트어섬추가 -->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!--폰트어섬추가 -->
    <script src="../js/script.js"></script>
<title>자료실</title>
</head>
<body>
 <%
    MyfileDAO dao = new MyfileDAO();
    List<MyfileDTO> fileLists = dao.myFileList();
    /* dao.close(); */
    %>
 <div class="container">
 <%@ include file="../Main/guest_top.jsp" %>
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
                    <a class="navbar-brand" href="../Main/guest_index.jsp" id="index">
                        <img src="../img/pc_logo.png" style="width:40px;" alt="logo">
                    </a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav" style="margin-top: 10px;">
                        <li class="active"><a href="../Main/guest_index.jsp">메인페이지</a></li>
                        <li><a href="../Main/productlist.jsp">전체 상품보기</a></li>
                        <li><a href="../board/boardlist.jsp">커뮤니티</a></li>
                        <li><a href="referboardlist.jsp">자료실</a></li>
                    </ul>

                    <!-- 우측 회원 메뉴 -->
                    <ul class="nav navbar-nav navbar-right" style="margin-top: 10px;">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%=memid%><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="../member/register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                <li><a href="../Main/guest_mypage.jsp"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
                                <li><a href="../Main/cartlist.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
                                <li><a href="../Main/orderlist.jsp"><span class="glyphicon glyphicon-list-alt"></span> 주문목록</a></li>
                                <% if (memid == null) { %>
           				 		<li><a href="../Main/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        						<% } else { %>
           					 	<li><a href="../Main/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        						<% } %>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header> 
            <div class="container-fluid" style="margin-top: 100px;">
                <div class="navbar-header">
                    <!-- 오른쪽 메뉴바 -->
                    <button type="button" class="collapsed navbar-toggle" data-toggle="collapse" data-target="#nav_menu" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span> 
                        <span class="icon-bar"></span> 
                        <span class="icon-bar"></span>
                    </button>
                </div>
                </div>
                 <h2 style="text-align:center;">자료실</h2>
                <hr>
                <!-- 검색폼 --> 
    					<form class="navbar-form navbar-right" method="get">
    					<select class="selectpicker" name="searchField" style="width: 50px; height: 30px; text-align:center;"> 
                		<option value="title">제목</option> 
                		<option value="content">내용</option>
           				</select>
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Search" name="searchWord"/>
                            <div class="input-group-btn">
                                <button class="btn btn-default" type="submit">
                                <i class="glyphicon glyphicon-search" style="height: 20px;"></i>
                                </button>
                            </div>
                        </div>
                    </form>
                <div class="col-sm-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    자료실 목록
                </div>
                <div class="panel-body">
                    <a href="">사진(미구현)</a><br />
                    <a href="">문서(미구현)</a><br />
                </div>
            </div>
        </div> 

        <div class="col-sm-10">
            <table class="table table-bordered table-hover">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>첨부파일</th>
                </tr>
                 <% for (MyfileDTO f : fileLists){ %>
                <tr>
                    <td><%=f.getIdx() %></td>
                    <td><%=f.getTitle() %></td>
                    <td><%=f.getName() %></td>
                    <td><%=f.getPostdate() %></td>
                    <td>
                         <a href="Download.jsp?oName=<%=URLEncoder.encode(f.getOfile(),"UTF-8") %>&sName=<%=URLEncoder.encode(f.getSfile(),"UTF-8") %>" class="btn btn-danger" style="width: 100px;">다운로드</a>
                    </td>
                </tr>
                <% } %>
            </table>

            <nav class="text-center">
                <ul class="pagination">
                    <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                    </li>
                    <li class=active><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                    </li>
                </ul>
            </nav>
            <a href="fileuploadMain.jsp" class="btn btn-default">파일 업로드</a>
        </div>
    </div>
    <!-- <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-7 col-sm-12"> 왼쪽 영역
                    <div class="copyright">
                        <a href="../Main/guest_index.jsp"><img src="../img/pc_logo.png" alt="logo" style="width: 30px;"></a>
                        <div class="top">
                            공컴 홈페이지 |  대표자 : 공선환 | E-MAIL : tjsghks78@gmail.com <br>
                        </div>
                        <div class="bottom">
                            개인정보보호책임자 : 공선환 | 공컴 홈페이지입니다.<br>
                            주소 : 대한민국 <br>
                            <address>@KongCom. ALL RIGHTS RESERVED</address>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-sm-12"> 오른쪽 영역
                    <ul class="footer-menu">
                        <li><a href="../admin/admin_index.jsp">관리자 메뉴</a></li>
                        <li><a href="#">유용한정보</a></li>
                        <li><a href="#">개인정보취급방침</a></li>
                        <li><a href="#">QNA</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer> -->
</body>
</html>