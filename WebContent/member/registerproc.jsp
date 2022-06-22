<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="memberBean" class="pack.member.MemberBean"/>
<jsp:setProperty property="*" name="memberBean"/>

<%
out.print(memberBean.getId() + "  " + memberBean.getname());
%>
   <jsp:useBean id="memberMgr" class="pack.member.MemberMgr"/>
<%   
boolean b = memberMgr.memInsert(memberBean);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(b){
	response.sendRedirect("../Main/login.jsp");
}else {
	response.sendRedirect("register.jsp");
}
%>


</body>
</html>