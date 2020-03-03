<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<!-- ajax || Jquery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- end ajax || Jquery -->	

<script>
function insert_review() {
	var revContent = $("#text_area").val(); 
	var revName = $("#revname").val();
	
	$.ajax({
		method:"post",
		url:"reviewjoin.do",			
		data: {
			revContent: revContent,
			revName: revName
		},
		success: function(result){
			console.log(result);
			if(result){
				alert("정상 등록");
				
			}else{
				alert("등록 실패");
			}
		},
		error: function(a, b, errMsg){
			$("#msg").text("중복체크 에러: " + errMsg);
		}
	});
}
</script>
<!-- common.css -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- end common.css -->

<style>
body{
	width: min-content;
}

.review-title {
	width: 583px;
	margin-bottom: 25px;
	margin-top: 25px;
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
}

b {
	font-size: large;
}

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
/* .btn-dtail tr td btn btn-outline-secondary{
padding: 6px 25px;
border-radius: 2px;
} */
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="review-container" align="center">
		<div class="review-title">

			<div class="title-detail">
				<b>후기 작성</b>
			</div>
			<div class="review-info">
				<label style="margin-top: 40px;"><input type="text" style="border-radius:5px" placeholder="제목입력" id="revname"></label>
			</div>

		</div>

		<div class="review-dtail">
			<div class="star-point">
				<img>&nbsp;&nbsp;&nbsp;<img>&nbsp;&nbsp;&nbsp;
				<img>&nbsp;&nbsp;&nbsp;<img>&nbsp;&nbsp;&nbsp;<img>
			</div>
			<textarea rows="6" cols="80" placeholder="500자 이내로 작성하세요." id="text_area"></textarea>
		</div>

		<div class="review-btn">
			<table class="btn-dtail">
				<tbody>
					<tr>
						<td><button class="btn btn-outline-secondary" type="button" id="insert_button" onclick="insert_review();"
								style="padding: 6px 25px; font-weight: bold;">등록</button>&nbsp;&nbsp;&nbsp;</td>
						<td><button class="btn btn-secondary" type="button" id="update_button" onclick="update_review();"
								style="padding: 6px 25px; font-weight: bold;">수정</button></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>