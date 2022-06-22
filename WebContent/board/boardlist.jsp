<%@page import="pack.board.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardMgr" class="pack.board.BoardMgr"/>
<jsp:useBean id="dto" class="pack.board.BoardDto"/>
<%
int pageSu, spage = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
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
<!-- <link rel="stylesheet" type="text/css" href="../css/board.css"> -->
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){ //jquery로 써도 됨
	document.getElementById("btnSearch").onclick = function(){
		if(frm.sword.value == ""){
			frm.sword.focus();
			alert("검색어를 입력하시오");
			return;
		}
		frm.submit(); //53줄로 전송되어서 날아감
}
}
</script>
</head>
<body>
<h2 style="text-align:center;">자유게시판</h2>
<hr>
		<!-- [<a href="#" onclick="window.open('admin.jsp', '','width=300,height=200,top=200,left=300')">관리자용</a>] -->
		<!-- header -->
		<%@ include file="../Main/guest_top.jsp" %>
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
                        <li><a href="boardlist.jsp">커뮤니티</a></li>
                        <li><a href="../referenceboard/referboardlist.jsp">자료실</a></li>
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
		<form class="navbar-form navbar-center" action="boardlist.jsp" name="frm" method="post" style="text-align:center;">
			<select name="stype" class="selectpicker" style="width: 70px; height: 30px; text-align:center;">
			<option value="title" selected="seleted">글 제목</option>
			<option value="name">작성자</option>
			</select>
			<div class="input-group">
			<input type="text" class="form-control" placeholder="Search" name="sword">
			<div class="input-group-btn">
			<button type="button"  class="btn btn-default"value="검색" id="btnSearch">
			<i class="glyphicon glyphicon-search"></i>
			</button>
			</div>
           </div>
		</form>
		 <div class="col-sm-1">
            <div class="panel panel-default">
                <div class="panel-heading">
                    게시판<br>
                    목록
                </div>
                <div class="panel-body" style="height:100px;">
                    <a href="">공지사항</a><br />(미구현)
                    <!-- <a href="List.jsp">자유<br>게시판</a><br /> -->
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
			<th>조회수</th>
		</tr>
		<%
		request.setCharacterEncoding("utf-8");
		try{
			spage = Integer.parseInt(request.getParameter("page"));
			
		}catch(Exception e){
			spage = 1;
		}
		if(spage <=0) spage = 1;
		
		String stype = request.getParameter("stype"); //검색인 경우
		String sword = request.getParameter("sword"); //검색인 경우
		
		boardMgr.totalList(); //전체 레코드 수 처리
		pageSu = boardMgr.getPageSu();
		//out.println("전체 페이지 수 : " + pageSu);
		
		ArrayList<BoardDto> list = boardMgr.getDataAll(spage, stype, sword);
		for(int i = 0; i < list.size(); i++){
			dto = (BoardDto)list.get(i);
			// 댓글 들여쓰기 작업
			int nest = dto.getNested();
			String gong = " ";
			for(int j=0; j < nest; j++){
				gong += "&nbsp;&nbsp;&nbsp;";
			}
			// -----------------
		%>
		<tr>
			<td><%=dto.getNum() %></td>
			<td>
			<%=gong %><a href="boardcontent.jsp?num=<%=dto.getNum() %>&page=<%=spage%>"><%=dto.getTitle() %></a>
			<!-- <td><%=dto.getTitle() %></td> -->
			<td><%=dto.getName() %></td>
			<td><%=dto.getBdate() %></td>
			<td>&nbsp;<%=dto.getReadcnt() %></td>
		</tr>
		<%	
		}
		%>
		</table>
		<br>
		<nav class="text-center">
                <ul class="pagination">
                    
		<%
		for(int i= 1; i<= pageSu; i++){
			if(i == spage){
				out.print("<li class=active><a href='boardlist.jsp?page=" + i + "'>" + i + "</a></li>");
			}else{
				out.print("<li><a href='boardlist.jsp?page=" + i + "' >" + i + "</a></li>");
			}
		}
		%>
		</li>
        </ul>
      </nav>
		<button type="button" class="btn btn-default" onclick="location.href='boardlist.jsp?page=1'" style="margin-top:-50px;">최근목록</button>
		<button type="button" class="btn btn-default" onclick="location.href='boardwrite.jsp'" style="margin-top:-50px;">작성하기</button>
		</td>
	</tr>
</table>
<%-- <%@ include file="../Main/guest_bottom.jsp" %> --%>
</body>
</html>