<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>
<%@ page import="com.company.SCP.cart.cartDAO"%>\
<%@ page import="com.company.SCP.cart.cartVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<link href="resources/css/footer.css" rel="stylesheet">
<link href="resources/css/scp_main.css" rel="stylesheet" type="text/css">
<link href="resources/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">


<script>
	function goBack() {
		location.href = 'getProduct.do?pcode=${product.pcode}';
	}
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
	<hr>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>장바구니</th>
							<th>수량</th>
							<th class="text-center">가격</th>
							<th class="text-center">합계</th>
							<th> </th>
						</tr>
						<hr>
					</thead>
					<tbody>
						<c:set var="total" value="0" />
						<c:forEach var="list" items="${Listcart}">

							<tr>
								<td class="col-sm-8 col-md-6">
									<div class="media">
										<a class="thumbnail pull-left" href="#"> <img
											class="media-object"
											src="${list.imgpath}"
											style="width: 72px; height: 72px;">
										</a>
										<div class="media-body">
											<h4 class="media-heading">
												<a href="#">${list.pname}</a>
											</h4>
											<h5 class="media-heading">
												<span style="color: gary; font-size: 0.8em;">사이즈
													:</span> <span style="font-size: 1.0em;">${list.size}</span></a>
											</h5>
											<h5 class="media-heading">
												<span style="color: gary; font-size: 0.8em;">색상
													:</span> <span style="font-size: 1.0em;">${list.color}</span></a>
											</h5>

										</div>
									</div>

								</td>
								<td class="col-sm-1 col-md-1" style="text-align: center"><input
									type="email" class="form-control" id="exampleInputEmail1"
									value="${list.orderNum}" style="width: 46px; text-align: center;" readonly></td>
								<td class="col-sm-1 col-md-1 text-center"><strong><fmt:formatNumber
											value="${list.price}" pattern="#,###" /></strong></td>
								<c:set var="sum" value="${list.orderNum * list.price}" />
								<c:set var="total" value="${total + sum}" />
								<td class="col-sm-1 col-md-1 text-center"><strong><fmt:formatNumber
											value="${sum}" pattern="#,###" /></strong></td>
								<td class="col-sm-1 col-md-1"><a
									href="delete.do?id=${list.id}&poption=${list.poption}">
										<button type="button" class="btn btn-danger">
											<span class="glyphicon glyphicon-remove"></span>
										</button>
								</a></td>

							</tr>
						</c:forEach>

						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h5>합계</h5></td>
							<td class="text-right"><h5>
									<strong><fmt:formatNumber value="${total}"
											pattern="#,###" /></strong>
								</h5></td>
						</tr>

						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h5>추가 금액</h5></td>
							<td class="text-right"><h5>
									<strong>0</strong>
								</h5></td>
						</tr>
						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><h3>총 합계</h3></td>
							<td class="text-right"><h3>
									<strong><fmt:formatNumber value="${total}"
											pattern="#,###" /></strong>
								</h3></td>
						</tr>
						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td><a href="getProduct.do?pcode=${Listcart[0].pcode}"><button
										type="button" class="btn btn-default">
										<span class="glyphicon glyphicon-shopping-cart"></span> 계속 쇼핑
									</button></a></td>
							<td>
								<button type="button" class="btn btn-success">
									결제 <span class="glyphicon glyphicon-play"></span>
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>