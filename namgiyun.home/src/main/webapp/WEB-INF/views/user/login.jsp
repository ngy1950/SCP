<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>	
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- header.css -->
<link rel="stylesheet" href="res/css/header.css">
<!-- end header.css -->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />


<style>
sweet-size {
	width: 320px;
	height: 200px;
}

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

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

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

function login() {
	var userId = $("#userId").val();
	var userPassword = $("#userPassword").val();
	console.log(userId,userPassword);
	
	if( !(userId && userPassword))
		alert('아이디와 패스워드를 입력해주세요.', 'warning');
	else{
		$.ajax({
			method:"post",
			url:"login.do",			
			data: {
				userId: userId,
				userPassword: userPassword
			},
			success: function(result){
				if(result){
					location.href="/namgiyun.home";
					/*
					alert('로그인 성공!','');
					setTimeout(function() {
						location.href="/namgiyun.home";
					}, 1500);
					*/
				}else 
					alert('아이디와 비밀번호를 확인해주세요!','warning');
			},
			error: function(a, b, errMsg){
				$("#msg").text("로그인 실패: " + errMsg);
			}
		});
	}
}

function findIdview() {
	var popupX = (document.body.offsetWidth / 2) - (200 / 2);
	//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY = (document.body.offsetHeight / 2) - (300 / 2);
	//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	window.open('findId', '아이디 찾기',
			'status=no, height=400, width=800, left=' + popupX + ', top='
					+ popupY);
}
function findPasswordview() {
	var popupX = (document.body.offsetWidth / 2) - (200 / 2);
	//&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY = (document.body.offsetHeight / 2) - (300 / 2);
	//&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	window.open('findPassword', '아이디 찾기',
			'status=no, height=400, width=800, left=' + popupX + ', top='
					+ popupY);
}


//<![CDATA[
// 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('9e65c0c556051605ef03c74577bfd702');		// 카카오 디벨로퍼에서 발급받은 javascript key
function loginWithKakao() {
	var userId = '';		
	var userName = '';
	var email = '';
  // 로그인 창을 띄웁니다.
  Kakao.Auth.login({
    success: function(authObj) {
      Kakao.API.request({									// 로그인 성공시, API를 호출합니다.
        url: '/v2/user/me',
        success: function(res) {							// 카카오에서 성공적으로 데이터를 받은 경우
          userId= res.id;									// 카카오에서 response받은 ID값 저장
          email = res.kakao_account.email;					// 카카오에서 response받은 email 저장
          userName = res.kakao_account.profile.nickname;	// 카카오에서 response받은 사용자 이름 저장
          
          $.ajax({											// DB에 카카오 ID가 회원가입이 되어 있는지 확인
  			method:"post",
  			url:"kLogin.do",			
  			data: {
  				userId: userId,
  				userName: userName,
  				email: email
  			},
  			success: function(result){						// DB에 카카오 ID가 존재한다면 return값은 true 로그인 처리 후 메인 페이지로 이동
  				console.log(result);
  				if(result){
  					location.href="/namgiyun.home";
  					/*
  					alert("로그인 성공!");
  					setTimeout(function() {
						location.href="/namgiyun.home";
					}, 1500);
  					*/
  				}
  				else{											 // return false일 경우 
  					alert('로그인할 수 없습니다.!','');
  					setTimeout(function() {
						location.href="/namgiyun.home/login";	// 로그인 페이지로 이동시킴. 
					}, 1500);
  				}
  			},
  			error: function(a, b, errMsg){
  				$("#msg").text("중복체크 에러: " + errMsg);
  			}
  		});
        },
        fail: function(error) {
          alert(JSON.stringify(error));
        }
      });

    },
    fail: function(err) {
      alert(JSON.stringify(err));
    }
  });
};

function kk() {
	alert('gg');
}
//]]>
</script>

</head>
<body>
	<!-- header -->
   <nav class="navbar"  style="padding-right:3px;">
      <div class="container">
       <div class="navbar-header">
            <a class="navbar-brand" href="/namgiyun.home"><img src="res/img/logo.png"></a>
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
	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title"
							style="text-align: center; font-size: 1.3em;">
							<b>LOGIN</b>
						</h3>
					</div>
					<div class="panel-body">
					<input type="hidden" id="child_value" onchange="kk();">
						<form accept-charset="UTF-8" method="POST" action="login.do" id="loginForm" name="loginForm">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="아이디" name="userId" id="userId"
										type="text">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="패스워드" id="userPassword"
										name="userPassword" type="password" value="">
								</div>
								<div class="checkbox"></div>
								<input onclick="login();"
									class="btn btn-lg btn-success btn-block" type="button"
									value="로그인"><br> </a>
							</fieldset>
						</form>
						<center style="font-size: 0.9em; color: gray;">
							<span> <a href="javascript:void(0);"
								onclick="findIdview();">아이디 찾기</a> | <a
								href="javascript:void(0);" onclick="findPasswordview();">비밀번호
									찾기</a> | <a href="join">회원가입</a>
							</span>
						</center>
						<hr />
						<a id="custom-login-btn" href="javascript:loginWithKakao()" > <img
							src="http://mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
							width="100%" height="50" />
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>