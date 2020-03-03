<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- sweetalert -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- end sweetalert -->

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">


<!-- header.css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="res/css/header.css">
<!-- end header.css -->


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

var confirm = function(msg, title, resvNum){
	swal({
		  title: title,
		  text: msg,
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "예약 취소할래요",
		  cancelButtonText: "아니요",
		  closeOnConfirm: false,
		  closeOnCancel: true
		},
		function(isConfirm) {
		  if (isConfirm) {
			  $.ajax({
					method:"get",
					url:"reservation_cancel.do",			
					data: {	
						resvNum: resvNum
					},
					success: function(result){
						$("tbody").empty();
						if(!(result == null)){
							alert('예약 취소','');
							$(result).each(function(idx,num) {
								var cost = numberWithCommas(result[idx].resvCost);
								$("tbody").append("<tr><td style='width: 210px;'><a href='05'><div style='width: 180px; height: 120px; border: 1px solid;'></div><img src='' width='180px;'></a></td><td><h3>"+result[idx].hotelName+"</h3>★★★★☆<br><h4>호스트:<span style='font-size: 0.9em; color: gray;'>&nbsp;<a href='#'>"+result[idx].userName+"</a></span></h4></td><td style='text-align: center;'><br> <br><h4>"+result[idx].resvCheckIn+" ~ "+result[idx].resvCheckOut+"</h4></td><td style='text-align: center;'><br> <br><h4>2019.11.11</h4></td><td style='text-align: center;'><br><br><h4>"+cost+"원</h4></td><td style='text-align: center;'><br> <br><h4>"+result[idx].resvState+"</h4></td><td class='text-right'><br> <br><a></a><button class='glyphicon glyphicon-remove' style='height: 40px;' value='"+result[idx].resvNum+"' onclick='reservation_cancel("+result[idx].resvNum+");'></button></td></tr>");
							});
							swal('', '예약이 취소되었습니다.', "success");
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
		});
}

function reservation_cancel(resvNum) {
	confirm('예약을 취소하시겠습니까?','예약 취소',resvNum);
}


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


function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


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

	<!-- menu -->
	<section>
	<div class="container">

		<!-- tab menu -->
		<div class="tabbable">
			<ul class="nav nav-tabs" id="mytab" style="margin: 40px 0% 2%;">
				<li><a href="/namgiyun.home/01" style="font-size: medium;"><b>내 숙소 등록</b></a></li>
				<li><a href="/namgiyun.home/02" data-toggle="tab" aria-expanded="true"
					style="color: #303030; font-size: medium;"><b>내 숙소 보기</b></a></li>
				<li class="active"><a href="/namgiyun.home/userReservation" data-toggle="tab"
					aria-expanded="true" style="color: #303030; font-size: medium;"><b>예약
							확인</b></a></li>
				<li><a href="/namgiyun.home/hostReservation" data-toggle="tab"
					aria-expanded="true" style="color: #303030; font-size: medium;"><b>호스트
							전용 예약내역</b></a></li>
				<li><a href="/namgiyun.home/customerservice/01" data-toggle="tab"
					aria-expanded="true" style="color: #303030; font-size: medium;"><b>문의내역</b></a></li>
				<li><a href="/namgiyun.home/userInfo" data-toggle="tab" aria-expanded="true"
					style="color: #303030; font-size: medium;"><b>회원정보수정</b></a></li>
			</ul>
		</div>
		<!-- tab menu end -->
		
		<div class="container mb-4">
			<div class="row">
				<h3 style="margin-left: 18px;">
					<b>예약내역</b>
				</h3>
				<hr>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">숙소</th>
									<th scope="col" class="text-center">체크인/체크아웃</th>
									<th scope="col" class="text-center">예약날짜</th>
									<th scope="col" class="text-center">결제금액</th>
									<th scope="col" class="text-center">예약현황</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${userReservation_List}" var="list">
								<tr>
									<td style='width: 210px;'><a href='05'><div
												style='width: 180px; height: 120px; border: 1px solid;'></div>
											<img src='' width='180px;'></a></td>
									<td><h3>${list.hotelName}</h3>★★★★☆<br>
										<h4>
											호스트:<span style='font-size: 0.9em; color: gray;'>
												&nbsp;<a href='#'>${list.userName}</a>
											</span>
										</h4></td>
									<td style='text-align: center;'><br> <br>
										<h4>${list.resvCheckIn} ~ ${list.resvCheckOut}</h4></td>
									<td style='text-align: center;'><br> <br>
										<h4>2019.11.11</h4></td>
									<td style='text-align: center;'><br> <br>
										<h4><fmt:formatNumber value='${list.resvCost}' pattern='#,###' />원</h4></td>
									<td style='text-align: center;'><br> <br>
										<h4>${list.resvState}</h4></td>
									<td class='text-right'><br> <br>
										<a></a>
										<button class='glyphicon glyphicon-remove'
											style='height: 40px;' value='${list.resvNum}' onclick='reservation_cancel(${list.resvNum});'></button>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
</body>
</html>