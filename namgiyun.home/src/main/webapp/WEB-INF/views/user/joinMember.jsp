<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- header -->
<link rel="stylesheet" href="res/css/header.css">
<!-- header end -->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<!-- join.css-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
.well {
	padding: 35px;
	padding-left: 30px;
	margin: 2% auto 0;
	width: 450px;
}

.container-fluid {
	padding-bottom: 4%;
}

.form-control {
	border: 0px;
}

p {
	background-color: white;
	padding: 0px;
	margin: 0px;
	"
}

.input-group-addon {
	background-color: #3c763d6b;
	color: black;
}

.btn btn-secondary {
	border: 1px solid;
	border-radius: 7px;
	margin-right: 12px;
	padding: 4px;
	font-size: small;
}

sweet-size {
	width: 320px;
	height: 200px;
}
</style>
<!-- end join.css -->

<script>
var idchk_result = false;
var phonechk_result = false;
var emailchk_result = false;
var birthchk_result = false;

//쓰기 작업 결과 출력창을 띄운다.
var alert = function(msg, type){
	swal({
		title:'',
		text:msg,
		type:type,
		timer:1500,
		customClass:'sweet-size',
		showConfirmButton:false
	});
}




function join() {
	var userId = $("#userID").val();
	var userPassword = $("#userPassword").val();
	var userPassword2 = $("#userPassword2").val();
	var userName = $("#userName").val();
	var phone = $("#phone").val();
	var email = $("#email").val();
	var birth = $("#birth").val();
	console.log(userPassword, userPassword2);
	console.log(userId, userPassword, userName, phone, email, birth);
	
	
	if(userPassword != userPassword2)
		alert("비밀번호가 일치하지 않습니다.",'warning');
	else{
		if(!(userId && userName && phone && email && birth))
			alert('모든 항목을 입력해주세요.');
		else{
			var queryString = userId + userPassword + userName + phone + email + birth;
			if(!idchk_result){
				alert('아이디를 확인해주세요.');
				return false;
			}
			if(!emailchk_result){
				alert('이메일을 확인해주세요.');
				return false;
			}
			if(!phonechk_result){
				alert('전화번호를 확인해주세요.');
				return false;
			}
			if(!birthchk_result){
				alert('생년월일을 확인해주세요.');
				return false;
			}
			$.ajax({
				method:"post",
				url:"join.do",			
				data: {
					userId: userId,
					userPassword: userPassword,
					userName: userName,
					phone: phone,
					email: email,
					birth: birth
				},
				success: function(result){
					if(result){
						alert('회원가입 성공!','');
						setTimeout(function() {
							location.href="/namgiyun.home/login";
						}, 1300);
					}else 
						alert('아이디와 비밀번호를 확인해주세요!','warning');

				},
				error: function(a, b, errMsg){
					$("#msg").text("회원가입 실패: " + errMsg);
				}
			});
		}
	}
}
function idCheck() {
	var userId = $("#userID").val();
	console.log(userId);
	if(userId){
		$.ajax({
			method:"get",
			url:"idCheck.do",			
			data: {
				userId: userId
			},
			success: function(result){
				console.log(result);
				if(result){
					$("#idchk").empty();
					$("#idchk").append("이미 존재하는 아이디입니다.");
					idchk_result = false;
				}else{
					$("#idchk").empty();
					idchk_result = true;
				}
					
			},
			error: function(a, b, errMsg){
				$("#msg").text("중복체크 에러: " + errMsg);
			}
		});
	}
}

function pwchk() {
	var userPassword = $("#userPassword").val();
	var userPassword2 = $("#userPassword2").val();
	
	if(!(userPassword == userPassword2)){
		$("#pwchk2").empty();
		$("#pwchk2").append("비밀번호가 일치하지 않습니다.");
	}else
		$("#pwchk2").empty();
}

$(function(){
    $("#phone").on('keydown', function(e){
       // 숫자만 입력받기
        var trans_num = $(this).val().replace(/-/gi,'');
		var k = e.keyCode;
				
		if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) )){
  	 	   e.preventDefault();
		}
    	}).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
        	if($(this).val() == '') return;

        	// 기존 번호에서 - 를 삭제합니다.
        	var trans_num = $(this).val().replace(/-/gi,'');
      
        	// 입력값이 있을때만 실행합니다.
        	if(trans_num != null && trans_num != ''){
           	 	// 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
            	if(trans_num.length==11 || trans_num.length==10) {   
               	 // 유효성 체크
               	 var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
                 if(regExp_ctn.test(trans_num)){
                   	 // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
                   	 trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
                   	 $(this).val(trans_num);
                     $("#phonechk").empty();
                     phonechk_result  = true;
               	 	}
               	 else{
               			$("#phonechk").empty();
            			$("#phonechk").append("유효하지 않은 전화번호 입니다.");
                    	$(this).val("");
                    	$(this).focus();
                    	phonechk_result  = false;
                	}
            	}
            	else 
            	{ 		
            		$("#phonechk").empty();z
        			$("#phonechk").append("유효하지 않은 전화번호 입니다.");
                	$(this).val("");
               		$(this).focus();
               		phonechk_result  = false;
               		
          	  }
    	  }
  	});
    
    
    $("#email").on('keydown', function(e){
    	
    }).on('blur', function(){
    	if($(this).val() == '') return;
    	
    	var check = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	var email = $("#email").val();
    	if(check.test(email)){
   		 	$("#emailchk").empty();
   		 	emailchk_result = true;
   		 }else{
   			$("#emailchk").empty();
   		 	$("#emailchk").append("적합하지 않은 이메일 형식입니다.");
   		 	$(this).val("");
   			$(this).focus();
   		 	emailchk_result = false;
   		 }
    });	
    
    
    $("#birth").on('keydown', function(e){
    	
    }).on('blur', function(){
    	if($(this).val() == '') return;
    	
    	var birth = $("#birth").val();
    	if(birth.length == 8){
    		$("#birthchk").empty();
    		birthchk_result  = true;
    	}else{
    		$("#birthchk").empty();		
    		$("#birthchk").append("양식을 지켜주세요. ex)19950209");
    		$(this).val("");
    		$(this).focus();
    		birthchk_result = false;
    	}
    });	
    
});


</script>

<meta charset="UTF-8">
<title>회원가입</title>
<style>
</style>
</head>
<body>
	<!-- header -->
	<nav class="navbar" style="padding-right: 3px;">
		<div class="container">
			<!--  
         <div class="navbar-header">
            <a class="navbar-brand" href="/home"><img src="res/img/logo.png"></a>
         </div>
		-->
			<div class="navbar-header">
				<a class="navbar-brand" href="/namgiyun.home"><i
					class="glyphicon glyphicon-home"></i></a>
			</div>

			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${null ne user.userName}">
						<li><a href="/namgiyun.home/logout.do">${user.userName}님
								로그아웃</a></li>
					</c:if>
					<c:if test="${null eq user.userName}">
						<li><a href="/namgiyun.home/login">Login</a></li>
					</c:if>
					<li><a href="/namgiyun.home/04">House & Room</a></li>
					<c:if test="${null ne user.userName}">
						<li><a href="/namgiyun.home/01">Mypage</a></li>
					</c:if>
					<li><a href="/namgiyun.home/customerservice/04">Help</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- header end -->


	<!-- join -->
	<br>
	<br>

	<form action="join.do" id="myForm" name="myForm" method="POST">
		<div class="container-fluid">
			<div class="row">
				<div class="well center-block">
					<div class="well-header">
						<h3 class="text-center text-success">회원가입</h3>
						<hr>
					</div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="form-group">
								<div class="input-group">
									<div class="input-group-addon">
										<i class="glyphicon glyphicon-user"></i>
									</div>
									<input type="text" class="form-control" id="userID"
										name="userID" placeholder="아이디" oninput="idCheck();">
									<p id="idchk" style="color: red; font-size: 0.9em;"></p>
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
									<input type="password" minlength="6" maxlength="20"
										placeholder="패스워드" id="userPassword" name="userPassword"
										class="form-control">
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
									<input type="password" minlength="6" maxlength="20"
										placeholder="패스워드 확인" id="userPassword2" name="userPassword2"
										oninput="pwchk();" class="form-control">
									<p id="pwchk2" style="color: red; font-size: 0.9em;"></p>
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
									<input type="text" placeholder="이름" id="userName"
										name="userName" class="form-control" value="">
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
									<input type="tel" placeholder="핸드폰 번호  ex) 010-1234-1234"
										name="phone" id="phone" minlength="10" maxlength="13"
										oninput="" class="form-control">
									<p id="phonechk" style="color: red; font-size: 0.9em;"></p>
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
									<input type="email" placeholder="이메일" class="form-control"
										name="email" id="email" oninput=" ">
									<p id="emailchk" style="color: red; font-size: 0.9em;"></p>
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
									<input type="text" placeholder="생년월일  ex) 19950101"
										name="birth" id="birth" minlength="8" maxlength="8"
										oninput="" class="form-control">
									<p id="birthchk" style="color: red; font-size: 0.9em;"></p>
								</div>
							</div>
						</div>
					</div>

					<div class="row widget">
						<div class="col-md-12 col-xs-12 col-sm-12">
							<button type="button" class="btn btn-block" onclick="join();">회원가입</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>