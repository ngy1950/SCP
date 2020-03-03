<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- header.css -->
<link rel="stylesheet" href="res/css/header.css">
<!-- end header.css -->

<!-- login.css -->

<style>
.white {
	color: #000;
	background-color: #fff;
}

a {
	color: #303030;
	text-decoration: none;
}

.btn-facebook {
	color: #ffffff;
	-webkit-text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
	background-color: #2b4b90;
	*background-color: #133783;
	background-image: -moz-linear-gradient(top, #3b5998, #133783);
	background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#3b5998),
		to(#133783));
	background-image: -webkit-linear-gradient(top, #3b5998, #133783);
	background-image: -o-linear-gradient(top, #3b5998, #133783);
	background-image: linear-gradient(to bottom, #3b5998, #133783);
	background-repeat: repeat-x;
	border-color: #133783 #133783 #091b40;
	border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff3b5998',
		endColorstr='#ff133783', GradientType=0);
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
}

.btn-facebook:hover, .btn-facebook:focus, .btn-facebook:active,
	.btn-facebook.active, .btn-facebook.disabled, .btn-facebook[disabled] {
	color: #ffffff;
	background-color: #133783 !important;
	*background-color: #102e6d !important;
}

.btn-facebook:active, .btn-facebook.active {
	background-color: #0d2456\9 !important;
}
</style>
<!-- end login.css -->


</head>
<body>
	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title"
							style="text-align: center; font-size: 1.3em;">
							<b>비밀번호 찾기</b>
						</h3>
					</div>
					<div class="panel-body">
						<form accept-charset="UTF-8" role="form">
							<table class="table_info">
								<tbody>
									<tr>
										<th style="padding-right: 50px;">아&nbsp;&nbsp;이&nbsp;&nbsp; 디</th>
										<td id="nameArea"><span class="mypage_txt"
											data-modify="name"> <input type="text" id="name"
												placeholder=""></span></td>
									</tr>
									<tr>
										<th>휴대폰 번호</th>
										<td id="phonearea"><span class="mypage_txt"
											data-modify="phone"> <input type="text" id="phone"
												placeholder="예) 010-1234-4567"></span></td>
									</tr>
								</tbody>
							</table>
							<br>
							<center>
								<input type="button" value="찾기" onclick="kk();" style="width: 50px;">
							</center>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>