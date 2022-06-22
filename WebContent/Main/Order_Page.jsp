<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- 부트스트랩 css파일 참조 -->
        <link rel="stylesheet" href="../css/bootstrap.css">

        <!-- jquery 파일 참조 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    
        <!-- 부트스트랩 js파일 참조 -->
        <script src="../js/bootstrap.js"></script>
    
        <!-- 개인 커스텀 디자인 -->
        <link rel="stylesheet" href="../css/style-computer.css">
        <link rel="stylesheet" href="../css/board_detail.css">
 		<link rel="stylesheet" href="../css/Order.css">
    <title>상품주문페이지</title>
    <script>
        $(document).ready(function() {
            $(".calulation1 thead input:checkbox[id=check]").click(function() {
                var bool = $(this).prop("checked");
                $(".calulation1 tbody input:checkbox[name=checkbox]").prop("checked", bool);
            });

            $(".calulation1 tbody input:checkbox[name=checkbox]").click(function() {
                var flag = false;
                $(".calulation1 tbody input:checkbox[name=checkbox]").each(function() {
                    var bool = $(this).prop("checked");

                    if(!bool) {
                        $(".calulation1 thead input:checkbox[id=check]").prop("checked", false);
                        flag = true;
                        return false;
                    }
                });
                if(!flag) {
                    $(".calulation1 thead input:checkbox[id=check]").prop("checked", true);
                }
            });
            $("#emailChoice").bind("change", function() {
                $("#domainName").val($(this).val());
            });
        }); //end of $(document).ready()----------------

        function openDaumPOST() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById("postnum1").value = data.postnum1; //우편번호의 첫번째 값 예 > 151
                    document.getElementById("postnum2").value = data.postnum2; // 우편번호의 두번째 값 예 > 019
                    document.getElementById("addr1").value = data.address; // 주소 예 > 서울특별시 양천구 목동동로 50
                    document.getElementById("addr2").focus();
                }
            }).open();
        }
    </script>
</head>
<body>
<%@ include file="guest_top.jsp" %>
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

                    <!-- 우측 회원 메뉴 -->
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><%=memid%><span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="../member/register.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                                <li><a href="guest_mypage.jsp"><span class="glyphicon glyphicon-user"></span> 마이페이지</a></li>
                                <li><a href="cartlist.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> 장바구니</a></li>
                                <li><a href="orderlist.jsp"><span class="glyphicon glyphicon-list-alt"></span> 주문목록</a></li>
                                <% if (memid == null) { %>
           				 		<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        						<% } else { %>
           					 	<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
        						<% } %>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header> 
 <div id="backbody">
        <div id="frame">
            <form>
                <div id="frame2">
                    <span style="font-size: 16pt; font-weight: bold;">상품주문하기</span>
                    <span class="home"> 홈 > 상품주문하기</span>

                    <span> </span>
                </div>
                <br/>

                <!-- 상품정보 테이블 -->
                <div>
                    <table class="calculation1">
                        <thead>
                            <tr>
                                <th colspan="10" style="text-align: left; padding-left : 10px;">일반상품(1)</th>
                            </tr>
                            <tr>
                                <th><input type="checkbox" name="checkbox" id="check"/></th>
                                <th><span>이미지</span></th>
                                <th style="width: 400px;"><span>상품정보</span></th>
                                <th style="width: 100px;">판매가</th>
                                <th>수량</th>
                                <th style="width: 100px;">적립금</th>
                                <th style="width: 100px;">배송구분</th>
                                <th style="width: 100px;">배송비</th>
                                <th style="width: 100px;">합계</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            <tr style="height: 90px; background-color: #fff;">
                                <td style="text-align: left; text-align: center; border-right: none;">
                                    <input type="checkbox" name="checkbox" />
                                </td>
                                <td style="border-left: none; border-right: none;"><img style="width: 100%;" src="../img/pc_one.jpg"></td>
                                <td style="text-align: left; padding-left: 10px; border-left: none; font-weight: bold;">흰색컴퓨터</td>

                                <td><span>0</span>원</td>

                                <td style="width: 80px;">
                                    <span>1</span>
                                </td>

                                <td>-</td>
                                <td>기본배송</td>
                                <td>고정</td>
                                <td><span>0</span>원</td>
                            </tr>

                        </tbody>

                        <tfoot>
                            <tr style="height: 60px;">
                                <td colspan="5" style="border-right : none; text-align : left; padding-left : 10px;">
                                    <span>[기본배송]</span>
                                </td>
                                <td colspan="5" style="border-left: none; text-align : right; padding-right : 10px;">
                                    상품금액<span>0</span> + <span>배송비 2,500 = 합계</span>&nbsp;<span style="font-weight: bold; font-size: 20px;">0</span>원
                                </td>
                            </tr>
                        </tfoot>
                    </table>

                    <div style="border: solid 1px #e0e0eb; border-right:none; border-left:none; padding: 11px 0; background-color:rgb(255, 203, 203);">
                        <img src="../img/주의.png" style="margin-left: 5px; position: relative; top: 4.5px; width: 20px;">
                        <span style="font-size: 10pt; color: red;">상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</span>
                    </div>
                </div>

                <div style="margin: 10px 0; padding-bottom: 50px; border-bottom: solid 1px gray;">
                    <span style="margin: 0 10px;" class="btnfloat">선택상품</span>
                    <button type="button" class="btn default btnfloat" style="background-color: gray; color: #fff;">x 삭제하기</button>

                    <button type="button" class="btn default btnfloat2" onclick="javascript:history.back()">이전페이지 ></button>
                </div>
                <br/><br/>

                <!-- 배송정보 -->
                <span style="font-size: 12pt; display: inline-block; padding-bottom: 10px; ">&nbsp;배송정보</span>
                <table class="delivery">
                    <thead>
                        <tr>
                            <td class="deliverytd ">배송지 선택</td>
                            <td>
                                <input type="radio" name="bb"/>
                                <label>회원정보와 동일</label>

                                <input type="radio" name="bb"/>
                                <label>새로운배송지</label>&nbsp;
                                <button type="button" style="background-color: #fff; cursor:pointer; border-width: 1px;">주소목록보기</button>
                            </td>
                        </tr>

                        <tr>
                            <td class="deliverytd" >받으시는 분&nbsp;<span style="color:red;">*</span></td>
                            <td><input type="text"/></td>
                        </tr>

                        <tr>
                            <td class="deliverytd">주소&nbsp;<span style="color:red;">*</td>
                                <td>
                                    <input type="text" id="postnum1" size="10" maxlength="5"/>
                                    &nbsp;
                                    <button type="button" style="cursor: pointer; margin-bottom: 10px; background-color : #fff; border: 1px solid black;">우편번호찾기</button>
                                    <br/>
                                    <input style="margin-bottom: 10px;" type="text" id="addr1" size="50"/><br/>
                                    <input type="text" id="addr2" size="50"/>
                                </td>
                        </tr>

                        <tr>
                            <td class="deliverytd">휴대전화&nbsp;<span style="color: red;">*</span></td>
                            <td><input type="text" size="5"/>-<input type="text" size="5"/>-<input type="text" size="5"/></td>
                        </tr>

                        <tr>
                            <td class="deliverytd">이메일&nbsp;<span style="color : red;">*</span></td>
                            <td><input type="text"/>@<input id="domainName" type="text"/>&nbsp;
                                <select id="emailChoice" style="height: 20px;">
                                    <option>-이메일 선택-</option>
                                    <option>daum.net</option>
                                    <option>naver.com</option>
                                    <option>nate.com</option>
                                    <option>hotmail.com</option>
                                    <option>yahoo.com</option>
                                    <option>empas.com</option>
                                    <option>korea.com</option>
                                    <option>gmail.com</option>
                                </select>
                                <span style="font-size: 10pt; color:gray;">
                                    <p>이메일을 통해 주문처리과정을 보내드립니다.<br/>
                                        이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</p>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td class="deliverytd">배송메세지</td>
                            <td><textarea rows="5" cols="100"></textarea></td>                       
                        </tr>
                    </thead>
                </table>
                <br/><br/>
                <!-- 결제예정금액 테이블 -->
                <table class="calculation2">
                    <tr>
                        <th>총 상품금액</th>
                        <th>총 배송비</th>
                        <th style="width: 750px; padding: 22px 0;"><span>결제예정금액</span></th>
                    </tr>

                    <tr style="background-color: #fff;">
                        <td style="padding: 23px 0;"><span class="price">0</span>원</td>
                        <td>+<span class="price">0</span>원</td>
                        <td>=<span class="price">0</span>원</td>
                    </tr>
                </table>
                <br/><br/>

                <!-- 결제하기 -->
                <div class="payArea">
                    <div class="payment">
                        <div style="padding: 18px 10px; font-size: 10pt; border-bottom: solid 1px #e0e0eb;">
                            <input  type="radio" name="cardradio" checked/><label>카드결제</label>&nbsp;&nbsp;
                            <input  type="radio" name="cardradio" checked/><label>실시간 계좌이체</label>&nbsp;&nbsp;
                            <input  type="radio" name="cardradio" checked/><label>휴대폰 결제</label>&nbsp;&nbsp;
                            <input  type="radio" name="cardradio" checked/><label>무통장 입금</label>&nbsp;&nbsp;
                            <input  type="radio" name="cardradio" checked/><label>에스크로(가상계좌)</label>&nbsp;&nbsp;
                        </div>

                        <div align="left">
                            <img src="../img/주의.png" style="margin-left: 5px; position : relative; top: 6px; width: 20px;">
                            <span style="font-size: 10pt; color: gray;">최소 결제 금액은 결제금액에서 배송비를 제외한 금액입니다.</span><br/>
                            <img src="../img/주의.png" style="margin-left: 5px; position : relative; top: 6px; width: 20px;">
                            <span style="font-size: 10pt; color: gray;">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</span>
                        </div>
                    </div>

                    <div class="total">
                        <span style="display: inline-block; padding: 20px 10px;">카드결제 최종결제 금액</span><br/>
                        <span style="font-size: 25pt; font-weight: bold; padding: 0px  10px;">0원</span><br/><br/>
                        <button type="button" class="btn default" style="width: 90%; height: 60px; margin-right: 10px; font-size: 20px;">결제하기</button>
                    </div>
                </div>
                <br/><br/>


                <!-- 이용안내 -->
                <div style="border: solid 1px #e0e0eb; padding: 10px 0; font-size: 12pt; background-color: #f5f5f0; padding-left: 10px;">
                무이자할부 이용안내
                </div>

                <div style="border: solid 1px #e0e0eb; font-size: 12pt; padding-left: 10px;">
                    <span>-</span> <span style="font-size: 10pt; color:gray;">무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 수 없습니다.</span><br>
                    <span>-</span> <span style="font-size: 10pt; color:gray;">무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주세요.</span>
                </div>

                <div style="border: solid 1px #e0e0eb; padding: 10px 0; font-size: 12pt; background-color: #f5f5f0; padding-left: 10px">
                    이용안내
                </div>
                <div style="border: solid 1px #e0e0eb; height: 500px; font-size: 12pt; padding-left: 10px;">
                    <br/>세금계산서 발행 안내
                    <ol style="padding-left: 30px; padding-top : 8px">
                        <li class="lifont"> 부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음날 10일까지만 요청하실 수 있습니다.</li>
                        <li class="lifont"> 세금계산서는 사업자만 신청할 수 있습니다.</li>
                        <li class="lifont"> 배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
                        <li class="lifont"> [세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야 세금계산서 발행이 가능합니다.</li>
                        <li class="lifont"> [세금계산서 인쇄]버튼을 누르면 발행된 세금게산서를 인쇄할 수 있습니다.</li>
                    </ol><br/>
                    부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내
                    <ol style="padding-left: 30px; padding-top: 8px;">
                        <li class="lifont"> 변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이 불가하며</li>
                        <li class="lifont"> 신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</li>
                        <li class="lifont"> 상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여 주시기 바랍니다.</li>
                    </ol><br/>
                    현금영수증 이용안내
                    <ol style="padding-left: 30px; padding-top: 8px;">
                        <li class="lifont"> 현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이 됩니다.</li>
                        <li class="lifont"> 현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</li>
                        <li class="lifont"> 발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</li>
                        <li class="lifont"> 현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수 있습니다.)</li>
                        <li class="lifont"> 현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</li>
                    </ol><br/>
                </div>
            </form>
        </div>
    </div>
    <!-- footer -->
   <footer>
    <div class="container">
        <div class="row">
            <div class="col-md-7 col-sm-12"> <!--왼쪽 영역-->
                <div class="copyright">
                    <a href="guest_index.jsp"><img src="../img/pc_logo.png" alt="logo" style="width: 30px;"></a>
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
                    <li><a href="">고객센터</a></li>
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