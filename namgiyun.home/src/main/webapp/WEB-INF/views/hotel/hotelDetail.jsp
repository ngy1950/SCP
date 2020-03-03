<%@page import="namgiyun.home.user.domain.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>숙소 숙박 예약은 쌍용비앤비 - 숙소 보기</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- header -->
<link rel="stylesheet" href="res/css/header.css">
<!-- alert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- icon -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- scroll -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=32cf99eac6020f5977b594ee3f336459&libraries=services"></script>
<script>
//경고창
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
$(window).scroll(function (event) {
    var y = $(this).scrollTop();
    //console.log(top)
    //console.log(y)
    if ( y <= 1400 && y >=600) {
    	$('#adside').removeClass('stick');
        $('#adside').addClass('fixed');
    }else if(y < 600){
	   $('#adside').removeClass('fixed');
	   $('#adside').removeClass('stick');
   }else{
	   $('#adside').removeClass('fixed');
	   $('#adside').addClass('stick');
   }
});

//image big click event
$(document).ready(function (e){
	$(document).on("click",".previewImgList img",function(){
		var path = $(this).attr('src')
		showImage(path);
	});
    
	function showImage(fileCallPath){
		$("#bigPictureWrapper").css("display","flex").show();
		$("#bigPicture")
		.html("<img src='"+fileCallPath+"'>")
	}
		  
	$("#bigPictureWrapper").on("click", function(e){
		console.log("click");
		$("#bigPicture").animate({opacity: '0'}, 300);
		setTimeout(function(){
		    $("#bigPictureWrapper").hide();
		    $("#bigPicture").animate({opacity: '1'}, 100);
		}, 300);
	});
});

//요금정보
$(document).ready(function(){
	var session = "<%= session.getAttribute("user") %>"
	console.log(session);
    $("#cost").click(function(){
    	if(resvCost())
    		$("#costInfo").fadeIn(600);
    });
    $("#reservaion").click(function(){
    	var guest = $('#resvGuest').val()
    	console.log(guest);
    	if(session == 'null'){
        	alert("예약을 이용하려면 로그인하세요.", "warning");
        	setTimeout(function() {
            	location.href='login';
            }, 1500);
        }else if(guest == "")
        	alert("인원 수를 입력하세요.", "warning");
        else
        	location.href='booking?hotelNum=${hotelInfo.hotelNum}';
    });
    
  	//image big click event
	$(document).on("click",".previewImgList img",function(){
		var path = $(this).attr('src')
		showImage(path);
	});
    
	function showImage(fileCallPath){
		$("#bigPictureWrapper").css("display","flex").show();
		$("#bigPicture")
		.html("<img src='"+fileCallPath+"'>")
	}
		  
	$("#bigPictureWrapper").on("click", function(e){
		console.log("click");
		$("#bigPicture").animate({opacity: '0'}, 300);
		setTimeout(function(){
		    $("#bigPictureWrapper").hide();
		    $("#bigPicture").animate({opacity: '1'}, 100);
		}, 300);
	});
});

    
	// 체크인, 체크아웃 검증 및 요금 계산
	function resvCost() {
	      checkIn = new Date();
	      checkOut = new Date();
	      
	      /* 날짜 일 수 계산*/
	      var stDate = new Date($('#resvCheckIn').val());
	      var endDate = new Date($('#resvCheckOut').val());
	      var btMs = endDate.getTime() - stDate.getTime();
	      btDay = btMs / (1000*60*60*24);
	      check = true;
	   
	      // 체크아웃 날짜가  체크인보다 더 빠른 경우
	      if(btDay <= 0){
	         alert('날짜를 다시 확인해주세요','warning');
	         checkIn = $('#resvCheckIn').val(''); 
	         checkOut = $('#resvCheckOut').val(''); 
	         checkOut = $('#resvCost').val(''); 
	         check = false;
	      }else{
	         $.ajax({
	            method:"post",
	            url:"cost.do",
	            data: {
	               hotelNum:$('#hotelNum').val()   // 호텔 번호가 들어갈 자리
	            },
	            success: function(result){      // result['숙소 1박 요금', '숙소 추가요금']
	               if(result){
	                  var cost = numberWithCommas(result[0] * btDay);
	                  if(cost == "NaN"){
	                	  alert('날짜를 다시 확인해주세요.', 'warning');
	                	  cost = 0;
	                  }
	                  $('#resvCost').val(cost+'원');
	               }else 
	                  alert('서버요청 실패!','');
	            },
	            error: function(a, b, errMsg){
	               $("#msg").text("실패: " + errMsg);
	            }
	         });
	      }
	      return check;
	}
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
<style>
.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top:0%;
	width:100%;
	height:100%;
	z-index: 100;
	background:rgba(255,255,255,0.5);
}
.bigPicture {
	position: relative;
	display:flex;
	justify-content: center;
	align-items: center;
}
#adside{
	width: 600px;
}
#adside.fixed {
	position:fixed;
	top: 0;
	margin-top:10px;
}
.stick{
	position:absolute;
	top:900px;
}
.left{
	margin-top: 2%;
	margin-bottom: 4%;
}
/* .right{

} */
p{
	margin: 3%;
	font-size: large;
}
.form-control{
	padding:20px;
}
#checkIn{
	float: left;
	width: auto;
}
#checkOut{
	width: auto;
}
.form-group{
	border: 1px solid gray;
	padding: 5%;
    margin: 10%;
}
.form-group .btn-success{
	margin: auto;
    margin-top: 10%;
    margin-bottom: 10%;
}
.svg-inline--fa.fa-w-18, .svg-inline--fa.fa-w-16, .svg-inline--fa.fa-w-14, .svg-inline--fa.fa-w-13 {
    width: 1.25em;
}
.location label{
	margin-left: 10%;
    margin-top: 3%;
}
.review-title{
   width: 583px;
   margin-bottom: 25px;
   margin-top: 25px;
}

.title-detail{
    float: left;
    align-content: center;
    margin: 15px;
    border: 1px solid;
    border-radius: 10px;
    padding: 10px 50px 10px 50px;
    background-color: #4caf5033;
    border-color: #4caf508a;
}
.review-dtail{
   width: 584px;
}
.review-dtail textarea{
   border-radius: 15px;
   padding: 20px;
}
.review-btn{
   width: 32%;
}
.btn-dtail{
   float: right;
   margin-top: 10px;
}
b{
   font-size: large;
}
.review-info{
   width: 40%;
   float:left;
}
#cost{
	width: 45%;
	display: inline;
}
#reservaion{
	width: 45%;
	float: right;
}
</style>

<body>  
  <!-- header -->
   <nav class="navbar">
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

	<div class="bigPictureWrapper" id="bigPictureWrapper">
		<div class="bigPicture" id="bigPicture">
		</div>
	</div>
	<div class="container">
	  <hr>
	  <div class="previewImgList">
	    <a><img class="col-md-4 previewImg" src="./${hotelInfo.hotelImg1}" width="400" height="400"></a>
	    <c:if test="${hotelInfo.hotelImg2 ne null}">
	      <a><img class="col-md-4 previewImg" src="./${hotelInfo.hotelImg2}" width="400" height="400"></a>
	    </c:if>
	    <c:if test="${hotelInfo.hotelImg2 eq null}">
	      <a><img class="col-md-4 previewImg" width="400" height="400"></a>
	    </c:if>
	    <c:if test="${hotelInfo.hotelImg3 ne null}">
	      <a><img class="col-md-4 previewImg" src="./${hotelInfo.hotelImg3}" width="400" height="400"></a>
	    </c:if>
	    <c:if test="${hotelInfo.hotelImg3 eq null}">
	      <a><img class="col-md-4 previewImg" width="400" height="400"></a>
	    </c:if>
	  </div>
	  <div class="col-md-6 left">
	    <!-- front -->
	    <div class="hotelInfo" id="hotelInfo">
	      <h1><strong>${hotelInfo.hotelName}</strong>&nbsp;&nbsp;&nbsp;&nbsp;<small>${hotelInfo.userName}</small></h1>
	        <c:set var="address" value="${hotelInfo.address}" />
	        <p><strong>${fn:split(address,' ')[0]} ${fn:split(address,' ')[1]}</strong></p>
	      <p>인원 ${hotelInfo.guest}명&nbsp; 침실 ${hotelInfo.bedRoom}개&nbsp; 침대 ${hotelInfo.bed}개&nbsp; 욕실 ${hotelInfo.bathRoom}개</p><hr>
	    </div>
		<!-- front end -->
	    <!-- amenities -->
	    <div class="amenities" id="">
	      <h3><strong>편의시설</strong></h3>
	      <c:if test="${hotelInfo.wifi eq true}">
	      	<p><i class="fas fa-wifi"></i> 무선 인터넷</p>
	      </c:if>
	      <c:if test="${hotelInfo.lounge eq true}">
	      	<p><i class="fas fa-dice"></i> 공용 휴게실</p>
	      </c:if>
	      <c:if test="${hotelInfo.bathtub eq true}">
	      	<p><i class="fas fa-bath"></i> 욕조</p>
	      </c:if>
	      <c:if test="${hotelInfo.fitness eq true}">
	      	<p><i class="fas fa-dumbbell"></i> 헬스장</p>
	      </c:if>
	      <c:if test="${hotelInfo.parking eq true}">
	      	<p><i class="fas fa-parking"></i> 주차장</p>
	      </c:if>
	      <c:if test="${hotelInfo.pool eq true}">
	      	<p><i class="fas fa-swimming-pool"></i> 수영장</p>
	      </c:if>
	      <c:if test="${hotelInfo.tv eq true}">
	      	<p><i class="fas fa-desktop"></i> TV</p>
	      </c:if>
	      <c:if test="${hotelInfo.breakfast eq true}">
	      	<p><i class="fas fa-utensils"></i> 조식</p>
	      </c:if>
	      <p>${hotelInfo.etc}</p>
	    </div><hr>
	    <!-- amenities end -->
	    <!-- homeInfo -->
	    <div class="homeInfo">
	      <h3><strong>숙소</strong></h3>
	      <p>${hotelInfo.rule}</p>
	    </div><hr>
	    <!-- homeInfo end -->
	    <!-- location -->
	    <div class="location">
	      <h3><strong>지역</strong></h3>
			<div id="map" style="width: 100%; height: 350px;"></div>
			<label>정확한 위치 정보는 예약이 확정된 후 알려드립니다.</label>
	      <script>
		  	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
	
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
	
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${hotelInfo.address} ${hotelInfo.detailAddress} ${hotelInfo.extraAddress}', function(result, status) {
	
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			    	 
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);

			     	// 지도에 표시할 원을 생성합니다
					var circle = new kakao.maps.Circle({
					    center : new kakao.maps.LatLng(result[0].y, result[0].x),  // 원의 중심좌표 입니다 
					    radius: 300, // 미터 단위의 원의 반지름입니다 
					    strokeWeight: 5, // 선의 두께입니다 
					    strokeColor: '#75B8FA', // 선의 색깔입니다
					    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					    strokeStyle: 'dashed', // 선의 스타일 입니다
					    fillColor: '#CFE7FF', // 채우기 색깔입니다
					    fillOpacity: 0.7  // 채우기 불투명도 입니다   
					}); 

					// 지도에 원을 표시합니다 
					circle.setMap(map); 
			    } 
			});
	      </script>
	    </div><hr>
	    <!-- location end -->
	    <!-- review -->
	    <iframe src="/namgiyun.home/review/01" width="600" height="350" frameborder="0"></iframe>
	    <iframe src="/namgiyun.home/review/02" width="1200" height="770" frameborder="0"></iframe>
	    
	    <!-- review end -->
	  </div>
	  <!-- col-md-6 left end -->
	  <!-- col md-6 right -->
	  <div class="col-md-6 right">
	    <div id="adsideWrapper">
		  <div id="adside">
	        <form method="post" name="reservationForm" id="reservationForm">
	          <input type="hidden" value="${hotelInfo.hotelNum}" name="hotelNum" id="hotelNum">
	          <div class="form-group">
	            <h3>가격을 알아보세요</h3><hr>
	            <p>날짜</p>
	            <input type="date" class="form-control" id="resvCheckIn" name="resvCheckIn" placeholder="체크인 날짜">
	            <input type="date" class="form-control" id="resvCheckOut" name="resvCheckOut" placeholder="체크아웃 날짜">
	            <p>인원 수</p>
	            <input type="number" class="form-control" id="resvGuest" name="resvGuest" placeholder="게스트 1명" min="1">
	            <br>
	            <div class="costInfo" id="costInfo" style="display: none;">
	              <input id="resvCost" name="resvCost" type="text" class="form-control" readonly="readonly" value="">
	            </div>
	            <button type="button" class="btn btn-lg btn-success btn-block" id="cost">요금 조회</button>
	            <button type="button" class="btn btn-lg btn-success btn-block" id="reservaion">예약</button>
	          </div>
	        </form>
		  </div>
        </div>
	  </div>
	  <!-- col-md-6 right end -->
	</div>
	<!-- container end -->
</body>
</html>