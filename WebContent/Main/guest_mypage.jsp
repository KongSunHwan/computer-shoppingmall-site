<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String id = (String)session.getAttribute("idKey"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 부트스트랩 css파일 참조 -->
    <link rel="stylesheet" href="../css/bootstrap.css">

    <!-- jquery 파일 참조 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- 부트스트랩 js파일 참조 -->
    <script src="../js/bootstrap.js"></script>

    <!-- 개인 커스텀 디자인 -->
    <link rel="stylesheet" href="../css/style-cat.css">
    <link rel="stylesheet" href="../css/form_join.css">
    <link rel="stylesheet" href="../css/tab.css">
    <link rel="stylesheet" href="../css/mypage.css">
    <!-- 개인 커스텀 디자인 -->
    <link rel="stylesheet" href="../css/style-computer.css">
<!-- <link href="../css/style.css" rel="stylesheet" type="text/css"> -->
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function() {
	document.getElementById("btnUpdateOkAdmin").onclick = memberUpdateAdmin;
	document.getElementById("btnUpdateCancelAdmin").onclick = memberUpdateCancelAdmin;
	
}

</script>
<title>마이 페이지</title>
</head>
<%@ include file="guest_top.jsp" %>
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
<body>
 <!-- 탭 스타일은 bootstrap.js와 jquery가 반드시 필요하다 -->
    <section>
        <div class="container">
            <div class="row">
                <div class="titlebox">
                 마이페이지(미구현)
                </div>
                <div class="col-xs-12">
                    <ul class="nav nav-tabs tabs-basic">
                      <li class="active"><a data-toggle="tab" href="#home">내 정보 관리</a></li>
                      <li><a data-toggle="tab" href="#menu1">Menu 2</a></li>
                      <li><a data-toggle="tab" href="#menu2">Menu 3</a></li>
                      <li><a data-toggle="tab" href="#menu3">Menu 4</a></li>
                    </ul>
                  
                    <div class="tab-content">
                      <div id="home" class="tab-pane fade in active">
                        
                        <p><b> 회원님의 정보를 수정합니다.</b></p>
                        
                        <form action="memberupdateproc_admin.jsp" name="updateFormAdmin" method="post">
                            <table class="table"> <!-- 부트스트랩 반응형 기본 테이블-->
                                <tbody class="m-control">
                                    <tr>
                                     <td class="m-title">아이디<span class="essential"> *</span></td>
                                     <td>
                                        <input type="hidden" name="id" class="form-control add" value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">비밀번호<span class="essential"> *</span></td>
                                        <td>
                                        <input type="password"  class="form-control add" name="passwd" value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">이름<span class="essential"> *</span></td>
                                        <td>
                                            <input type="text" name="name" class="form-control add" value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">이메일<span class="essential"> *</span></td>
                                        <td>
                                            <input type="text" name="email" class="form-control add"  value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">전화번호<span class="essential"> *</span></td>
                                        <td>
                                            <input type="text" name="phone" class="form-control add" value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>우편번호<span class="essential"> *</span></td>
                                        <td>
                                        <input type="text" class="form-control" name="zipcode" value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>상세주소<span class="essential"> *</span></td>
                                        <td>
                                        <input type="text" class="form-control" name="address" value="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">직업<span class="essential"> *</span></td>
                                        <td>
                                            <select class="form-control sel" name="job">
                                                <option value="">선택</option>
												<option value="회사원">회사원</option>
												<option value="학생">학생</option>
												<option value="자영업">자영업</option>
												<option value="주부">주부</option>
												<option value="기타">기타</option>
                                            </select>      
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="title-btn">
                                <button type="button" class="btn" id="btnUpdateOkAdmin">수정</button>
                                <button type="button" class="btn" id="btnUpdateCancelAdmin">취소</button>
                            </div>

                        </form>
                      
                    </div>
                      <div id="menu1" class="tab-pane fade">
                        
                      </div>
                      <div id="menu2" class="tab-pane fade">
                        
                      </div>
                      <div id="menu3" class="tab-pane fade">
                        
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <%@ include file="guest_bottom.jsp" %>	
</body>
</html>