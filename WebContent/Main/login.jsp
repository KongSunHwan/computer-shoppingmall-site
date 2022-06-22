<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = (String)session.getAttribute("idKey"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<!-- 부트스트랩 css파일 참조 -->
    <link rel="stylesheet" href="../css/bootstrap.css">

    <!-- jquery 파일 참조 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- 부트스트랩 js파일 참조 -->
    <script src="../js/bootstrap.js"></script>

    <!-- 개인 커스텀 디자인 -->
    <link rel="stylesheet" href="../css/style-computer.css">
    <link rel="stylesheet" href="../css/form_join.css">
	<!-- <link href="../css/style.css" rel="stylesheet" type="text/css"> -->
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	// 아래건 오류 발생(다만 무시 가능) : Uncaught TypeError: Cannot read property 'addEventListener' of null
	//document.getElementById("btnLogin").addEventListener("click", funcLogin, false);
	//document.getElementById("btnNewMember").addEventListener("click", funcNew, false);
	
	var btn1 = document.getElementById("btnLogin");
	if(btn1){
		btn1.addEventListener("click", funcLogin, false);	
	}
	
	var btn2 = document.getElementById("btnNewMember");
	if(btn2){
		btn2.addEventListener("click", funcNew, false);	
	}
	
	
	
}

function funcLogin(){
	if(loginForm.id.value === ""){
		alert("아이디를 입력해주세요.");
		loginForm.id.focus();
	}else{if(loginForm.passwd.value === ""){
		alert("비밀번호를 입력해주세요.");
		loginForm.passwd.focus();
		
	}else{
		loginForm.action ="loginproc.jsp";
		loginForm.method="post";
		loginForm.submit();
	}	
	}
}

function funcNew(){
	location.href="../member/register.jsp";
}

</script>
</head>
<body>
<%
if(id !=null){ // 로그인 된 상태
%>
	<%-- <b><%=id %></b>님 환영합니다<p/>
	준비된 기능을 사용할 수 있습니다.
	<a href="logout.jsp">로그아웃</a> --%>
	<% response.sendRedirect("guest_index.jsp"); %>
<%}else{%>
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
                </div>
            </div>
        </nav>
    </header>
    
    <section>
     <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="titlebox">
                        로그인
                    </div>
                </div>
                <div class="col-xs-12 login-form">
                    <div class="col-md-6"> <!--img-->
                        <img src="../img/kongcomlogo.png" alt="로고">
                    </div>
                    <div class="col-md-6"> <!--form-->
                        <form class="login-form-inner" name="loginForm">
                            <div class="form-group">
                                <label>아이디</label>
                                <input type="text"class="form-control" placeholder="아이디"  name="id">
                            </div>

                            <div class="form-group">
                                <label>비밀번호</label>
                                <input type="password" class="form-control" placeholder="비밀번호" name="passwd">
                            </div>

                            <button type="button" class="btn btn-info btn-block" id="btnLogin">로그인</button>
                            <button type="button" class="btn btn-primary btn-block" id="btnNewMember">회원가입</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </section>
         <!-- footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-7 col-sm-12"> <!--왼쪽 영역-->
                    <div class="copyright">
                        <a href="guest_intdex.jsp"><img src="../img/pc_logo.png" alt="logo" style="width: 30px;"></a>
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
                <div class="col-md-5 col-sm-12"> <!--오른쪽 영역-->
                    <ul class="footer-menu">
                        <li><a href="#">고객센터</a></li>
                        <li><a href="#">유용한정보</a></li>
                        <li><a href="#">개인정보취급방침</a></li>
                        <li><a href="#">QNA</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
<%	
}
%>

</body>
</html>
