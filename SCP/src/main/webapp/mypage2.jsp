<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="resources/css/mypage2.css" rel="stylesheet">
<link href="resources/css/footer.css" rel="stylesheet">
<link href="resources/css/scp_main.css" rel="stylesheet" type="text/css">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
							<c:if test="${null ne user.name}">
								<!-- 로그인 된 상태 -->
								<li class="upper-links"><a class="links" href="logout.do">
										${user.name} 로그아웃</a></li>
							</c:if>
							<c:if test="${null eq user.name}">
								<!-- 로그인 안 된 상태 -->
								<ul class="largenav pull-right">
									<li class="upper-links"><a class="links" href="login.jsp">로그인
									</a></li>
							</c:if>
							<li class="upper-links dropdown"><a class="links"
								href="getNoticeList.do">고객센터</a>
								<ul class="dropdown-menu">
									<li class="profile-li"><a class="getNoticeList.do" href="">공지사항</a></li>
									<li class="profile-li"><a class="profile-links"
										href="q&a.jsp#tab2">자주묻는질문</a></li>
									<li class="profile-li"><a class="profile-links"
										href="q&a.jsp#tab3">1:1문의</a></li>
								</ul></li>
							<c:if test="${null ne user.name}">
								<!-- 로그인 된 상태 -->
								<li class="upper-links dropdown"><a class="links"
									href="mypage2.jsp">마이페이지</a>
							</c:if>
							<ul class="dropdown-menu">
								<li class="profile-li"><a class="profile-links"
									href="mypage2.jsp">주문배송조회</a></li>
								<li class="profile-li"><a class="profile-links"
									href="http://hacksociety.tech/">취소/교환/반품</a></li>
								<li class="profile-li"><a class="profile-links"
									href="mypage_custom_info.jsp">할인쿠폰</a></li>
								<li class="profile-li"><a class="profile-links"
									href="mypage_custom_info.jsp">포인트</a></li>
							</ul>
							</li>
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
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("남성의류", "UTF-8")%>">남성
											의류</a></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("여성의류", "UTF-8")%>">여성
											의류</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("신발", "UTF-8")%>">신발</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("쥬얼리/시계", "UTF-8")%>">쥬얼리/시계</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("뷰티", "UTF-8")%>">뷰티</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("식품", "UTF-8")%>">식품</a></li>
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



	<!-- <div id="_container" class="container">
		<div id="container_inner">
			<div id="_contents" class="contents_wrap"> -->
	<div class="content_main" style="padding-left: 12%">
		<div class="mypage_wrap mypage">
			<div class="mypage_lnb fusion">
				<div class="lnb_list">
					<div class="mypage_tit">
						<h3 class="tit t_mypage">마이페이지</h3>
					</div>
					<div class="mypage_menu">
						<ul>
							<li class="on"><a href="mypage2.jsp">주문/배송 조회</a></li>

							<li><a href="mypage_custom_info.do">고객 정보 수정</a></li>
							<li><a href="#">관심 상품 목록</a></li>
							<li><a href="#">내 쿠폰함</a></li>
							<li><a href="#">고객센터</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="mypage_con fusion_con" data-container="orderList">
				<h3 class="tit t_order_srch">주문/배송 조회</h3>
				<div class="wrap_tab">
					<ul class="tab_info">
						<li class="on" style="float: left;"><a href="#"><span>주문목록</span></a></li>
						<li class="on" style="float: left;"><a href="#"><span>환불/취소목록</span></a></li>
					</ul>
				</div>
				<br>
				<div class="order_shipps_area order_list">
					<div class="period_slt">
						<div class="allbtn">
							<h4>조회기간</h4>
							<div class="calendar_period">
								<div class="date_pick">
									<input type="text" value="2019/08/27" data-datepicker="start">
									<span>~</span> <input type="text" value="2019/09/27"
										data-datepicker="end">
								</div>
							</div>
							<div class="btn_period">
								<a data-datepicker="button" data-value="0d"
									data-datepicker-today="">오늘</a> <a data-datepicker="button"
									data-value="15d" data-datepicker-today="">15일</a> <a
									data-datepicker="button" data-datepicker-checked=""
									data-value="1m" data-datepicker-today="">1개월</a>
							</div>
							<div class="btn_period">
								<a data-datepicker="button" data-value="-1"
									data-datepicker-month="">8월</a> <a data-datepicker="button"
									data-value="-2" data-datepicker-month="">7월</a> <a
									data-datepicker="button" data-value="-3"
									data-datepicker-month="">6월</a> <a data-datepicker="button"
									data-value="-4" data-datepicker-month="">5월</a>
							</div>
							<br>
						</div>
					</div>
				</div>
				<div class="orderlist_detail">
					<label>주문번호 : ${pay.paycode}</label>
					<div class="detail">
						<img src="resources/img/쇼핑몰 상품 img/img1"> <span>주문 내역
							: ${pay.pcode}</span>
						<p>상품 합계: ${pay.payprice}</p>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>