<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.company.SCP.pdetail.pdetailVO"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" content="text/html">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="resources/css/scp_main.css" rel="stylesheet" type="text/css">
<script src="resources/js/getProduct.js" type="text/javascript"
	charset="UTF-8" />

<!-- JQuery의 최신 버전을 항상 쓸 수 있다. -->
<script src="http://code.jquery.com/jquery-latest.min.js"
	charset="UTF-8" />


<script>
	
</script>
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


	<div class="container">
		<div class="row">
			<div class="col-xs-4 item-photo">
				<img style="max-width: 100%; max-height: 100%;"
					src="${product.imgpath2}" />
			</div>


			<div class="col-xs-5" style="border: 0px solid gray">

				<!-- Datos del vendedor y titulo del producto -->
				<h3>${product.pname}</h3>
				<h5 style="color: #337ab7">
					vendido por <a href="#">Samsung</a> · <small style="color: #337ab7">(5054
						ventas)</small>
				</h5>

				<!-- Precios -->
				<h6 class="title-price">
					<small style="font-size: 1.2em">가격</small>
				</h6>
				<h3 style="margin-top: 0px;">
					<b><fmt:formatNumber value="${product.pprice}" pattern="#,###" /><span
						style="font-size: 0.7em">원</span></b>
				</h3>
				<hr>
				<!-- Detalles especificos del producto -->

				<div class="section" style="padding-bottom: 20px;">
					<h6 class="title-attr">

						<select class="form-control" name="option1" id="option1">
							<option>상품을 선택하세요</option>
							<c:forEach var="pop1" items="${optionList}">
								<option value="${pop1.pname}" id="${pop1.pcode}">${pop1.poption}.${pop1.pname}
									<span style="color: gary; width: 100%;"><fmt:formatNumber
											value="${pop1.price}" pattern="#,###" />원</span>
								</option>
							</c:forEach>
						</select> <br>

						<div id="option2">
							<select class="form-control" name="option2" id="option2s">
								<option selected="selected">사이즈</option>
							</select>
						</div>

						<br>
						<div id="option3">
							<select class="form-control" name="option3" id="option3s">
								<option selected="selected">색상</option>
							</select>

						</div>
					</h6>
					<br>
					<div style="width: 150px; margin: auto;">
						<p></p>
						<div class="input-group">
							<span class="input-group-btn">
								<button type="button" class="btn btn-default btn-number"
									data-type="minus" data-field="quant[1]"
									onclick="minNum(document.getElementById('quant[1]_text').value,-1);">
									<span class="glyphicon glyphicon-minus"></span>
								</button>
							</span> <input type="text" id="quant[1]_text"
								class="form-control input-number" value="1" min="1" max="10"
								style="text-align: center;"> <span
								class="input-group-btn">
								<button type="button" class="btn btn-default btn-number"
									data-type="plus" data-field="quant[1]"
									onclick="minNum(document.getElementById('quant[1]_text').value,1);">
									<span class="glyphicon glyphicon-plus"></span>
								</button>
							</span>
						</div>
						<p></p>

					</div>
				</div>

				<!-- Botones de compra -->

				<div class="section" style="padding-bottom: 20px;">
					<button class="btn btn-success" onclick="cartInsert('${user.id}')">
						<span style="margin-right: 20px"
							class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
						장바구니 담기
					</button>
					<c:if test="${null ne user.name}">
						<h6>
							<a href="getCartList.do?id=${user.id}" style="font-size: 1em"><span
								class="glyphicon glyphicon-heart-empty" style="cursor: pointer;"></span>
								장바구니 바로가기 </a>
						</h6>
					</c:if>
					<c:if test="${null eq user.name}">
						<h6>
							<a href="login.jsp" style="font-size: 1em"><span
								class="glyphicon glyphicon-heart-empty" style="cursor: pointer;"></span>
								장바구니 바로가기 </a>
						</h6>
					</c:if>
				</div>

			</div>


			<div class="col-xs-9">
				<ul class="menu-items">
					<li class="active">Detalle del producto</li>
					<li>Garantía</li>
					<li>Vendedor</li>
					<li>Envío</li>
				</ul>
				<div style="width: 100%; border-top: 1px solid silver">

					<p style="padding: 15px;">
						<small> Stay connected either on the phone or the Web with
							the Galaxy S4 I337 from Samsung. With 16 GB of memory and a 4G
							connection, this phone stores precious photos and video and lets
							you upload them to a cloud or social network at blinding-fast
							speed. With a 17-hour operating life from one charge, this phone
							allows you keep in touch even on the go. With its built-in photo
							editor, the Galaxy S4 allows you to edit photos with the touch of
							a finger, eliminating extraneous background items. Usable with
							most carriers, this smartphone is the perfect companion for work
							or entertainment. </small>
					</p>
					<small>
						<ul>
							<li>Super AMOLED capacitive touchscreen display with 16M
								colors</li>
							<li>Available on GSM, AT T, T-Mobile and other carriers</li>
							<li>Compatible with GSM 850 / 900 / 1800; HSDPA 850 / 1900 /
								2100 LTE; 700 MHz Class 17 / 1700 / 2100 networks</li>
							<li>MicroUSB and USB connectivity</li>
							<li>Interfaces with Wi-Fi 802.11 a/b/g/n/ac, dual band and
								Bluetooth</li>
							<li>Wi-Fi hotspot to keep other devices online when a
								connection is not available</li>
							<li>SMS, MMS, email, Push Mail, IM and RSS messaging</li>
							<li>Front-facing camera features autofocus, an LED flash,
								dual video call capability and a sharp 4128 x 3096 pixel picture</li>
							<li>Features 16 GB memory and 2 GB RAM</li>
							<li>Upgradeable Jelly Bean v4.2.2 to Jelly Bean v4.3 Android
								OS</li>
							<li>17 hours of talk time, 350 hours standby time on one
								charge</li>
							<li>Available in white or black</li>
							<li>Model I337</li>
							<li>Package includes phone, charger, battery and user manual</li>
							<li>Phone is 5.38 inches high x 2.75 inches wide x 0.13
								inches deep and weighs a mere 4.59 oz</li>
						</ul>
					</small>
				</div>
			</div>
		</div>
	</div>

</body>


</html>