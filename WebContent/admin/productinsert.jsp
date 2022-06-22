<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가</title>
<!-- <link rel="stylesheet" type="text/css" href="../css/board.css"> -->
<!-- 구글 폰트 가져옴 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <!-- 부트스트랩 css파일 참조 -->
    <link rel="stylesheet" href="../css/bootstrap.css">

    <!-- jquery 파일 참조 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- 부트스트랩 js파일 참조 -->
    <script src="../js/bootstrap.js"></script>

    <!-- 개인 커스텀 디자인 -->
    <link rel="stylesheet" href="../css/style-computer.css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function() {
	document.getElementById("btnInsert").onclick = function(){
		//입력 자료 검사는 생략됨
		document.productInsForm.submit();
	}	
}

</script>
</head>
<body>
<%@ include file="admin_top.jsp" %>
<h2></h2>
<br>
<form action="productprocess_control.jsp?flag=insert" method="post"
		 name="productInsForm" enctype="multipart/form-data"> <!-- enctype : 대용량 파일 전송시 필요 -->
<table class="table table-striped table-bordered table-hover">
	<tr>
		<h2>상품 등록</h2>
	</tr>
	<tr>
		<td>상품명</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>가격</td>
		<td><input type="text" name="price"></td>
	</tr>
	<tr>
		<td>상품 설명</td>
		<td><textarea rows="5" cols="60" name="detail"></textarea></td>
	</tr>
	<tr>
		<td>재고수량</td>
		<td><input type="text" name="stock"></td>
	</tr>
	<tr>
		<td>상품 이미지 등록</td>
		<td><input type="file" name="image"></td>
	</tr>
	<tr>
		<td colspan="2">
		<br>
			<input type="button" class="btn btn-default" value="상품등록" id="btnInsert">
			<input type="reset" class="btn btn-default" value="새로 입력">
		</td>
	</tr>
</table>
</form>
<%@ include file="admin_bottom.jsp" %>
</body>
</html>