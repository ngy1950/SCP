<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<!DOCTYPE html>
<html>
    <meta charset="utf-8">

<title>숙소 숙박 예약은 쌍용비앤비</title>

<!-- Main -->
<!-- 합쳐지고 최소화된 최신 CSS -->
 <!-- header -->
<link rel="stylesheet" href="/namgiyun.home/res/css/header.css">
<!-- end header -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 

<!-- Main -->
<style>

	.tableSize {
		padding-left: 20%;
		padding-right: 20%;
		
	}
.form-inline{
		float: left;
    	margin: 0;
    	background-color: #fff;
    	border: 0px solid;
	}
</style>
<head>


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
   
		
		<h2 align="center"><u>문의등록</u></h2>
		<div class="tableSize">
		<table class="table table-bordered stable table-hover " >
			<tbody class="text-center">
			<tr>
				<td style="line-height: 35px">*성명</td>
				<td>
					<input type="text" class="form-control" placeholder="필수 입력 항목입니다.">
				</td>
			</tr>
			<tr>
				<td style="line-height: 35px">*휴대폰</td>
				<td>
					<input type="text" class="form-control" placeholder="필수 입력 항목입니다.">
				</td>
			</tr>
			<tr>
				<td style="line-height: 35px">*이메일</td>
				<td>
					<input type="text" class="form-control" placeholder="필수 입력 항목입니다.">
				</td>
			</tr>
			<tr>
				<td style="line-height: 70px">*문의내용</td>
				<td>
				<textarea class="form-control vertical" placeholder="필수 입력 항목입니다." rows="3"></textarea>
				</td>
			</tr>
			</tbody>
			</table>
			<div style="float: right;">
				<button class="btn btn-default" type="submit"  onclick="location.href='/home/customerservice/01'">등록</button>
				<button class="btn btn-default" type="button"  onclick="location.href='/home/customerservice/01'">취소</button>
			</div>
		</div>
</body>
</html>