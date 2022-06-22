<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script>
function check(){
	if(frm.name.value==""){
		alert("이름을 입력하세요");
		frm.name.focus();
	}else if(frm.pass.value ==""){
		alert("비밀번호를 입력하세요");
		frm.pass.focus();
	}else if(frm.mail.value ==""){
		alert("이메일을 입력하세요");
		frm.mail.focus();
	}else if(frm.title.value ==""){
		alert("제목을 입력하세요");
		frm.title.focus();
	}else if(frm.cont.value ==""){
		alert("내용을 입력하세요");
		frm.cont.focus();
	}else
		frm.submit();
}
</script>
</head>
<body>
<div class="container" role="main">
<h2 style="text-align:center;">게시판 작성하기</h2>
<hr>
<form name="frm" method="post" action="boardsave.jsp">
						<div class="mb-3"> 
						<label for="title">이름</label> 
						<input type="text" class="form-control" name="name" placeholder="이름을 입력해 주세요"> 
                        </div>
            
                		<div class="mb-3"> 
                		<label for="title">암호</label> <input type="text" class="form-control" name="pass"placeholder="암호를 입력해 주세요"> 
                        </div>
                        
                        <div class="mb-3"> 
                		<label for="title">이메일</label> <input type="text" class="form-control" name="mail" placeholder="이메일을 입력해 주세요"> 
                        </div>
                        
                        <div class="mb-3"> 
                		<label for="title">제목</label> <input type="text" class="form-control" name="title"  placeholder="제목을 입력해 주세요"> 
                        </div>
                        
                        <div class="mb-3">
                        <label for="content">내용</label> 
                        <textarea class="form-control" rows="5" name="cont" placeholder="내용을 입력해 주세요"></textarea> 
                        </div>
                        <div> 
                <button type="button" class="btn btn-sm btn-primary" onClick="check()">작성</button> 
                <button type="reset" class="btn btn-sm btn-primary">다시 입력</button> 
                <button type="button" class="btn btn-sm btn-primary" onclick="location.href='boardlist.jsp?page=1';">목록</button> 
            </div>
            </form>
	</div>          
</body>
</html>