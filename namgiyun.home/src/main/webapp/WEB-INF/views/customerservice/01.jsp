<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">

<title>숙소 숙박 예약은 쌍용비앤비</title>

<!-- Main -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- header -->
<link rel="stylesheet" href="/namgiyun.home/res/css/header.css">
<!-- end header -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<!-- Main -->
<style>
.tableSize {
	padding-left: 20%;
	padding-right: 20%;
}

.form-inline {
	float: left;
	margin: 0;
	background-color: #fff;
	border: 0px solid;
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
					<li><a href="/namgiyun.home/02" data-toggle="tab"
						aria-expanded="true" style="color: #303030; font-size: medium;"><b>내
								숙소 보기</b></a></li>
					<li><a href="/namgiyun.home/userReservation" data-toggle="tab"
						aria-expanded="true" style="color: #303030; font-size: medium;"><b>예약
								확인</b></a></li>
					<li><a href="/namgiyun.home/hostReservation" data-toggle="tab"
						aria-expanded="true" style="color: #303030; font-size: medium;"><b>호스트
								전용 예약내역</b></a></li>
					<li class="active"><a href="/namgiyun.home/customerservice/01" data-toggle="tab"
						aria-expanded="true" style="color: #303030; font-size: medium;"><b>문의내역</b></a></li>
					<li><a href="/namgiyun.home/userInfo" data-toggle="tab" aria-expanded="true"
						style="color: #303030; font-size: medium;"><b>회원정보수정</b></a></li>
				</ul>
			</div>
			<!-- tab menu end -->
			
			<h2 align="center">
				<u>문의내역</u>
			</h2>
		</div>
			<form class="form-inline"
				style="float: left; margin: 0; background-color: #fff; border: 0px solid; padding-left: 20%">


				<select name="selectTitle">
					<option value="titleName" selected="selected">제목</option>
					<option value="userName">글쓴이</option>
				</select>

				<div class="form-group">
					<input type="text" class="form-control">
				</div>

				<input type="button" value="검색" class="form-control">
			</form>
			<div class="tableSize">
				<table class="table table-bordered stable table-hover  ">
					<tbody class="text-center">
						<tr>
							<th class="text-center">번호</th>
							<th class="text-center">제목</th>
							<th class="text-center">글쓴이</th>
							<th class="text-center">날짜</th>
							<th class="text-center">조회</th>
						</tr>
						<tr>
							<td width="6%" onclick="location.href='/namgiyun.home/customerservice/03'">임시1</td>
							<td width="60%" onclick="location.href='/namgiyun.home/customerservice/03'">임시2</td>
							<td onclick="location.href='/namgiyun.home/customerservice/03'">임시3</td>
							<td onclick="location.href='/namgiyun.home/customerservice/03'">임시4</td>
							<td width="6%" onclick="/namgiyun.home/customerservice/03'">임시5</td>
						</tr>
						<tr>
							<td width="6%" onclick="location.href='/namgiyun.home/customerservice/03'">임시1</td>
							<td width="60%" onclick="location.href='/namgiyun.home/customerservice/03'">임시2</td>
							<td onclick="location.href='/namgiyun.home/customerservice/03'">임시3</td>
							<td onclick="location.href='/namgiyun.home/customerservice/03'">임시4</td>
							<td width="6%" onclick="/namgiyun.home/customerservice/03'">임시5</td>
						</tr>
						<tr>
							<td width="6%" onclick="location.href='/namgiyun.home/customerservice/03'">임시1</td>
							<td width="60%" onclick="location.href='/namgiyun.home/customerservice/03'">임시2</td>
							<td onclick="location.href='/namgiyun.home/customerservice/03'">임시3</td>
							<td onclick="location.href='/namgiyun.home/customerservice/03'">임시4</td>
							<td width="6%" onclick="/namgiyun.home/customerservice/03'">임시5</td>
						</tr>
						<tr>
							<td width="6%" onclick="location.href='/namgiyun.home/customerservice/03'">임시1</td>
							<td width="60%" onclick="location.href='/namgiyun.home/customerservice/03'">임시2</td>
							<td onclick="location.href='/namgiyun.home/customerservice/03'">임시3</td>
							<td onclick="location.href='/namgiyun.home/customerservice/03'">임시4</td>
							<td width="6%" onclick="/namgiyun.home/customerservice/03'">임시5</td>
						</tr>
						<tr>
							<td width="6%" onclick="location.href='/namgiyun.home/customerservice/03'">임시1</td>
							<td width="60%" onclick="location.href='/namgiyun.home/customerservice/03'">임시2</td>
							<td onclick="location.href='/namgiyun.home/customerservice/03'">임시3</td>
							<td onclick="location.href='/namgiyun.home/customerservice/03'">임시4</td>
							<td width="6%" onclick="/namgiyun.home/customerservice/03'">임시5</td>
						</tr>
						<tr>
							<td width="6%" onclick="location.href='/namgiyun.home/customerservice/03'">임시1</td>
							<td width="60%" onclick="location.href='/namgiyun.home/customerservice/03'">임시2</td>
							<td onclick="location.href='/namgiyun.home/customerservice/03'">임시3</td>
							<td onclick="location.href='/namgiyun.home/customerservice/03'">임시4</td>
							<td width="6%" onclick="/namgiyun.home/customerservice/03'">임시5</td>
						</tr>
						<tr>
							<td width="6%" onclick="location.href='/namgiyun.home/customerservice/03'">임시1</td>
							<td width="60%" onclick="location.href='/namgiyun.home/customerservice/03'">임시2</td>
							<td onclick="location.href='/namgiyun.home/customerservice/03'">임시3</td>
							<td onclick="location.href='/namgiyun.home/customerservice/03'">임시4</td>
							<td width="6%" onclick="/namgiyun.home/customerservice/03'">임시5</td>
						</tr>
					</tbody>
				</table>
				<span style="padding-left: 50%"><a href="#"> < </a> <a
					href="#"> 1 </a><a href="#"> > </a></span>
				<div style="float: right;">
					<button class="btn btn-default" type="button"
						onclick="location.href='/namgiyun.home/customerservice/02'">글쓰기</button>
				</div>
			</div>	
</body>
</html>