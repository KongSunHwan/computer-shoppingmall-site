<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <script>
    function validateForm(form) { 
    	/* if (form.id.value == "") {
            alert("게시판 번호를 입력하세요.");
            form.name.focus();
            return false;
        } */
        if (form.name.value == "") {
            alert("작성자를 입력하세요.");
            form.name.focus();
            return false;
        }
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.attachedFile.value == "") {
            alert("첨부파일은 필수 입력입니다.");
            return false;
        }
    }
</script>
<title>파일 업로드 하기</title>
</head>
<body>
<div class="container" role="main" style="margin-top: 10px;">
            <h2>자료실 작성하기</h2>
            <hr>
            <span style="color: red;"><%-- ${errorMessage } --%></span>
            <form name="fileForm" method="post"  enctype="multipart/form-data" action="UploadProcess.jsp" onsubmit="return validateForm(this);">
             <!-- <div class="mb-3"> <label for="title">게시판 번호</label> <input type="text" class="form-control" name="id" placeholder="게시판 번호를 입력해 주세요"> </div> -->
                <div class="mb-3"> <label for="title">작성자</label> <input type="text" class="form-control" name="name" placeholder="작성자를 입력해 주세요"> </div>
                <div class="mb-3"> <label for="reg_id">제목</label> <input type="text" class="form-control" name="title" placeholder="제목을 입력해 주세요"> </div>
                <div class="mb-3"> <label for="content">내용</label> <textarea class="form-control" rows="5"
                        name="content" id="content" placeholder="내용을 입력해 주세요"></textarea> </div>
                <div class="mb-3"> <input type="file" name="attachedFile"></div>
            <div> <button type="submit" class="btn btn-sm btn-primary">저장</button> 
                <button type="button"class="btn btn-sm btn-primary" onclick="location.href='referboardlist.jsp';">목록</button> </div>
        </div>
         </form>
</body>
</html>