<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="resources/css/scp_main.css" rel="stylesheet" type="text/css">
<script src="resources/js/getProduct.js" charset="UTF-8"></script>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-xs-4 item-photo" style="width: 450px; height: 450px;">
				<img style="max-width: 100%;" src="${product.imgpath2}" />
			</div>
			<div class="col-xs-5" style="border: 0px solid gray">
				<form name="cartproc" method="POST" action="cartinsert.do">
					<!-- Datos del vendedor y titulo del producto -->
					<h3>${product.pname}</h3>
					<h5 style="color: #337ab7">
						<small>${product.ptext}</small>
					</h5>

					<!-- Precios -->
					<h6 class="title-price">
						<small>Promotion price</small>
					</h6>
					<h3 style="margin-top: 0px;">
						<b><fmt:formatNumber value="${product.pprice}" pattern="#,###" />원</b>
					</h3>

					<!-- Detalles especificos del producto -->
					<!-- <div class="section">
					<h6 class="title-attr" style="margin-top: 15px;">
						<small style="font-size: 1.2em">COLOR</small>
					</h6>
					<div>
						<div class="attr" style="width: 25px; background: #5a5a5a;"></div>
						<div class="attr" style="width: 25px; background: white;"></div>
					</div>
				</div>
				<div class="section" style="padding-bottom: 5px;">
					<h6 class="title-attr">
						<small style="font-size: 1.2em">SIZE</small>
					</h6>
					<div>
						<div class="attr2">95</div>
						<div class="attr2">100</div>
						<div class="attr2">105</div>
					</div>
				</div> -->

					<div class="section" style="padding-bottom: 20px;">
						<h6 class="title-attr">
							<select class="form-control" id="totalop" onchange="itemChange()">
								<option>상품을 선택하세요</option>
								<c:forEach var="pop" items="${optionList}">
									<option value="${pop.pname}" id="">${pop.pname}</option>
								</c:forEach>
							</select> <br>
							<div id="colorop">
								<select class="form-control">
									<option>색상</option>
									<c:forEach var="pop" items="${optionList}">
										<option value="${pop.color}">${pop.color}</option>
									</c:forEach>
								</select>
							</div>
							<br>
							<div id="sizeop">
								<select class="form-control">
									<option>사이즈</option>
									<c:forEach var="pop" items="${optionList}">
										<option value="${pop.size}">${pop.size}</option>
									</c:forEach>
								</select>
							</div>
						</h6>
						<div>
							<div class="btn-minus">
								<span class="glyphicon glyphicon-minus"></span>
							</div>
							<input type="text" name="count" value="1" />
							<div class="btn-plus">
								<span class="glyphicon glyphicon-plus"></span>
							</div>
						</div>
					</div>

					<!-- Botones de compra -->
					<div class="section" style="padding-bottom: 20px;">
						<a href="cartinsert.do?pcode=${product.pcode}">
							<div>
								<input class="btn btn-success" type="submit"> <span
									style="margin-right: 20px"
									class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>
								장바구니 담기
							</div>
						</a>
						<h6>
							<a href="cart.jsp" style="font-size: 1em"> <span
								class="glyphicon glyphicon-heart-empty" style="cursor: pointer;"></span>
								장바구니 바로가기
							</a>
						</h6>
					</div>
					<!-- section end -->
				</form>
			</div>

		</div>
	</div>


</body>
</html>