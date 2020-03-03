<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="namgiyun.home.user.domain.User" %>
<!-- 추가 JSTL 적용 -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">

<title>숙소 숙박 예약은 쌍용비앤비</title>

<!-- Main css-->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- end Main css-->

<!-- header -->
<link rel="stylesheet" href="res/css/header.css">
<!-- end header -->

<script type="text/javascript">

</script>
<body>  
   <!-- header -->
   <nav class="navbar"  style="padding-right:3px;">
      <div class="container">
      
         <div class="navbar-header">
            <a class="navbar-brand" href="/namgiyun.home"><img src="res/img/logo.png"></a>
         </div>
		<!-- 
		<div class="navbar-header">
				<a class="navbar-brand" href="/namgiyun.home"><img src="res/img/logo.png"/></a>
			</div>
		-->
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
   
   
   
   
   <!-- body: 배너+숙소검색 -->
   <section class="jumbotron text-center" style="height: 400px;">
      <form class="form-inline" method="POST" action="04">
         <div class="form-group">
            <label for="address">목적지 </label>&nbsp;
            <input type="text" class="form-control" id="address" name="address" placeholder="목적지" value="">
         </div>
         &nbsp;&nbsp;
         <div class="form-group">
            <label for="resv_checkin">날짜 </label>&nbsp;
            <input type="date" class="form-control" id="resv_checkin" name="resv_checkin" placeholder="YYYY-MM-DD" value="2019-12-17"> -
            <input type="date" class="form-control" id="resv_checkout" name="resv_checkout" placeholder="YYYY-MM-DD" value="2019-12-17">
         </div>
         &nbsp;&nbsp;
         <div class="form-group">
            <label for="guest">인원 수 </label>&nbsp;
            <input type="number" class="form-control" id="guest" name="guest" min="1" value="1">
         </div>
         &nbsp;&nbsp;&nbsp;
         <button type="submit" class="btn btn-outline-dark" id="searchBtn">
            <b>검색</b>
         </button>
      </form>
   </section>
   <!-- body: 배너+숙소검색 end -->
   <!-- body: 숙소리스트 -->
   <section style="padding-bottom: 4%;">
      <div class="container">
         <h3 align="center">ㅡ 많은 고객들이 만족한 숙소 ㅡ</h3>
         <hr>
         <h3 style="margin-left: 17px;">숙소  리스트</h3>
         <%-- <div class="col-md-12 homeList">
		  	<c:forEach var="list" items="${hotelList}">
		  	  <div class="col-md-3">
		  	    <a href="05?hotelNum=${list.hotelNum}">
			      <img class="col-md-12 previewImg" src="${list.hotelImg1}" alt="" width="200" height="350">
			    </a>
			    <div class="info">
			      <p>방 ${list.bedRoom}개  침대 ${list.bed}개</p>
			      <p class="text-danger"><b>★ ${list.star}</b></p>
			      <label>${list.hotelName}</label>
			    </div>
		  	  </div>
		  	</c:forEach>
		 </div> --%>
         <a href="04"><img class="col-md-3 previewImg" width="200" height="350"></a>
         <a href="04"><img class="col-md-3 previewImg" width="200" height="350"></a>
         <a href="04"><img class="col-md-3 previewImg" width="200" height="350"></a>
         <a href="04"><img class="col-md-3 previewImg" width="200" height="350"></a>
      </div>
      <br>
   </section>
   <!-- body: 숙소리스트 end -->
   <footer class="jumbotron text-center">
      <div class="container">
         <div class="col-md-4">
            <h4>쌍용비앤비</h4>
            <br>
            <h5>이용약관</h5>
            <h5>개인정보 처리방침</h5>
            <h5>여행지 찾기</h5>
         </div>
         <div class="col-md-4">
            <h4>여행하기</h4>
            <br>
            <h5>즐길거리</h5>
         </div>
         <div class="col-md-4">
            <h4>고객센터</h4>
            <br>
            <h5>고객센터 Tel. 02-747-9630</h5>
            <h5>Company Address</h5>
            <h5>서울특별시 마포구 월드컵로 21-42 202호</h5>
            <h5>대표 : 남기윤</h5>
         </div>
      </div>
   </footer>
</body>
</html>