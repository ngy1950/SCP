<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- sweetalert -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- end sweetalert -->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- header.css -->
<link rel="stylesheet" href="res/css/header.css">
<!-- end header.css -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
var hotelNum = ${hotelNum};
var checkIn = '';
var checkOut = '';
var resvGuest = 0;
var btDay = 0;
var check = true;

var init = function(){	
	$('#resvCheckIn').bind('change',function(){
		checkIn = $('#resvCheckIn').val();
		resvCost();
	});
	
	$('#resvCheckOut').bind('change',function(){
		checkOut = $('#resvCheckOut').val(); 
		resvCost();

	});
	$('#resvGuest').bind('change',function(){
		resvGuest = $('select[name=resvGuest]').val();
		resvCost();
	});
	
	// 예약추가 기능
	$('#reservationButton').bind('click',function(){
		if(!reserv_userInfo_check()){
			alert('필수 항목을 입력해주세요');
		}else{
			if(check){
				/* 가격 int로 변환 */
				var resvCost =  $('#resvCost').val();
				resvCost = resvCost.replace(',','');
				resvCost = resvCost.replace('원','');
			
				$.ajax({
					method:"post",
					url:"reservation.do",			
					data: {
						resvCheckIn: checkIn.getFullYear() + "-" + (checkIn.getMonth()*1+1) + "-" + checkIn.getDate(),
						resvCheckOut: checkOut.getFullYear() + "-" + (checkOut.getMonth()*1+1) + "-" + checkOut.getDate(),
						resvGuest: $('#resvGuest').val(),
						resvPhone: $('#resvPhone').val(),
						resvEmail: $('#resvEmail').val(),
						resvName: $('#resvName').val(),	
						resvComment: $('#resvComment').val(),
						resvCost: resvCost,
						hotelNum: hotelNum
					},
					success: function(result){		// result['숙소 1박 요금', '숙소 추가요금']
						alert('결제 창으로 이동합니다.');
						setTimeout(function() {
		                     location.href="/namgiyun.home/payment/01";
		                  }, 1300);
					},
					error: function(a, b, errMsg){
						alert(errMsg);
					}
				});

				alert('결제 창으로 이동합니다.');
				setTimeout(function() {
                     location.href="/namgiyun.home/payment/01";
                  }, 1300);
			}
		}
	});
}	
		
// 체크인, 체크아웃 검증 및 요금 계산
function resvCost() {
	if(checkIn && checkOut){
		checkIn = new Date(checkIn);
		checkOut = new Date(checkOut);
		
		/* 날짜 일 수 계산*/
		var stDate = new Date(checkIn.getFullYear(), checkIn.getMonth() + 1, checkIn.getDate());
	    var endDate = new Date(checkOut.getFullYear(), checkOut.getMonth() + 1, checkOut.getDate());
	    var btMs = endDate.getTime() - stDate.getTime() ;
	    btDay = btMs / (1000*60*60*24) ;
	    check = true;
	
	    // 체크아웃 날짜가  체크인보다 더 빠른 경우
		if(btDay <= 0){
			alert('날짜를 다시 확인해주세요','');
			checkIn = $('#resvCheckIn').val(''); 
			checkOut = $('#resvCheckOut').val(''); 
			checkOut = $('#resvCost').val(''); 
			check = false;
		}else{
			$.ajax({
				method:"post",
				url:"cost.do",			
				data: {
					hotelNum: hotelNum	// 호텔 번호가 들어갈 자리
				},
				success: function(result){		// result['숙소 1박 요금', '숙소 추가요금']
					if(result){
						var cost = numberWithCommas(result[0] * btDay);
						$('#resvCost').val(cost+'원');
					}else 
						alert('서버요청 실패!','');
				},
				error: function(a, b, errMsg){
					$("#msg").text("실패: " + errMsg);
				}
			});
		}
	}else return false;
} 



function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// 입력 정보 검증
function reserv_userInfo_check() {
	var resvEmail = $('#resvEmail').val();
	
	//체크인 or 체크아웃을 입력 했는지 검증
	if(checkIn == '' || checkOut == '') return false;
	
	// 예약자 정보를 입력 했는지 검증
	if(resvEmail != null && resvEmail != ''){
		var check = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	if(!check.test(resvEmail)){
    		$('#resvName').val("");
   			$('#resvName').focus();
   		 	alert('이메일 형식이 아닙니다.');
    	}
	}else {return false;}

	return true;
}

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


$(init);
</script>
</head>


<body>  
   <!-- header -->
   <nav class="navbar"  style="padding-right:3px;">
      <div class="container">
      <!--  
         <div class="navbar-header">
            <a class="navbar-brand" href="/home"><img src="res/img/logo.png"></a>
         </div>
		-->
		<div class="navbar-header">
				<a class="navbar-brand" href="/namgiyun.home"><i class="glyphicon glyphicon-home"></i></a>
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
   
	<br><br>

	<div class="content">
		<div class="container">
			<div class="row">
				<div
					class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb30 text-center">
				</div>
			</div>
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 mb30">
					<div class="tour-booking-form">
							<div class="row">
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 ">
									<h3 class="tour-form-title">꼬북이 호텔</h3>
									<hr>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="control-label required" for="select">*체크인</label>
										<div class="input-group">
											<input id="resvCheckIn" name="resvCheckIn" type="Date" placeholder="Date" class="form-control" value=""> 
											<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="control-label" for="datepicker">*인원수</label>
										<div class="select">
											<select id="resvGuest" name="resvGuest" class="form-control">
												<c:forEach begin="1" end="${guest}" step="1" var="guestCount">
													<option value='${guestCount}'>${guestCount}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="control-label required" for="select">*체크아웃</label>
										<div class="input-group">
											<input id="resvCheckOut" name="resvCheckOut" type="Date" value=""
												placeholder="Date" class="form-control" required> <span
												class="input-group-addon"><i class="fa fa-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="control-label required" for="select">가격</label>
										<div class="input-group">
											<input id="resvCost" name="resvCost" type="text" class="form-control" readonly="readonly" value=""> <span
												class="input-group-addon"><i class="fa fa-calendar"></i></span>
										</div>
									</div>
								</div>
								<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mt30">
								<br>
									<h3 class="tour-form-title">예약자 정보</h3>
									<hr>
								</div>
						<form name="reservationForm">
								<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="control-label" for="resvName">*이름</label> <input
											id="resvName" name="resvName" type="text" value="${user.userName}" class="form-control"
											required>
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="control-label" for="rsvEmail">*이메일</label> <input
											id="resvEmail" name="resvEmail" type="text" value="${user.email}"
											class="form-control" required>
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="control-label" for="resvPhone">*전화번호</label> <input
											id="resvPhone" name="resvPhone" type="text" value="${user.phone}"
											class="form-control" required>
									</div>
								</div>
								<br>
								<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="control-label" for="textarea">호스트에게 하고
											싶은 말</label>
										<textarea class="form-control" id="resvComment" name="resvComment"
											rows="4" placeholder="인원 2명 추가하고 싶어요!"></textarea>
									</div>
								</div>
								<center>
									<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
										<button type="button" name="reservationButton" id="reservationButton"
											class="btn btn-primary" style="width: 70px;">다음</button>
									</div>
								</center>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>