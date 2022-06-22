<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
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

</script>
</head>
<body>

<br>
<br>
<%@ include file="admin_top.jsp" %>
<h2 style="text-align:center; color:black;">(관리자 페이지)</h2>
 <!-- 슬라이더 영역 -->
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 slide-list">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- 초간격으로 이동 -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>
                    
                        <!-- 슬라이더 이미지 -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img src="../img/pc_one.jpg" alt="cat">
                            </div>
                    
                            <div class="item">
                                <img src="../img/pc_two.jpg" alt="flower_cat">
                            </div>
                    
                            <div class="item">
                                <img src="../img/pc_super.jpg" alt="tree-cat">
                            </div>
                        </div>
                    
                        <!-- 슬라이드 왼쪽 오른쪽 제어 -->
                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="main_text0" id="link_main_text0">
        <h1>게이밍 PC</h1>
        <div class="contents1">PC방 고사양 PC를 내 방에서!
        <ul class="icons">
            <li>
                <div class="icon_img">
                    <img src="../img/battlegrounds.jpg">
                </div>
                <div class="contents1_bold">배틀그라운드</div>
                <div class="contents1">
                    BATTLEGROUND
                </div>
                <div class="more" onclick="location.href='../guest/productlist.jsp';">
                    	바로가기
                </div>
            </li>
            <li>
                <div class="icon_img">
                    <img src="../img/eldenring.jpg">
                </div>
                <div class="contents1_bold">엘든 링</div>
                <div class="contents1">
                    ELDEN RING
                </div>
                <div class="more" onclick="location.href='../guest/productlist.jsp';">
                    바로가기
                </div>
            </li>
            <li>
                <div class="icon_img">
                    <img src="../img/lostark.png">
                </div>
                <div class="contents1_bold">로스트아크</div>
                <div class="contents1">
                    LOSTARK
                </div>
                <div class="more" onclick="location.href='../guest/productlist.jsp';">
                    바로가기
                </div>
            </li>
            <li>
                <div class="icon_img">
                    <img src="../img/lol.jpg">
                </div>
                <div class="contents1_bold">리그 오브 레전드</div>
                <div class="contents1">
                    LEARUE OF LEGENDS
                </div>
                <div class="more" onclick="location.href='../guest/productlist.jsp';">
                    바로가기
                </div>
            </li>
        </ul>
    </div>
</div>

    <!-- 본문 영역 -->
    <section>
        <div class="container">
            <div class="row">
                <h2>컴퓨터 추천<small> 고객님을 위해 최선을 다하겠습니다.</small></h2>
                <!-- 모든 자식에 똑같은 속성이 들어가면 부모에다가 속성을 줘서 적용해준다 -->
                <ul class="col-xs-12 cat-wrap"> <!-- xs에서는 1칸, 그리드 가장 바깥 상자 -->
                    <li class="col-sm-6 cat-inner"> <!-- sm이상에서는 절반, 그리드 중간에 숨겨진 상자-->
                        <a href="../guest/productlist.jsp"> <!-- 안쪽 상자 -->
                            <img src="../img/pc_1.png"alt="컴퓨터1">
                            <span class="arrow"><i class="glyphicon glyphicon-menu-right"></i></span>
                            <span class="arrow hover" onclick="location.href='../guest/productlist.jsp';">상세보기<i class="glyphicon glyphicon-menu-right"></i></span>
                        </a>
                    </li>
                    <li class="col-sm-6 cat-inner"> <!-- sm이상에서는 절반, 그리드 중간에 숨겨진 상자-->
                        <a href="../guest/productlist.jsp"> <!-- 안쪽 상자 -->
                            <img src="../img/pc_2.png" alt="컴퓨터2">
                            <span class="arrow"><i class="glyphicon glyphicon-menu-right"></i></span>
                            <span class="arrow hover" onclick="location.href='../guest/productlist.jsp';">상세보기<i class="glyphicon glyphicon-menu-right"></i></span>
                        </a>
                    </li>
                    <li class="col-sm-6 cat-inner"> <!-- sm이상에서는 절반, 그리드 중간에 숨겨진 상자-->
                        <a href="../guest/productlist.jsp"> <!-- 안쪽 상자 -->
                            <img src="../img/pc_3.png" alt="컴퓨터3">
                            <span class="arrow"><i class="glyphicon glyphicon-menu-right"></i></span>
                            <span class="arrow hover" onclick="location.href='../guest/productlist.jsp';">상세보기<i class="glyphicon glyphicon-menu-right"></i></span>
                        </a>
                    </li>
                    <li class="col-sm-6 cat-inner"> <!-- sm이상에서는 절반, 그리드 중간에 숨겨진 상자-->
                        <a href="../guest/productdetail_guest.jsp"> <!-- 안쪽 상자 -->
                            <img src="../img/pc_4.png" alt="컴퓨터4">
                            <span class="arrow"><i class="glyphicon glyphicon-menu-right"></i></span>
                            <span class="arrow hover" onclick="location.href='../guest/productlist.jsp';">상세보기<i class="glyphicon glyphicon-menu-right"></i></span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </section>
    
    <!-- 블로그 그리드 레이아웃 -->
    <section>
        <div class="container" style="padding: 0;">
            <div class="row">
                <div class="col-xs-12">
                    <h2>인기 컴퓨터</h2>
                </div>
            </div>
            <ul class="row blog-style">
                <li class="col-lg-2 col-md-4 col-sm-6 col-xs-12">
                    <div class="blog-inner">
                        <img src="../img/pc_one.jpg" alt="컴퓨터5">
                        <div class="blog-content">
                            <p>흰색 컴퓨터</p>
                            <div class="blog-info"> <!--부모영역-->
                                <ul>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                </ul>
                                <strong>인싸 컴퓨터</strong>
                            </div>
                        </div>
                        <div class="blog-hover-content">
                            <a href="../guest/productlist.jsp">리뷰 보러가기</a>
                        </div>
                    </div>
                </li>
                <li class="col-lg-2 col-md-4 col-sm-6 col-xs-12">
                    <div class="blog-inner">
                        <img src="../img/pc_one.jpg" alt="컴퓨터6">
                        <div class="blog-content">
                            <p>흰색 컴퓨터</p>
                            <div class="blog-info">
                                <ul>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star-empty"></span></li>
                                </ul>
                                <strong>인싸 컴퓨터</strong>
                            </div>
                        </div>
                        <div class="blog-hover-content">
                            <a href="../guest/productlist.jsp">리뷰 보러가기</a>
                        </div>
                    </div>
                </li>
                <li class="col-lg-2 col-md-4 col-sm-6 col-xs-12">
                    <div class="blog-inner">
                        <img src="../img/pc_one.jpg" alt="컴퓨터7">
                        <div class="blog-content">
                            <p>흰색 컴퓨터</p>
                            <div class="blog-info">
                                <ul>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                </ul>
                                <strong>인싸 컴퓨터</strong>
                            </div>
                        </div>
                        <div class="blog-hover-content">
                            <a href="../guest/productlist.jsp">리뷰 보러가기</a>
                        </div>
                    </div>
                </li>
                <li class="col-lg-2 col-md-4 col-sm-6 col-xs-12">
                    <div class="blog-inner">
                        <img src="../img/pc_one.jpg" alt="컴퓨터8">
                        <div class="blog-content">
                            <p>흰색 컴퓨터</p>
                            <div class="blog-info">
                                <ul>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star-empty"></span></li>
                                </ul>
                                <strong>인싸 컴퓨터</strong>
                            </div>
                        </div>
                        <div class="blog-hover-content">
                            <a href="../guest/productlist.jsp">리뷰 보러가기</a>
                        </div>
                    </div>
                </li>
                <li class="col-lg-2 col-md-4 col-sm-6 col-xs-12">
                    <div class="blog-inner">
                        <img src="../img/pc_one.jpg" alt="컴퓨터9">
                        <div class="blog-content">
                            <p>흰색 컴퓨터</p>
                            <div class="blog-info">
                                <ul>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star"></span></li>
                                    <li><span class="glyphicon glyphicon-star-empty"></span></li>
                                    <li><span class="glyphicon glyphicon-star-empty"></span></li>
                                </ul>
                                <strong>인싸 컴퓨터</strong>
                            </div>
                        </div>
                        <div class="blog-hover-content">
                            <a href="../guest/productlist.jsp">리뷰 보러가기</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </section>
<%@ include file="admin_bottom.jsp" %>
</body>
</html>