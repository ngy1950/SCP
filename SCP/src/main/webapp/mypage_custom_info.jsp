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
</head>
<script type="text/javascript" src="./resources/js/joinmember.js"
	charset="UTF-8"></script>
<link href="resources/css/mypage2.css" rel="stylesheet">
<link href="resources/css/mypage_custo_info.css" rel="stylesheet">
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

	<div class="content_main" style="padding-top: 10%; padding-left: 12%">
		<div class="mypage_wrap mypage">
			<div class="mypage_lnb fusion">
				<div class="lnb_list">
					<div class="mypage_tit">
						<h3 class="tit t_mypage">마이페이지</h3>
					</div>
					<div class="mypage_menu">
						<ul>
							<li class="on"><a href="mypage2.jsp">주문/배송 조회</a></li>

							<li><a href="mypage_custom_info.jsp">고객 정보 수정</a></li>
							<li><a href="#">관심 상품 목록</a></li>
							<li><a href="#">내 쿠폰함</a></li>
							<li><a href="#">고객센터</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="mypage_update">
				<h3 class="update_tit">고객 정보 수정</h3>
				<table class="table_info">
					<tbody>
						<tr>
							<th>이름</th>
							<td id="nameArea"><span class="mypage_txt"
								data-modify="name"> <input type="text" id="_name"
									class="inpt_default disabled" value="${user.id}" disabled></span>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td id="email_area"><span class="mypage_txt"
								data-modify="email"> <input type="text" id="_email"
									value="${user.email}" placeholder="예) cherry@gmail.com"></span>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td id="phonearea"><span class="mypage_txt"
								data-modify="phone"> <input type="text" id="_phone"
									value="${user.phone}" placeholder="예) 010-1234-4567"></span></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td id="birtharea"><span class="input_area"
								data-modify="birth"> <input type="text" id="_birth"
									value="${user.birth}" disabled></span></td>
						</tr>
						<tr>
							<th>주소</th>
							<td id="birtharea"><span class="input_area"
								data-modify="zipcode"> <input type="text" id="_zipcode"
									value="${user.zipcode}">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-default" type="button"
										onclick="zipCheck()">우편번호 찾기</button>
							</span> <br>
							<br> <input type="text" id="_address"
								value="${user.address}" style="width: 350px"></td>
						</tr>
						<tr class="update_btn">
							<td style="float: right;"><a href="#"><input
									type="reset" value="취소"></a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit"
								value="수정"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


</body>
</html>