<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- notice -->
<link
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

<!-- ajax || Jquery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- end ajax || Jquery -->
<script>
var fixNum = '';
	//댓글 토글창 내리기 
	$(document).ready(function() {
		$(".readMore").click(function() {
			var This = $(this);

			$(this).next().toggle(function() {

			})
		});
	})
	//댓글 업데이트 
	function update_review() {
		alert("수정하시겠습니까? :" +revNum);
		console.log("수정중 ->")
		var revContent = $("#upRevContent").val();
		var revName = $("#upRevName").val();
		var revNum = fixNum;
		console.log(revNum);
		
		var userId = $("#uId").val();
		
		
		$.ajax({
			method : "post",
			url : "fix.do",
			data : {
				revContent : revContent,
				revName : revName,
				revNum : revNum,
				userId : userId
			},
			success : function(result) {
				console.log(result);
				if (result) {
					alert("수정 성공");

				} else {
					alert("수정 실패");
				}
			}
		});
	}
	function getText(fixNum){
		var revNum = fixNum;
		var userId = $('#userId').val();
		
		console.log(revNum)
		console.log(userId)
		
		$.ajax({
			method : "post",
			url : "getText.do",
			data : {
				revNum :revNum,
				userId : userId
			},
			success : function(result){
				if(result != null || result != ''){
					$('#upRevName').val(result.revName);
					$('#upRevContent').val(result.revContent); 
				}
				console.log(result);
			}
		});
	}

	//댓글 삭제 
	function delete_review(revNum) {
		alert("삭제하시겠습니까?");
		var revNum = revNum;
		var userId = $('#userId').val();

		console.log(revNum);
		console.log(userId);
		
		$.ajax({
			method : "post",
			url : "erase.do",
			data : {
				revNum : revNum,
				userId : userId
			},
			success : function(result) {
				console.log(result);
				if (result) {
					alert("삭제 성공");

				} else {
					alert("삭제 실패");
				}
			}
		});
	}
	//화면 마스크 구현
	function wrapWindowByMask() {
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();
		var maskWidth = $(window).width();

		//문서영역의 크기 
		console.log("document 사이즈:" + $(document).width() + "*"
				+ $(document).height());
		//브라우저에서 문서가 보여지는 영역의 크기
		console.log("window 사이즈:" + $(window).width() + "*"
				+ $(window).height());

		//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		$('#mask').css({
			'width' : maskWidth,
			'height' : maskHeight
		});

		//애니메이션 효과
		//$('#mask').fadeIn(1000);      
		$('#mask').fadeTo("slow", 0.5);
	}
	//화면 팝업창 띄우기
	function popupOpen() {
		$('.layerpop').css("position", "absolute");
		//영역 가운에데 레이어를 뛰우기 위해 위치 계산 
		$('.layerpop').css(
				"top",
				(($(window).height() - $('.layerpop').outerHeight()) / 2)
						+ $(window).scrollTop());
		$('.layerpop').css(
				"left",
				(($(window).width() - $('.layerpop').outerWidth()) / 2)
						+ $(window).scrollLeft());
		//$('.layerpop').draggable();
		$('#layerbox').show();
		
	}

	function popupClose() {
		$('#layerbox').hide();
		$('#mask').hide();
	}
	
	function goDetail(revNum) {
		/*팝업 오픈전 별도의 작업이 있을경우 구현*/

		popupOpen(); //레이어 팝업창 오픈 
		wrapWindowByMask(); //화면 마스크 효과
		
		fixNum = revNum;
		console.log(fixNum);
		getText(fixNum);
	}
	
</script>
<style>
body {
	width: min-content;
	height: min-content;
}

.notice:first-child {
	margin-top: 10px;
}

.notice {
	padding: 15px;
	background-color: #fafafa;
	border-left: 6px solid #7f7f84;
	margin-bottom: 10px;
	-webkit-box-shadow: 0 5px 8px -6px rgba(0, 0, 0, .2);
	-moz-box-shadow: 0 5px 8px -6px rgba(0, 0, 0, .2);
	box-shadow: 0 5px 8px -6px rgba(0, 0, 0, .2);
	border-radius: 13px;
}

.notice-sm {
	padding: 10px;
	font-size: 80%;
}

.notice-lg {
	padding: 35px;
	font-size: large;
}

.notice-success {
	border-color: #80D651;
}

.notice-success>strong {
	color: #80D651;
}

.notice-info {
	border-color: #45ABCD;
}

.notice-info>strong {
	color: #45ABCD;
}

.notice-warning {
	border-color: #FEAF20;
}

.notice-warning>strong {
	color: #FEAF20;
}

.notice-danger {
	border-color: #d73814;
}

.notice-danger>strong {
	color: #d73814;
}

.notice>.desc {
	display: none;
}

.readMore {
	cursor: pointer;
	width: 1140px;
	padding: 0px;
}

.review-name {
	padding: 0% 10.5% 0% 0%;
	width: 730px;
}

.review-date {
	width: 17%;
}

.review-id {
	width: 14%;
}

.review-title {
	text-align: left;
	font-weight: bold;
}

.review-user {
	text-align: right;
}

.star-score {
	border: 1px solid;
	padding-bottom: 1%;
	border-color: #9e9e9e;
	margin-bottom: 2%;
	border-radius: 13px;
}

.score {
	height: 45px;
}

.star {
	float: left;
	padding: 0.5% 5% 0% 5%;
	width: 30%;
}

.search {
	padding: 1% 0% 1% 5%;
	float: right;
	width: 39%;
}

.review-ctr {
	text-align: right;
	padding-right: 7%;
}

.dtail-dtail {
	float: left;
	margin-left: 5.2%;
}

.dtail-id {
	float: right;
	margin-right: 49px;
}
/*-- POPUP common style S ======================================================================================================================== --*/
#mask {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 999;
	background-color: #000000;
	display: none;
}

.mapping1 {
	border: 1px solid;
	width: 63%;
	height: 100%;
	float: left;
}

.place-dtail1 {
	float: right;
	width: 30%;
	height: 80%;
	margin-right: 3%;
}

.photo1 {
	border: 1px solid;
	height: 30%;
}

.place-name1 {
	border: 1px solid;
	height: 19%;
	border-top: white;
	text-align: center;
	padding: 8% 2% 2%;
	font-size: x-large;
	background-color: #9e9e9e63;
}

.place-loc1 {
	border: 1px solid;
	height: 28%;
	border-top: white;
	padding: 6% 4%;
	background-color: #f8f8f8;
}

.reco-reason1 {
	border: 1px solid;
	height: 48%;
	padding: 2% 7% 6% 7%;
	border-top: white;
	background-color: #f8f8f8;
}

.reco-dtail1 {
	padding: 2% 0% 0% 3%;
	height: 92%;
}

.tab-content1 {
	height: 604px;
}

.layerpop {
	display: none;
	z-index: 1000;
	border: 2px solid #ccc;
	background: #fff;
	cursor: pointer;
}

.layerpop_area .title {
	padding: 10px 10px 10px 10px;
	border: 0px solid #aaaaaa;
	background: #f1f1f1;
	color: #3eb0ce;
	font-size: 1.3em;
	font-weight: bold;
	line-height: 24px;
}

.layerpop_area .layerpop_close {
	display: block;
	top: 20px;
	right: 20px;
	float: right;
	background: transparent url(btn_exit_off.png) no-repeat;
	padding-top: 2%;
	color: #303030;
}

.layerpop_area .layerpop_close:hover {
	background: transparent url('btn_exit_on.png') no-repeat;
	cursor: pointer;
}

.pop-reason1 {
	margin: 8.48438px 0px 0px;
	border-radius: 7px;
	background-color: rgb(248, 248, 248);
	border: 0px;
	padding: 1% 0% 0% 1%;
	width: 274px;
	height: 108px;
	resize: none;
}

.layerpop_area .content {
	width: 96%;
	margin: 2%;
	color: #828282;
}

.place-search1 {
	padding: 3% 0% 2% 5%;
	float: left;
	width: 97%;
}

.review-title {
	width: 583px;
	margin-bottom: 25px;
	margin-top: 50px;
}

.title-detail {
	float: left;
	align-content: center;
	margin: 15px;
	border: 1px solid;
	border-radius: 10px;
	padding: 10px 50px 10px 50px;
	background-color: #4caf5033;
	border-color: #4caf508a;
}

.review-dtail {
	width: 584px;
}

.review-dtail textarea {
	border-radius: 15px;
	padding: 10px;
}

.review-btn {
	width: 32%;
}

.btn-dtail {
	float: right;
	margin-top: 10px;
	margin-right: 25%;
}

/* b {
	font-size: large;
} */

.review-info {
	width: 40%;
	float: left;
}

/* .review-container {
	height: 500px;
} */
.star-point {
	padding: 1% 50% 3% 5%;
	float: left;
}
</style>

<body>

	<div class="container">

		<!-- tab menu -->
		<div class="tabbable">
			<ul class="nav nav-tabs" id="mytab" style="margin: 40px 0% 2%;">
				<li class="active"><a href="02" style="font-size: medium;"><b>후기</b></a></li>
				<li><a href="03" data-toggle="tab" aria-expanded="true"
					style="color: #303030; font-size: medium;"><b>맛집&관광지</b></a></li>
					<li><a href="recopopup" data-toggle="tab"
					style="color: #303030; font-size: medium;"><b>맛집&관광지 추천하기</b></a></li>
			</ul>
			<div class="star-score">
				<div class="score">
					<div class="star">
						<img><span
							style="font-size: xx-large; padding: 0% 15%; padding: 5% 15% 0%;">3.8</span>
					</div>
					<div class="search">
						<input type="text" id="serchbox" placeholder="   검색어를 입력하세요."
							style="width: 80%; height: 36px; border-radius: 5px; padding: 3% 2% 2% 2%;">
						<button type="button" value="search" class="btn btn-secondary"
							style="padding: 8px 4%; margin-bottom: 6px;">검색</button>
					</div>
				</div>
			</div>
			<div class="tab-content">
				<div class="main-title">
					<table class="table table-hover"
						style="text-align: center; margin: 0px;">
						<tbody>
							<tr>
								<td class="review-title" style="padding-left: 7%;">글 제목</td>
								<td class="review-user"
									style="padding-left: 11%; font-weight: bold;">글쓴이</td>
								<td style="width: 24%; font-weight: bold;">작성일자</td>
							</tr>
							<tr>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="tab-pane active" id="tab2">
					<div class="review-con">
						
						<c:forEach items="${list}" var="list">
						<input type="hidden" id="revNum" name="revNum" value="${list.revNum}">
						<input type="hidden" id="userId" name="userId" value="${list.userId}"> 
							<div class="notice">
								<table class="readMore">
									<tr>
										<td class="glyphicon glyphicon-chevron-down"></td>
										<td class="review-name" id="revname" >${list.revName}</td>
										<td class="review-id" >${list.userName}</td>
										<td class="review-date" >${list.revRegdate}</td>
									</tr>
								</table>
								<div class="desc">
									<br>
									<p class="dtail-dtail">
										<strong>${list.revName}</strong>
									</p>
									<span class="dtail-id">작성자 아이디 : ${list.userName}</span> <br>
									<hr>
									<p class="dtail-dtail" id="revcontent">${list.revContent}</p>
									<div class="review-ctr">
										<a onClick="javascript:goDetail(${list.revNum}); " style="color: #303030"><b> > 수정 </b> </a>
										&nbsp;&nbsp;&nbsp;&nbsp; <a onClick="delete_review(${list.revNum});"
											style="color: #303030"><b> > 삭제 </b> </a>
									</div>
								</div>
							</div>
							
						</c:forEach>
					</div>
					<!-- q&a end -->

				</div>
				<!-- tab2 end -->
				<!-- 팝업뜰때 배경 -->

				<div id="mask"></div>

				<!--Popup Start -->
				<div id="layerbox" class="layerpop"style="width:750px; height: 400px; top:23%; left:20%;">
					<article class="layerpop_area">
						<div class="tab-content1">
							<div class="review-container" align="center">
								<div class="review-title">

									<div class="title-detail">
										<b>후기 작성</b>
									</div>
									<div class="review-info">
										<label style="margin-top: 32px;">
										<input type="text" style="border-radius: 5px "id="upRevName" value="${text.revName}"></label>
										<input type="hidden" id="uId" name="uId" > 
										<input type="hidden" id="rNum" name="rNum" >
									</div>
								</div>

								<div class="review-dtail">
									<textarea rows="6" cols="80" id="upRevContent">${text.revContext}</textarea>
								</div>
								
								<div class="review-btn">
									<table class="btn-dtail">
										<tbody>
											<tr>
												<td><button class="btn btn-secondary" type="button"
														id="update_button" onclick=" update_review(); javascript:popupClose(); "
														style="padding: 6px 25px; font-weight: bold;">수정</button></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

						</div>
						<!-- tab-content end -->
					</article>
				</div>
				<!--Popup End -->

				<!--
				<div class="text-center">
					<ul class="pagination pagination-lg">
						부트스트랩에서 제공하는 페이징 마법사(?)
						<li><a href="#" style="color: #303030">Pre</a></li>
						<li><a href="#" style="color: #303030">1</a></li>
						<li><a href="#" style="color: #303030">2</a></li>
						<li><a href="#" style="color: #303030">3</a></li>
						<li><a href="#" style="color: #303030">4</a></li>
						<li><a href="#" style="color: #303030">5</a></li>
						<li><a href="#" style="color: #303030">Next</a></li>
					</ul>
				</div>
				paging -->

			</div>
			<!-- tab-content end -->

		</div>
		<!-- tabbabble end -->

	</div>

</body>
</html>