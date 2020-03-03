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
							<c:if test="${null ne user.name}">
								<!-- �α��� �� ���� -->
								<li class="upper-links"><a class="links" href="logout.do">
										${user.name} �α׾ƿ�</a></li>
							</c:if>
							<c:if test="${null eq user.name}">
								<!-- �α��� �� �� ���� -->
								<ul class="largenav pull-right">
									<li class="upper-links"><a class="links" href="login.jsp">�α���
									</a></li>
							</c:if>
							<li class="upper-links dropdown"><a class="links"
								href="getNoticeList.do">������</a>
								<ul class="dropdown-menu">
									<li class="profile-li"><a class="getNoticeList.do" href="">��������</a></li>
									<li class="profile-li"><a class="profile-links"
										href="q&a.jsp#tab2">���ֹ�������</a></li>
									<li class="profile-li"><a class="profile-links"
										href="q&a.jsp#tab3">1:1����</a></li>
								</ul></li>
							<c:if test="${null ne user.name}">
								<!-- �α��� �� ���� -->
								<li class="upper-links dropdown"><a class="links"
									href="mypage2.jsp">����������</a>
							</c:if>
							<ul class="dropdown-menu">
								<li class="profile-li"><a class="profile-links"
									href="mypage2.jsp">�ֹ������ȸ</a></li>
								<li class="profile-li"><a class="profile-links"
									href="http://hacksociety.tech/">���/��ȯ/��ǰ</a></li>
								<li class="profile-li"><a class="profile-links"
									href="mypage_custom_info.jsp">��������</a></li>
								<li class="profile-li"><a class="profile-links"
									href="mypage_custom_info.jsp">����Ʈ</a></li>
							</ul>
							</li>
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
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("�����Ƿ�", "UTF-8")%>">����
											�Ƿ�</a></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("�����Ƿ�", "UTF-8")%>">����
											�Ƿ�</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("�Ź�", "UTF-8")%>">�Ź�</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("���/�ð�", "UTF-8")%>">���/�ð�</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("��Ƽ", "UTF-8")%>">��Ƽ</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("��ǰ", "UTF-8")%>">��ǰ</a></li>
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

	<div class="content_main" style="padding-top: 10%; padding-left: 12%">
		<div class="mypage_wrap mypage">
			<div class="mypage_lnb fusion">
				<div class="lnb_list">
					<div class="mypage_tit">
						<h3 class="tit t_mypage">����������</h3>
					</div>
					<div class="mypage_menu">
						<ul>
							<li class="on"><a href="mypage2.jsp">�ֹ�/��� ��ȸ</a></li>

							<li><a href="mypage_custom_info.jsp">�� ���� ����</a></li>
							<li><a href="#">���� ��ǰ ���</a></li>
							<li><a href="#">�� ������</a></li>
							<li><a href="#">������</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="mypage_update">
				<h3 class="update_tit">�� ���� ����</h3>
				<table class="table_info">
					<tbody>
						<tr>
							<th>�̸�</th>
							<td id="nameArea"><span class="mypage_txt"
								data-modify="name"> <input type="text" id="_name"
									class="inpt_default disabled" value="${user.id}" disabled></span>
							</td>
						</tr>
						<tr>
							<th>�̸���</th>
							<td id="email_area"><span class="mypage_txt"
								data-modify="email"> <input type="text" id="_email"
									value="${user.email}" placeholder="��) cherry@gmail.com"></span>
						</tr>
						<tr>
							<th>�޴��� ��ȣ</th>
							<td id="phonearea"><span class="mypage_txt"
								data-modify="phone"> <input type="text" id="_phone"
									value="${user.phone}" placeholder="��) 010-1234-4567"></span></td>
						</tr>
						<tr>
							<th>�������</th>
							<td id="birtharea"><span class="input_area"
								data-modify="birth"> <input type="text" id="_birth"
									value="${user.birth}" disabled></span></td>
						</tr>
						<tr>
							<th>�ּ�</th>
							<td id="birtharea"><span class="input_area"
								data-modify="zipcode"> <input type="text" id="_zipcode"
									value="${user.zipcode}">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-default" type="button"
										onclick="zipCheck()">�����ȣ ã��</button>
							</span> <br>
							<br> <input type="text" id="_address"
								value="${user.address}" style="width: 350px"></td>
						</tr>
						<tr class="update_btn">
							<td style="float: right;"><a href="#"><input
									type="reset" value="���"></a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit"
								value="����"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>


</body>
</html>