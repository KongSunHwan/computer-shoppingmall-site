<%@page import="pack.member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="memberMgr" class="pack.member.MemberMgr"/>
   
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
//out.print(id);
MemberBean bean = memberMgr.getMember(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자가 회원 수정</title>
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
</head>
<body>
<%@ include file="../admin/admin_top.jsp" %>
<br>
<br>
  <!-- 탭 스타일은 bootstrap.js와 jquery가 반드시 필요하다 -->
    <section>
        <div class="container">
            <div class="row">
                <div class="titlebox">
                 회원 수정
                </div>
                <div class="col-xs-12">
                    <ul class="nav nav-tabs tabs-basic">
                      <li class="active"><a data-toggle="tab" href="#home">회원 관리</a></li>
                      <li><a data-toggle="tab" href="#menu1">Menu 2</a></li>
                      <li><a data-toggle="tab" href="#menu2">Menu 3</a></li>
                      <li><a data-toggle="tab" href="#menu3">Menu 4</a></li>
                    </ul>
                  
                    <div class="tab-content">
                      <div id="home" class="tab-pane fade in active">
                        
                        <p><b><%= bean.getname() %> 회원님의 정보를 수정합니다.</b></p>
                        
                        <form action="memberupdateproc_admin.jsp" name="updateFormAdmin" method="post">
                            <table class="table"> <!-- 부트스트랩 반응형 기본 테이블-->
                                <tbody class="m-control">
                                    <tr>
                                     <td class="m-title">아이디<span class="essential"> *</span></td>
                                     <td>
                                     	<%=bean.getId() %>
                                        <input type="hidden" name="id" class="form-control add" value="<%=bean.getId() %>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">비밀번호<span class="essential"> *</span></td>
                                        <td>
                                        <input type="password"  class="form-control add" name="passwd" value="<%=bean.getId() %>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">이름<span class="essential"> *</span></td>
                                        <td>
                                            <input type="text" name="name" class="form-control add" value="<%=bean.getname() %>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">이메일<span class="essential"> *</span></td>
                                        <td>
                                            <input type="text" name="email" class="form-control add"  value="<%=bean.getEmail() %>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">전화번호<span class="essential"> *</span></td>
                                        <td>
                                            <input type="text" name="phone" class="form-control add" value="<%=bean.getPhone() %>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>우편번호<span class="essential"> *</span></td>
                                        <td>
                                        <input type="text" class="form-control" name="zipcode" value="<%=bean.getZipcode() %>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>상세주소<span class="essential"> *</span></td>
                                        <td>
                                        <input type="text" class="form-control" name="address" value="<%=bean.getAddress() %>">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="m-title">직업<span class="essential"> *</span></td>
                                        <td>
                                            <select class="form-control sel" name="job">
                                                <option value="<%=bean.getJob()%>"><%=bean.getJob() %></option>
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
</body>
</html>