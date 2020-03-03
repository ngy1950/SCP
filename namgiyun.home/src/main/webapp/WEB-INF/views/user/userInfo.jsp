<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- sweetalert -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- end sweetalert -->


<!-- header.css -->
<link rel="stylesheet" href="res/css/header.css">
<!-- end header.css -->

<!------ Include the above in your HEAD tag ---------->

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<!-- ajax -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- end ajax -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>
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
            		$("#phonechk").empty();
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
    
    $("#update_button").on('click', function(e){
    	var userName = $("#name").val();
    	var userPassword = $("#password").val();
    	var email = $("#email").val();
    	var phone = $("#phone").val();
    	
    	$.ajax({
			method:"post",
			url:"/namgiyun.home/userInfoUpdate.do",			
			data: {
				userPassword: userPassword,
				userName: userName,
				phone: phone,
				email: email
			},
			success: function(result){
				if(result){
					alert('수정 성공!','');
					setTimeout(function() {
						location.href="/namgiyun.home/userInfo";
					}, 1300);
				}else 
					alert('아이디와 비밀번호를 확인해주세요!','warning');

			},
			error: function(a, b, errMsg){
				$("#msg").text("회원가입 실패: " + errMsg);
			}
		});
    });
    
	$("#update_esc").on('click', function(e){
		location.href="/namgiyun.home/01";
    });
});

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

</script>
<title>Insert title here</title>
</head>
<body>
	<!-- header -->
	<link rel="stylesheet" href="res/css/header.css">
	<!-- end header -->
<body>
	<!-- header -->
   <nav class="navbar"  style="padding-right:3px;">
      <div class="container">
 
         <div class="navbar-header">
            <a class="navbar-brand" href="/home"><img src="res/img/logo.png"></a>
         </div>

			
         <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <c:if test="${null ne user.userName}">
                 	<li><a href="/namgiyun.home/logout.do">${user.userName}님 로그아웃</a></li>
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
	
	<!-- menu -->
	<section>
	
	<div class="container">

		<!-- tab menu -->
		<div class="tabbable">
			<ul class="nav nav-tabs" id="mytab" style="margin: 40px 0% 2%;">
				<li><a href="01" style="font-size: medium;"><b>내 숙소 등록</b></a></li>
				<li><a href="02" data-toggle="tab" aria-expanded="true"
					style="color: #303030; font-size: medium;"><b>내 숙소 보기</b></a></li>
				<li><a href="userReservation" data-toggle="tab"
					aria-expanded="true" style="color: #303030; font-size: medium;"><b>예약
							확인</b></a></li>
				<li><a href="hostReservation" data-toggle="tab"
					aria-expanded="true" style="color: #303030; font-size: medium;"><b>호스트
							전용 예약내역</b></a></li>
				<li><a href="customerservice/01"
					data-toggle="tab" aria-expanded="true"
					style="color: #303030; font-size: medium;"><b>문의내역</b></a></li>
				<li class="active"><a href="userInfo" data-toggle="tab" aria-expanded="true"
					style="color: #303030; font-size: medium;"><b>회원정보수정</b></a></li>
			</ul>
		</div>
		<!-- tab menu end -->
		
		
		<div style="width: 520px; float: left;"></div><br><br>
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<section>
					<h3 class="" style="text-align: left;">
						<span style="margin-left: 0px;">회원정보</span>
					</h3>
					<hr>
					<form class="form-horizontal" method="post" name="signup"
						id="signup" enctype="multipart/form-data">

						<div class="form-group">
							<label class="control-label col-sm-2">이름</label>
							<div class="col-md-5 col-sm-8">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-user"></i></span> <input type="text"
										class="form-control" name="name" id="name" value="${user.userName}">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2">비밀번호</label>
							<div class="col-md-5 col-sm-8">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input type="password"
										class="form-control" name="password" id="password" value="${user.userPassword}">
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2">이메일</label>
							<div class="col-md-8 col-sm-9">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-envelope"></i></span> <input type="email"
										class="form-control" name="email" id="email" value="${user.email}">
										<p id="emailchk"></p>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-sm-2">휴대폰 번호</label>
							<div class="col-md-8 col-sm-9">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-phone"></i></span> <input type="text"
										class="form-control" name="phone" id="phone" value="${user.phone}">
										<p id="phonechk"></p>
								</div>
							</div>
						</div>
	
						<div class="form-group">
							<label class="control-label col-sm-2">생년월일</label>
							<div class="col-md-8 col-sm-9">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-phone"></i></span> <input type="number"
										class="form-control" name="birth" id="birth" value="${user.birth}"
										readonly="readonly">
								</div>
							</div>
						</div>
						<!-- 
						<div class="form-group">
							<label class="control-label col-sm-2">주소</label>
							<div class="col-md-8 col-sm-9">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-list-alt"></i></span> <input type="text"
										readonly="readonly" class="form-control" name="zipcode"
										oninput="check()"><span class="input-group-btn">
										<button class="btn btn-secondary" type="button"
											onclick="zipCheck()"
											style="border-radius: 7px; margin-left: 12px; padding: 4px; font-size: small;">우편번호
											찾기</button>
									</span>
								</div>
								<input type="text" class="form-control" name="address"
									id="address" readonly="readonly">
								<p id="addchk">
							</div>
							 -->
						</div>
					</form>
					<center>
						<button class="btn btn-secondary" type="button" id="update_esc"
							style="border-radius: 7px; margin-left: 12px; padding: 4px; font-size: small; width: 60px;">
							<b>취 소</b></b>
						</button>
						<button class="btn btn-secondary" type="button" id="update_button"
							style="border-radius: 7px; margin-left: 18px; padding: 4px; font-size: small; width: 60px;">
							<b>수 정</b>
						</button>
					</center>
				</div>
			</div>
		</div>
</body>
</html>