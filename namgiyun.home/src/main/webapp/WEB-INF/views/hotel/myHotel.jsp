<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>숙소 숙박 예약은 쌍용비앤비 - 내 숙소 보기</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- header -->
<link rel="stylesheet" href="res/css/header.css">
<!-- ajax alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script>
//삭제 alert
$(document).ready(function () {
	/* $('#delete').bind('click', function(){
		swal({
			title: "숙소를 정말 삭제하시겠습니까?",
			text: "삭제한 숙소정보는 되돌릴 수 없습니다.",
			icon: "warning",
			buttons: true,
			dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  $.ajax({
				  url:'delete',
				  data:hotelNum,
				  success:function(isGood){
					  if (willDelete) {
						  swal("숙소 삭제가 완료되었습니다.", {
							  icon: "success",
						  });
					  }
				  },
				  error: function(a, b, errMsg){
					  alert(errMsg, 'error');
				  },
			  });
		  } else { }
		});
	}); */
});
</script>
<style>
.myhome{
	text-align: center;
}
.myhome p{
	margin: 4%;
}
.myhome a{
	text-decoration: none;
}
.btn{
	margin: 2%;
}
.previewImg{
	margin: 5%;
	border: 1px solid lightgray;
}
.message{
	margin: 10%;
}
</style>


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
   
   
  <!-- menu -->
	<section>
		<div class="container">

			<!-- tab menu -->
			<div class="tabbable">
				<ul class="nav nav-tabs" id="mytab" style="margin: 40px 0% 2%;">
					<li><a href="/namgiyun.home/01" style="font-size: medium;"><b>내 숙소 등록</b></a></li>
					<li class="active"><a href="/namgiyun.home/02" data-toggle="tab"
						aria-expanded="true" style="color: #303030; font-size: medium;"><b>내
								숙소 보기</b></a></li>
					<li><a href="/namgiyun.home/userReservation" data-toggle="tab"
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
		</div>
	</section>
	<!-- menu end -->	
	
	<!-- body: 숙소리스트 -->
	<section>
		<div class="container">
			<hr>
			<h3>내 숙소 보기</h3>
			  <c:forEach var="my" items="${myHotel}">
			    <div class="col-md-3 myhome">
			      <input type="hidden" value="${my.hotelNum}" id="hotelNum" name="hotelNum">
			      <a><img class="col-md-12 previewImg" src="${my.hotelImg1}" alt="" width="300" height="200"></a>
				  <p><a href="05?hotelNum=${my.hotelNum}">${my.hotelName}</a></p>
				  <button type="button" class="btn" onclick="location.href='03?hotelNum=${my.hotelNum}'">수정</button>
				  <button type="button" id="delete" class="btn btn-danger" onclick="">삭제</button>
				</div>
			  </c:forEach>
			  <c:if test="${empty myHotel}">
			  	<div class="message">
			  	  <h3 class="text-danger text-center">등록한 숙소가 없습니다</h3>
			  	</div>
			  </c:if>
   		</div>
	    <br>
	</section>
	<!-- body: 숙소리스트 end -->
</body>
</html>