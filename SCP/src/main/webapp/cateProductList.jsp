<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.company.SCP.product.productVO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/scp_main.css" rel="stylesheet" type="text/css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="resources/css/footer.css" rel="stylesheet">
</head>

<body>
  <!-- 헤더 -->
	<form action="search.do" method="POST" name="mainForm">
		<nav class="navbar navbar-default navcarbox" role="navigation">
			<div class="container">
				<div class="row row1">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>


					<!-- 상단 메뉴바 -->
				<div class="row row1">
					<ul class="largenav pull-right">
						<c:if test="${null ne user.name}">		<!-- 로그인 된 상태 -->
							<li class="upper-links"><a class="links" href="logout.do">
									${user.name} 로그아웃</a></li>
						</c:if>
						<c:if test="${null eq user.name}">		<!-- 로그인 안 된 상태 -->
							<ul class="largenav pull-right">
								<li class="upper-links"><a class="links" href="login.jsp">로그인
								</a></li>
						</c:if>
						<li class="upper-links dropdown"><a class="links"
							href="getNoticeList.do">고객센터</a>
							<ul class="dropdown-menu">
								<li class="profile-li"><a class="getNoticeList.do"
									href="">공지사항</a></li>
								<li class="profile-li"><a class="profile-links"
									href="q&a.jsp#tab2">자주묻는질문</a></li>
								<li class="profile-li"><a class="profile-links"
									href="q&a.jsp#tab3">1:1문의</a></li>
							</ul></li>
						<li class="upper-links dropdown"><a class="links"
							href="mypage2.jsp">마이페이지</a>
							<ul class="dropdown-menu">
								<li class="profile-li"><a class="profile-links"
									href="mypage2.jsp">주문배송조회</a></li>
								<li class="profile-li"><a class="profile-links"
									href="http://hacksociety.tech/">취소/교환/반품</a></li>
								<li class="profile-li"><a class="profile-links"
									href="mypage_custom_info.jsp">할인쿠폰</a></li>
								<li class="profile-li"><a class="profile-links"
									href="mypage_custom_info.jsp">포인트</a></li>
							</ul></li>
						<li class="upper-links"><a class="links"
							href="http://clashhacks.in/">장바구니</a></li>
					</ul>
				</div>

				<div align="center">
					<a href="index.do"><img src="resources/img/쇼핑몰 메인배너/logo1.png"></a>
					<div class="mb-3">
						<input type="text" style="width: 87%; height: auto; margin: 0px;"
							class="input-lg" placeholder="검색할 물품을 입력해주세요." name="searchText">
						<input class="btn btn-outline-secondary"
							style="height: 50px; margin: 0px; width: auto; text-align: left;"
							type="submit" value="검색">
					</div>
				</div>


				<!--iCON 타겟 목록 -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-left" style="margin-left: 15px;">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">상품 카테고리<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="getCategory.do?category=<%= URLEncoder.encode("남성의류", "UTF-8") %>">남성 의류</a></li>
		                        <li><a href="getCategory.do?category=<%= URLEncoder.encode("여성의류", "UTF-8") %>">여성 의류</a></li>
		                        <li class="divider"></li>
		                        <li><a href="getCategory.do?category=<%= URLEncoder.encode("신발", "UTF-8") %>">신발</a></li>
		                        <li class="divider"></li>
		                        <li><a href="getCategory.do?category=<%= URLEncoder.encode("쥬얼리/시계", "UTF-8") %>">쥬얼리/시계</a></li>
		                        <li class="divider"></li>
		                        <li><a href="getCategory.do?category=<%= URLEncoder.encode("뷰티", "UTF-8") %>">뷰티</a></li>
		                        <li class="divider"></li>
		                        <li><a href="getCategory.do?category=<%= URLEncoder.encode("식품", "UTF-8") %>">식품</a></li>
							</ul></li>
						<li><a href="#">베스트 상품</a></li>
						<li><a href="#">NEW 상품</a></li>
						<li><a href="#">해외직구</a></li>
						<li><a href="#">무료배송</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</form>
	<!-- 헤더 끝 -->
   
   <!-- 상품 목록 -->
   <div class="container">
      <h3 class="h3 center">${category}</h3>
      <hr>
      <div class="row">

         <%
            int count = 0;
         %>
         <c:forEach var="product" items="${productList}">
            <c:set var="count" value="${count + 1}" />
            <%
               count++;
            %>
            <div class="col-md-3 col-sm-6">
               <div class="product-grid9" style="border: 1px solid;">
                  <div class="product-image9">
                     <a href="getProduct.do?pcode=${product.pcode}">
                     	<img class="pic-1" src="${product.imgpath}">
                     	<img class="pic-2" src="${product.imgpath2}">
                     </a>
                     <a href="getProduct.do?pcode=${product.pcode}" class="fa fa-search product-full-view"></a>
                  </div>
                  <div class="product-content">
                     <ul class="rating">
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                     </ul>
                     <h3 class="title">
                        <a href="getProduct.do?pcode=${product.pcode}"
                           style="color: black;">${product.pname}</a>
                     </h3>
                     <div class="price">
                        <b><fmt:formatNumber value="${product.pprice}"
                              pattern="#,###" />원</b> <small
                           style="color: gray; font-size: 0.7em;">|
                           ${product.sale}개 구매</<small>
                     </div>
                     <a class="add-to-cart"
                        href="getProduct.do?pcode=${product.pcode}">VIEW PRODUCTS</a>

                  </div>
               </div>
            </div>
            <%
               if (count == 4) {
                     count = 0;
            %>
            <b style="color: white">.</b>
            <br>
            <%
               }
            %>
         </c:forEach>
      </div>
   </div><br><br>
   
	<footer>
		<div id="footer" style="width: 100%; height: 150px;">
			<div class="container">
				<div class="footer_wrap">
					<div class="footer_menu">
						<ul class="footer_menu_inner">
							<li class="foot_etc company"><a href="#">기업소개</a></li>
							<li class="foot_etc private"><a href="#">개인정보처리방침</a></li>
							<li class="foot_etc document"><a href="#">이용약관</a></li>
							<li class="foot_etc elect"><a href="#">전자금융거래약관</a></li>
							<li class="foot_etc custom"><a href="#">고객센터</a></li>
						</ul>
					</div>
					<div class="footer_company">
						<div class="footer_company_inner">
							<div class="footer_info">
								<h2 class="footer_logo">
									<a href="#">SSamazon</a>
								</h2>
								<p class="copyright">COPYRIGHT@SSAMAZON INC. ALL RIGHT
									RESERVED.</p>

								<dl class="footer_guide">
									<dt>
										<span class="title_1">고객센터</span> <span class="phone">1588
											- 8204</span>
									</dt>
									<dd>평일 9:00 ~ 18:00</dd>
									<dd>주말/공휴일 10:00 ~ 17:00</dd>

								</dl>

							</div>


						</div>
					</div>

				</div>
			</div>
		</div>
	</footer>
	<script>
		$(document).ready(function() {
			resize();
		});
		// 화면 크기가 변경될 때 마다 동적으로 사이즈를 조정한다.
		$(window).on('resize', function() {
			resize();
		});

		function resize() {
			if (window.innerHeight > $('html').height()) {
				$('#footer').css('position', 'absolute');
				$('#footer').css('bottom', '0');
			} else {
				$('#footer').css('position', 'relative');
			}
		}
	</script>  
   
</body>
</html>