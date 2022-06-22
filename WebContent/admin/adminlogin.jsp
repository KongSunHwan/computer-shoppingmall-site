<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<!-- 부트스트랩 css파일 참조 -->
    <link rel="stylesheet" href="../css/bootstrap.css">

    <!-- jquery 파일 참조 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- 부트스트랩 js파일 참조 -->
    <script src="../js/bootstrap.js"></script>

    <!-- 개인 커스텀 디자인 -->
    <link rel="stylesheet" href="../css/style-computer.css">
    <link rel="stylesheet" href="../css/form_join.css">
<!-- <link rel="stylesheet" type="text/css" href="../css/board.css"> -->
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	document.getElementById("btnAdminlogin").onclick = func1AdminLogin;
	document.getElementById("btnAdminHome").onclick = func1AdminHome;
}

</script>
</head>
<body>
<!-- <form action="admin_loginproc.jsp" name="adminloginform" method="post">
<table>
	<tr>
		<td colspan="2" style="text-align: left;">
		<br>** 관리자 로그인 **<br>
		</td>	
	</tr>
	<tr>
		<td> 관리자 ID: <input type="text" name="adminid"></td>
	</tr>
	<tr>
		<td> 관리자 비밀번호: <input type="text" name="adminpasswd"></td>
	</tr>
	<tr>
		<td colspan="2" style="text-align:left;">
		<input type="button" value="로그인 수행" id="btnAdminlogin">
		<input type="button" value="메인페이지" id="btnAdminHome">
	</tr>
</table> -->
</form>

 <section>
     <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="titlebox">
                        관리자 로그인
                    </div>
                </div>
                <div class="col-xs-12 login-form">
                    <div class="col-md-6"> <!--img-->
                        <img src="../img/kongcomlogo.png" alt="로고">
                    </div>
                    <div class="col-md-6"> <!--form-->
                        <form class="login-form-inner" action="admin_loginproc.jsp" name="adminloginform" method="post">
                            <div class="form-group">
                                <label>아이디</label>
                                <input type="text"class="form-control" placeholder="아이디"  name="adminid">
                            </div>

                            <div class="form-group">
                                <label>비밀번호</label>
                                <input type="password" class="form-control" placeholder="비밀번호" name="adminpasswd">
                            </div>

                            <button type="button" class="btn btn-info btn-block" id="btnAdminlogin">로그인</button>
                            <button type="button" class="btn btn-primary btn-block" id="btnAdminHome">메인페이지</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </section>

</body>
</html>