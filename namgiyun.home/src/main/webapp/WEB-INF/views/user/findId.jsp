<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />


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
<script>

var alert = function(msg, type){
	swal({
		title:'',
		text:msg,
		type:type,
		timer:1000,
		customClass:'sweet-size',
		showConfirmButton:false
	});
}

var confirm = function(msg, title){
	swal({
		  title: title,
		  text: msg,
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "로그인하러 가기",
		  cancelButtonText: "비밀번호 찾으러 가기",
		  closeOnConfirm: false,
		  closeOnCancel: true
		},
		function(isConfirm) {
		  if (isConfirm) {
			 setTimeout( swal('', '예약이 승인되었습니다.', "success"), 1500);
			 
		  }else{
			  
			  self.close(); 
		  }
			  
		});
}



function findId() {
	var userName = $('#userName').val();
	var phone = $('#phone').val();
	console.log(userName);
	console.log(phone);
	$.ajax({
		method:"post",
		url:"findId.do",			
		data: {
			userName: userName,
			phone: phone
		},
		success: function(result){
			if(result != '') confirm('', '아이디는 ' + result+'입니다.');
			else alert('회원정보를 다시 확인해주세요.!','');
		},
		error: function(a, b, errMsg){
			$("#msg").text("로그인 실패: " + errMsg);
		}
	});
}

</script>

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
							<b>아이디 찾기</b>
						</h3>
					</div>
					<div class="panel-body">
						<form accept-charset="UTF-8" role="form" id="form">
							<table class="table_info">
								<tbody>
									<tr>
										<th style="padding-right: 50px;">이
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름</th>
										<td id="nameArea"><span class="mypage_txt"
											data-modify="name"> <input type="text" id="userName" name="userName"
												placeholder=""></span></td>
									</tr>
									<tr>
										<th>휴대폰 번호</th>
										<td id="phonearea"><span class="mypage_txt"
											data-modify="phone"> <input type="text" id="phone" name="phone"
												placeholder="예) 010-1234-4567"></span></td>
									</tr>
								</tbody>
							</table>
							<br>
							<center>
								<input type="button" value="찾기" onclick="findId();" style="width: 50px;">
							</center>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>