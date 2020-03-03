<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 숙박 예약은 쌍용비앤비 - 숙소 보기</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- header -->
<link rel="stylesheet" href="res/css/header.css">
<!-- scroll moving sidebar -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script>
<script>
//scroll moving sidebar
	$(document).ready(function () {  
        var top = $('#adside').offset().top - parseFloat($('#adside').css('marginTop').replace(/auto/, 0));
        $(window).scroll(function (event) {
        	var y = $(this).scrollTop();
       		if (y >= top) {      		
        	    $('#adside').addClass('fixed');
        	} else {
           		$('#adside').removeClass('fixed');
        	}
  		});
	});
</script>
<style>
#adside.fixed {
	position:fixed;
	width: 13.5%;
	top: 0;
	margin-top:30px;
}
.previewImg{
	margin-bottom: 2%;
}
.form-control{
	padding:20px;
	margin: inherit;
	width: 84%;
}
.form-group{
	border: 1px solid gray;
}
.form-group .btn-success{
    margin-top: 10%;
    margin-bottom: 10%;
    width: 84%;
}
.info{
	text-align: center;
	margin-bottom: 10%;
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
	
	<!-- body: 숙소리스트 -->
	<section>
		<div class="container">
			<hr>
			<h3>숙소  리스트</h3>
			  <div class="col-md-9 homeList" id="homeList">
			  	<c:forEach var="list" items="${hotelList}">
			  	  <div class="col-md-6">
			  	    <a href="05?hotelNum=${list.hotelNum}">
				      <img class="col-md-12 previewImg" src="./${list.hotelImg1}" alt="" width="100%" height="100%">
				    </a>
				    <div class="info">
				      <p>방 ${list.bedRoom}개  침대 ${list.bed}개</p>
				      <p class="text-danger"><b>★ ${list.star}</b></p>
				      <label>${list.hotelName}</label>
				    </div>
			  	  </div>
			  	</c:forEach>
			  </div>
			  <div class="col-md-3">
			    <div id="adsideWrapper">
		  		  <div id="adside">
				    <form method="POST" action="04">
				      <div class="form-group" align="center">
				   	    <h3><span class="glyphicon glyphicon-search"></span> 상세 검색</h3>
				        <input type="text" class="form-control"  id="address" name="address" placeholder="목적지" value="${hotel.address}">
				        <input type="date" class="form-control" id="resv_checkin" name="resv_checkin" placeholder="체크인 날짜" value="${hotel.resv_checkin}">
				        <input type="date" class="form-control" id="resv_checkout" name="resv_checkout" placeholder="체크아웃 날짜" value="${hotel.resv_checkout}">
				        <input type="number" class="form-control" id="guest" name="guest" placeholder="인원 수" min="1" value="${hotel.guest}">
				        <button type="submit" class="btn btn-lg btn-success btn-block">검색</button>
				      </div>	   
				    </form>
				  </div>
				</div>
			  </div>
			  <br>
   		</div>
	    <br>
	</section>
	<!-- body: 숙소리스트 end -->
	
</body>
</html>