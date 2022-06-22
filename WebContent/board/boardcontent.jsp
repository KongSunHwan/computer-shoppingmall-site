<%@page import="pack.board.BoardMgr"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardMgr" class="pack.board.BoardMgr"/>
<jsp:useBean id="dto" class="pack.board.BoardDto"/>

<%
String num = request.getParameter("num");
String spage = request.getParameter("page"); // spage는 몇페이지인지 확인하는 것 : 1페이지/ 2페이지 ...
//out.println(num + " " + spage);

boardMgr.updateReadcnt(num);// 조회수 증가
dto = boardMgr.getData(num); // 해당 자료 불러오기 from BoardMgr.java

String pass = dto.getPass();
String mypass = "*****"; //일반인은 비밀번호가 보이지 않도록
String adminOk = (String)session.getAttribute("adminOk");
if(adminOk != null){
	if(adminOk.equals("admin")) mypass = pass; // 관리자는 비밀번호를 볼 수 있도록
}

%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>게시판 상세보기</title>
</head>
<body>
<%-- <td>비밀번호 :<%=mypass%></td> --%>
		<%-- <a href="reply.jsp?num=<%=num%>&page=<%=spage%>">답글</a>
		<a href="edit.jsp?num=<%=num %>&page=<%=spage%>">수정</a>
		<a href="delete.jsp?num=<%=num %>&page=<%=spage%>">삭제</a>
		<a href="boardlist.jsp?num= <%=spage%>">목록</a> --%>
		
<table border="1" class="table table-striped table-bordered">
 		<tr>
            <td>작성자</td>
            <td><%=dto.getName() %></td>
            <td>이메일</td>
            <td><%=dto.getMail() %></td>
        </tr>
         <tr>
         	<td>작성일</td>
            <td><%= dto.getBdate() %></td>
            <td>조회수</td>
            <td><%= dto.getReadcnt() %></td>
        </tr>
        <%-- <%=dto.getBip() %> --%>
 		<tr>
            <td>제목</td>
            <td colspan="3"><%= dto.getTitle() %></td>
        </tr>
		
		<tr>
            <td>내용</td>
            <td colspan="3" height="300">
                <%= dto.getCont() %></td>
        </tr>
        <tr>
            <td colspan="4" align="center">
            <button type="button" class="btn btn-primary" onclick="location.href='reply.jsp?num=<%=num%>&page=<%=spage%>';">답글달기</button>
                <button type="button" class="btn btn-primary" onclick="location.href='edit.jsp?num=<%=num %>&page=<%=spage%>';">수정하기</button>
                <button type="button" onclick="location.href='delete.jsp?num=<%=num %>&page=<%=spage%>';" class="btn btn-primary">삭제하기</button> 
                <button type="button" onclick="location.href='boardlist.jsp?num= <%=spage%>';" class="btn btn-primary">목록보기</button>
            </td>
        </tr>
</table>
</body>
</html>