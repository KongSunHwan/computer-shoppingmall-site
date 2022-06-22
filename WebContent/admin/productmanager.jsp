<%@page import="pack.product.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productMgr" class="pack.product.ProductMgr"/>

<!-- 파일 업로드 된걸 이클립스에서 확인하고 싶다면 메뉴 Window > Preference 선택 후
	General > Workspace > Refresh using native hooks or polling 체크 -->
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>상품 관리</title>
<!-- <link rel="stylesheet" type="text/css" href="../css/board.css"> -->
<script src="../js/script.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<h2> ** 전체 상품 목록 - 관리자 화면 **</h2>
<%@ include file ="admin_top.jsp" %>
<table class="table table-striped table-bordered table-hover">
	<tr style="text-align:center;">
		<th style="text-align:center;">번호</th>
		<th style="text-align:center;">상품명</th>
		<th style="text-align:center;">가격</th>
		<th style="text-align:center;">등록일</th>
		<th style="text-align:center;">재고량</th>
		<th style="text-align:center;">상세보기</th>
	</tr>
	<%
	ArrayList<ProductBean> list = productMgr.getProductAll();
	if(list.size() == 0){
	%>
	<tr><td colspan="6">등록된 상품이 없습니다</td></tr>
	<%
	}else{
		for(ProductBean p:list){
	%>
		<tr style ="text-align:center;">
			<td><%=p.getNo() %></td>
			<td><%=p.getName() %></td>
			<td><%=p.getPrice() %></td>
			<td><%=p.getSdate() %></td>
			<td><%=p.getStock() %></td>
			<td>
				<button type="button" class="btn btn-default"><a href="javascript:productDetail('<%=p.getNo() %>')">보기</a></button>
			</td>
		</tr>
	<%
		}
	}
	%>
	<tr>
		<td colspan="6">
			<button type="button" class="btn btn-default" onclick="location.href='productinsert.jsp'">상품 등록</button>
		</td>
	</tr> 
			
</table>
<%@ include file ="admin_bottom.jsp" %>
<form action ="productdetail.jsp" name="detailForm" method="post">
<input type="hidden" name="no">

</form>
</body>
</html>