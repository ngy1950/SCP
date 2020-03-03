<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<!-- main header -->
<link href="./resources/css/scp_main.css" rel="stylesheet" type="text/css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- join -->
<script type="text/javascript" src="./resources/js/joinmember.js" charset="UTF-8"></script>
<link href="./resources/css/joinMember.css" rel="stylesheet">

<meta charset="UTF-8">
<title>회원가입</title>
<style>

</style>
</head>
<body>
<!-- join -->
<br><br>
<form action="joinMember.do" name="myForm" method="POST" onsubmit="return(validate());">
	<div class="container-fluid"> 
		<div class="row">
			<div class="well center-block">
				<div class="well-header">
					<h3 class="text-center text-success"> 회원가입 </h3>
					<hr>
				</div>

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-user"></i>
								</div>
								<input type="text" class="form-control" id="id" name="id" placeholder="아이디" oninput="check()" required>
								<p id="idchk"></p>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-lock"></i>
								</div>
								<input type="password" minlength="6" maxlength="20" placeholder="패스워드" oninput="check()" id="passwd" name="passwd" class="form-control">
								<p id="pwchk"></p>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-lock"></i>
								</div>
								<input type="password" minlength="6" maxlength="20" placeholder="패스워드 확인" oninput="check()" id="passwd2" name="passwd2" class="form-control">
								<p id="pwchk2"></p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-user"></i>
								</div>
								<input type="text" placeholder="이름" oninput="check()" id="name" name="name" class="form-control">
								<p id="namechk"></p>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-phone"></i>
								</div>
								<input type="number" placeholder="핸드폰 번호  -없이 입력" oninput="check()" minlength="10" maxlength="12" class="form-control" name="phone" id="phone">
								<p id="phonechk"></p>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-envelope"></i>
								</div>
								<input type="email" placeholder="이메일" oninput="check()" class="form-control" name="email" id="email">
								<p id="emailchk"></p>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-list-alt"></i>
								</div>
								<div class="row">
								  <div class="col-md-12 col-xs-12 col-sm-12">
								    <div class="input-group">
								   	 <div class="col-md-11" style="padding:0px;">
								   	 	<input type="text" class="form-control" name="zipcode" placeholder="우편번호" oninput="check()">
								   	 </div>
								      <span class="input-group-btn">
								        <button class="btn btn-default" type="button" onclick="zipCheck()">우편번호 찾기</button>
								      </span>
								    </div>
								  </div>
								</div>
								<input type="text" class="form-control" placeholder="주소" name="address" id="address">
								<p id="addchk"></p>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12">
						<div class="form-group">
							<div class="input-group">
								<div class="input-group-addon">
									<i class="glyphicon glyphicon-calendar"></i>
								</div>
								<input type="text" placeholder="생년월일  ex) 19950101" oninput="check()" name="birth" id="birth" class="form-control">
								<p id="birthchk"></p>
							</div>
						</div>
					</div>
				</div>

				<div class="row widget">
					<div class="col-md-12 col-xs-12 col-sm-12">
						<button class="btn btn-warning btn-block" id="submit"> Submit </button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

</body>
</html>