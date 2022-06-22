<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String id = (String)session.getAttribute("idKey"); %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<!-- 다음 주소 API 가져옴 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- 부트스트랩 css파일 참조 -->
    <link rel="stylesheet" href="../css/bootstrap.css">

    <!-- jquery 파일 참조 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- 부트스트랩 js파일 참조 -->
    <script src="../js/bootstrap.js"></script>

    <!-- 개인 커스텀 디자인 -->
    <link rel="stylesheet" href="../css/style-computer.css">
    <link rel="stylesheet" href="../css/form_join.css">

 <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
 <link href="../css/style.css" rel="stylesheet" type="text/css"> -->
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function(){
	regForm.id.focus();
	document.getElementById("btnZip").onclick = zipCheck;
	document.getElementById("btnId").onclick = idCheck;
	document.getElementById("btnSubmit").onclick = inputCheck;
}

/*  window.addEventListener('load', () => {
	  const forms = document.getElementsByClassName('validation-form');

	  Array.prototype.filter.call(forms, (form) => {
	    form.addEventListener('submit', function (event) {
	      if (form.checkValidity() === false) {
	        event.preventDefault();
	        event.stopPropagation();
	      }

	      form.classList.add('was-validated');
	    }, false);
	  });
	}, false);
function findAddr(){
	new daum.Postcode({
      oncomplete: function(data) {
      	
      	console.log(data);
      	
          // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
          // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
          // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
          var roadAddr = data.roadAddress; // 도로명 주소 변수
          var jibunAddr = data.jibunAddress; // 지번 주소 변수
          // 우편번호와 주소 정보를 해당 필드에 넣는다.
          document.getElementById('member_post').value = data.zonecode;
          if(roadAddr !== ''){
              document.getElementById("member_addr").value = roadAddr;
          } 
          else if(jibunAddr !== ''){
              document.getElementById("member_addr").value = jibunAddr;
          }
      }
  }).open();
}  */
</script>
</head>
<body>
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
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="../Main/guest_index.jsp">메인페이지</a></li>
                        <li><a href="../Main/productlist.jsp">전체 상품보기</a></li>
                        <li><a href="../board/boardlist.jsp">커뮤니티</a></li>
                        <li><a href="../referenceboard/referboardlist.jsp">자료실</a></li>
                    </ul>

                    <!-- 우측 회원 메뉴 -->
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%=id%><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                <li><a href="../Main/guest_mypage.jsp"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
                                 <li><a href="../Main/cartlist.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
                                <li><a href="../Main/orderlist.jsp"><span class="glyphicon glyphicon-list-alt"></span> 주문목록</a></li>
                                <% if (id == null) { %>
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
    
<section>
        <div class="container" valign="middle">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-8 join-form">

                    <div class="titlebox">회원가입</div>

                    <form name="regForm" method="post" action="registerproc.jsp">
                        <div class="form-group">
                            <label>아이디</label>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="영어와 숫자를 포함한 4~12글자로 작성하세요" name="id" required>
          	                     <div class="input-group-btn">
                                    <button class="btn btn-primary" type="button" id="btnId">아이디 중복체크</button>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>비밀번호</label>
                            <input type="password" class="form-control" placeholder="영어 소문자와 대문자, 숫자를 포함해 8~16글자로 작성하세요" name="passwd" required>
                        </div>

                        <div class="form-group">
                            <label>비밀번호 확인</label>
                            <input type="password" class="form-control" placeholder="영어 소문자와 대문자, 숫자를 포함해 8~16글자로 작성하세요" name="repasswd" required>
                        </div>

                        <div class="form-group">
                            <label>이름</label>
                            <input type="text" class="form-control" placeholder="이름을 입력하세요" name="name" required>
                        </div>
                        
						<div class="form-group">
                            <label>이메일</label>
                            <input type="text" class="form-control" placeholder="이메일을 입력하세요" name="email" required>
                        </div>
                        
                        <div class="form-group">
                            <label>휴대폰 번호</label>
                            <input type="text" class="form-control" placeholder="'-'를 제외한 숫자를 입력하세요" name="phone" required>
                        </div>

                        <div class="form-group">
                            <label>기본 주소</label>
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="우편번호" name="zipcode" id="member_post"  readonly>
                                <div class="input-group-btn">
                                    <button class="btn btn-primary" type="button" id="btnZip">주소찾기</button>  <!-- onclick="findAddr()" -->
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>상세 주소</label>
                            <input type="text" class="form-control" placeholder="기본 주소" name="address" id="member_addr" required>
                        </div>
                        
                        <div class="form-group">
                            <label>직업</label>
                            <select name=job>
							<option value="0">선택하세요
							<option value="회사원">회사원
							<option value="학생">학생
							<option value="자영업">자영업
							<option value="주부">주부
							<option value="기타">기타
						</select>
                        </div>

                        <button type=button class="btn btn-primary btn-block" id="btnSubmit">가입하기</button>
                        <button type="button" class="btn btn-info btn-block" onclick="location.href='../Main/login.jsp';">로그인하기</button>

                    </form>
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
                <div class="col-md-5 col-sm-12"> <!--오른쪽 영역-->
                    <ul class="footer-menu">
                        <li><a href="../admin/admin_index.jsp">관리자메뉴</a></li>
                        <li><a href="">유용한정보</a></li>
                        <li><a href="">개인정보취급방침</a></li>
                        <li><a href="">QNA</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>