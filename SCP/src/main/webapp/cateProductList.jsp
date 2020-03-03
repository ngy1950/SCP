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
  <!-- ��� -->
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


					<!-- ��� �޴��� -->
				<div class="row row1">
					<ul class="largenav pull-right">
						<c:if test="${null ne user.name}">		<!-- �α��� �� ���� -->
							<li class="upper-links"><a class="links" href="logout.do">
									${user.name} �α׾ƿ�</a></li>
						</c:if>
						<c:if test="${null eq user.name}">		<!-- �α��� �� �� ���� -->
							<ul class="largenav pull-right">
								<li class="upper-links"><a class="links" href="login.jsp">�α���
								</a></li>
						</c:if>
						<li class="upper-links dropdown"><a class="links"
							href="getNoticeList.do">������</a>
							<ul class="dropdown-menu">
								<li class="profile-li"><a class="getNoticeList.do"
									href="">��������</a></li>
								<li class="profile-li"><a class="profile-links"
									href="q&a.jsp#tab2">���ֹ�������</a></li>
								<li class="profile-li"><a class="profile-links"
									href="q&a.jsp#tab3">1:1����</a></li>
							</ul></li>
						<li class="upper-links dropdown"><a class="links"
							href="mypage2.jsp">����������</a>
							<ul class="dropdown-menu">
								<li class="profile-li"><a class="profile-links"
									href="mypage2.jsp">�ֹ������ȸ</a></li>
								<li class="profile-li"><a class="profile-links"
									href="http://hacksociety.tech/">���/��ȯ/��ǰ</a></li>
								<li class="profile-li"><a class="profile-links"
									href="mypage_custom_info.jsp">��������</a></li>
								<li class="profile-li"><a class="profile-links"
									href="mypage_custom_info.jsp">����Ʈ</a></li>
							</ul></li>
						<li class="upper-links"><a class="links"
							href="http://clashhacks.in/">��ٱ���</a></li>
					</ul>
				</div>

				<div align="center">
					<a href="index.do"><img src="resources/img/���θ� ���ι��/logo1.png"></a>
					<div class="mb-3">
						<input type="text" style="width: 87%; height: auto; margin: 0px;"
							class="input-lg" placeholder="�˻��� ��ǰ�� �Է����ּ���." name="searchText">
						<input class="btn btn-outline-secondary"
							style="height: 50px; margin: 0px; width: auto; text-align: left;"
							type="submit" value="�˻�">
					</div>
				</div>


				<!--iCON Ÿ�� ��� -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-left" style="margin-left: 15px;">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">��ǰ ī�װ�<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="getCategory.do?category=<%= URLEncoder.encode("�����Ƿ�", "UTF-8") %>">���� �Ƿ�</a></li>
		                        <li><a href="getCategory.do?category=<%= URLEncoder.encode("�����Ƿ�", "UTF-8") %>">���� �Ƿ�</a></li>
		                        <li class="divider"></li>
		                        <li><a href="getCategory.do?category=<%= URLEncoder.encode("�Ź�", "UTF-8") %>">�Ź�</a></li>
		                        <li class="divider"></li>
		                        <li><a href="getCategory.do?category=<%= URLEncoder.encode("���/�ð�", "UTF-8") %>">���/�ð�</a></li>
		                        <li class="divider"></li>
		                        <li><a href="getCategory.do?category=<%= URLEncoder.encode("��Ƽ", "UTF-8") %>">��Ƽ</a></li>
		                        <li class="divider"></li>
		                        <li><a href="getCategory.do?category=<%= URLEncoder.encode("��ǰ", "UTF-8") %>">��ǰ</a></li>
							</ul></li>
						<li><a href="#">����Ʈ ��ǰ</a></li>
						<li><a href="#">NEW ��ǰ</a></li>
						<li><a href="#">�ؿ�����</a></li>
						<li><a href="#">������</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</form>
	<!-- ��� �� -->
   
   <!-- ��ǰ ��� -->
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
                              pattern="#,###" />��</b> <small
                           style="color: gray; font-size: 0.7em;">|
                           ${product.sale}�� ����</<small>
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
							<li class="foot_etc company"><a href="#">����Ұ�</a></li>
							<li class="foot_etc private"><a href="#">��������ó����ħ</a></li>
							<li class="foot_etc document"><a href="#">�̿���</a></li>
							<li class="foot_etc elect"><a href="#">���ڱ����ŷ����</a></li>
							<li class="foot_etc custom"><a href="#">������</a></li>
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
										<span class="title_1">������</span> <span class="phone">1588
											- 8204</span>
									</dt>
									<dd>���� 9:00 ~ 18:00</dd>
									<dd>�ָ�/������ 10:00 ~ 17:00</dd>

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
		// ȭ�� ũ�Ⱑ ����� �� ���� �������� ����� �����Ѵ�.
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