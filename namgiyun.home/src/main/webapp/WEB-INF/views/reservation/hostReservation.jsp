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

<!-- header.css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="res/css/header.css">
<!-- end header.css -->


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script>

var confirm = function(msg, title, resvNum){
	swal({
		  title: title,
		  text: msg,
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "승인",
		  cancelButtonText: "거절",
		  closeOnConfirm: false,
		  closeOnCancel: true
		},
		function(isConfirm) {
		  if (isConfirm) {
			  swal('', '예약이 승인되었습니다.', "success");
			  /*
			  $.ajax({
					method:"get",
					url:"permit.do",			
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
			  */
		  }
		});
}


function permitButton() {
	confirm('', '예약을 승인할까요?');
}


</script>

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
				<li><a href="01" style="font-size: medium;"><b>내 숙소 등록${hostReservations.resvName}</b></a></li>
				<li><a href="02" data-toggle="tab" aria-expanded="true"
					style="color: #303030; font-size: medium;"><b>내 숙소 보기</b></a></li>
				<li><a href="userReservation" data-toggle="tab"
					aria-expanded="true" style="color: #303030; font-size: medium;"><b>예약
							확인</b></a></li>
				<li class="active"><a href="hostReservation" data-toggle="tab"
					aria-expanded="true" style="color: #303030; font-size: medium;"><b>호스트
							전용 예약내역</b></a></li>
				<li><a href="customerservice/01" data-toggle="tab"
					aria-expanded="true" style="color: #303030; font-size: medium;"><b>문의내역</b></a></li>
				<li><a href="userInfo" data-toggle="tab" aria-expanded="true"
					style="color: #303030; font-size: medium;"><b>회원정보수정</b></a></li>
			</ul>
		</div>
	</div>
	</section>
	<!-- tab menu end -->
		<div class="container">
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
									<th scope="col" class="text-center">예약자</th>
									<th scope="col" class="text-center">체크인/체크아웃</th>
									<th scope="col" class="text-center">예약날짜</th>
									<th scope="col" class="text-center">결제금액</th>
									<th scope="col" class="text-center">예약현황</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${hostReservation}" var="list">
								<tr>
									<td style="width: 210px;"><a href="05">
											<img src="res/img/hotel/1.jpg" width="180px;"></a></td>
									<td><h3>${list.hotelName}</h3><hr>
										<h4>
											호스트:<span style="font-size: 0.9em; color: gray;">
												&nbsp;<a href="#">${user.userName}</a>
											</span>
										</h4></td>
									<td style="text-align: center;"><br>	
										<h4>${list.resvName}</h4> <b>${list.resvPhone}</b></td>
									<td style="text-align: center;"><br> <br>
										<h4>${list.resvCheckIn} ~ ${list.resvCheckOut}</h4></td>
									<td style="text-align: center;"><br> <br>
										<h4>2019.11.11</h4></td>
									<td style="text-align: center;"><br> <br>
										<h4><fmt:formatNumber value='${list.resvCost}' pattern='#,###' />원</h4></td>
									<td style="text-align: center;"><br> <br>
										<h4>${list.payState}</h4></td>
									<td class="text-right"><br> <br>
										<button class="glyphicon glyphicon-ok" style="height: 40px;" onclick="permitButton();"></button></td>
								</tr>
							</c:forEach>
							</tbody>
							
						</table>
					</div>
				</div>
			</div>
		</div>

		<div></div>
		<div class="col-md-12">
			<iframe src="calender" height="810px;" width="100%;" frameborder="0"></iframe>
		</div>
</body>
</html>