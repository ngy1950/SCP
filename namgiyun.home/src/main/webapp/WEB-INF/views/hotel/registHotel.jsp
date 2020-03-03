<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 숙박 예약은 쌍용비앤비 - 숙소 등록</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- header -->
<link rel="stylesheet" href="res/css/header.css">
<!-- icon -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- ajax alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- kakao post -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
//수용인원 체크
var isGuest = function(){
	var result = false;
	
	if($('#guest').val()) result = true;
	else alert('수용인원을 입력하세요.','warning');
	return result;
}
//객실정보 체크
var isRoom = function(){
	var result = false;
	
	if($('#bedRoom').val() && $('#bed').val() && $('#bathRoom').val()) result = true;
	else alert('침실, 침대, 욕실 수를 입력하세요.','warning');
	return result;
}
//주소 체크
var isAddress = function(){
	var result = false;
	
	if($('#post').val() && $('#address').val()) result = true;
	else alert('주소를 입력하세요.','warning');
	return result;
}
//계좌번호 체크
var isAccount = function(){
	var result = false;
	
	if($('#account').val()) result = true;
	else alert('계좌정보를 입력하세요.','warning');
	return result;
}
//이름 체크
var isHomeName = function(){
	var result = false;
	
	if($('#hotelName').val()) result = true;
	else alert('숙소이름을 입력하세요.','warning');
	return result;
}
//수용인원 체크
var isGuest = function(){
	var result = false;
	
	if($('#guest').val()) result = true;
	else alert('수용인원을 입력하세요.','warning');
	return result;
}
//사진 체크

//요금 체크
var isHotelCost = function(){
	var result = false;
	
	if($('#hotelCost').val()) result = true;
	else alert('기본요금을 입력하세요.','warning');
	return result;
}
//등록 alert
$(document).ready(function (){
   $('#upload').bind('click', function(){
	   if(isGuest() && isRoom() && isAddress() && isAccount() && isHomeName()/* && isHotelImg() */){
		   $.ajax({
				url:'register',
				data:$('#registForm').serialize(),
				success:function(isGood){
					alert("숙소 등록이 완료되었습니다.", "success");
					setTimeout(function(){
						location.href="02";
					}, 1500);
				},
				error: function(a, b, errMsg){
					alert(errMsg, 'error');
				},
			});
 	   }
    });
});
//우편번호
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('post').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
//요금 자동설정
function auto(){
	document.getElementById("hotelCost").value = '40000';
};
//사진썸네일
window.onload = function(){
    //Check File API support
    if(window.File && window.FileList && window.FileReader){
        var filesInput = document.getElementById("files");
        filesInput.addEventListener("change", function(event){
            var files = event.target.files; //FileList object
            var output = document.getElementById("result");
            
            for(var i = 0; i< files.length; i++){
                var file = files[i];
                //Only pics
                if(!file.type.match('image'))
                  	continue;
                
                var picReader = new FileReader();
                picReader.addEventListener("load",function(event){
                    var picFile = event.target;
                    var div = document.createElement("div");
                    div.innerHTML = "<img class='thumbnail' name='hotelImg[i+1]' src='"+ picFile.result + "'" + "title='" + picFile.name + "'/>";
                    output.insertBefore(div,null);            
                });
                 //Read the image
                picReader.readAsDataURL(file);
            }
        });
    }
    else{
        console.log("Your browser does not support File API");
    }
}

//체크박스 input 활성,비활성화
function checkDisable(form){
    if( form.agree.checked == false ){
	   form.extraFee.disabled = true;
	} else {
	   form.extraFee.disabled = false;
	}
}
</script>
<style>
.form {
	padding: 5%;
}

.form-control {
	padding: 20px;
	width: 84%;
}

.comment {
	margin-top: 8%;
	margin-bottom: 20%;
	padding: 1%;
	border: 1px solid;
	border-color: #b9b9b9;
}

#postBtn {
	margin: 0;
	width: auto;
}

#post {
	width: auto;
	display: inline;
}

#address {
	width: 93.5%;
}

#detailAddress, #extraAddress {
	width: auto;
	display: inline;
}

.checkbox[type=checkbox] {
	display: none;
}

label.input-label {
	cursor: pointer;
}

label.input-label::before {
	font-family: FontAwesome;
	margin: 0 20px;
	font-size: 20px;
	color: rgba(4, 120, 100, 0.2);
	transition: transform 0.2s ease-out, color 0.2s ease;
}

label.input-label.checkbox::before {
	content: "\f0c8";
}

input.checkbox+label.input-label:active::before {
	transform: scale3d(1.5, 1.5, 1);
}

input.checkbox:checked+label.input-label::before {
	display: inline-block;
	font-family: FontAwesome;
	color: #12c952;
	transform: scale3d(1, 1, 1);
}

input.checkbox:checked+label.input-label.checkbox::before {
	content: "\f14a";
}

.previewImg1, .previewImg2, .previewImg3 {
	border: 1px solid lightgray;
}

.uploadBtn label {
	padding: 1%;
	font-size: 18px;
	line-height: normal;
	background-color: #dddddd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-radius: 8px;
	margin: 3%;
}

.uploadBtn input[type="file"] {
	display: none;
}

.form .btn {
	margin-top: 5%;
	margin-bottom: 5%;
	font-weight: bold;
}

.comment .btn {
	margin-top: 5%;
	margin-bottom: 8%;
	font-weight: bold;
}
/* button[type=submit] */
.btn-success {
	margin-top: 5%;
	margin-bottom: 5%;
	width: 15%;
	height: 2%;
	font-weight: bold;
}

.uploadBtn {
	text-align: center;
}

.moneyForm {
	padding: 3%;
}

textarea {
	resize: none;
}
.thumbnail{
	width: 350px;
    height: 350px;
    float: left;
}
</style>

<body>  
   <!-- header -->
	<nav class="navbar" style="padding-right: 3px;">
		<div class="container">
			<!--  
         <div class="navbar-header">
            <a class="navbar-brand" href="/home"><img src="res/img/logo.png"></a>
         </div>
		-->
			<div class="navbar-header">
				<a class="navbar-brand" href="/namgiyun.home"><i
					class="glyphicon glyphicon-home"></i></a>
			</div>

			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${null ne user.userName}">
						<li><a href="/namgiyun.home/logout.do">${user.userName}님
								로그아웃</a></li>
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
					<li class="active"><a href="/namgiyun.home/01" style="font-size: medium;"><b>내 숙소 등록</b></a></li>
					<li><a href="/namgiyun.home/02" data-toggle="tab"
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
	<hr>
	<form name="registForm" id="registForm" method="GET" action="register">
	  <input type="hidden" id="userId" name="userId" value="${user.userId}">
		<div class="container">
			<h3 align="center">ㅡ 나만의 숙소를 등록하세요 ㅡ</h3>
			<br>
			<br>
			<div class="col-md-6 form">
				<h4>1. 숙소에 수용가능한 인원은 몇 명인가요?</h4>
				<input type="number" class="form-control" id="guest" name="guest" placeholder="인원 1명" min="1">
			</div>
			<div class="col-md-6 comment">
				<h4>인원은 최소 1명부터 시작합니다.</h4>
			</div>
			<div class="col-md-6 form">
				<h4>2. 침실, 침대, 욕실 수를 알려주세요.</h4>
				<input type="number" class="form-control" id="bedRoom" name="bedRoom" placeholder="침실 1개" min="1">
				<input type="number" class="form-control" id="bed" name="bed" placeholder="침대 0개" min="0">
				<input type="number" class="form-control" id="bathRoom" name="bathRoom" placeholder="욕실 1개" min="1">
			</div>
			<div class="col-md-6 comment">
				<h4>
					침실 1개당 침대 수를 입력하지 말아주세요.<br>
					<br> 침실과 침대 수는 전체 개수입니다.
				</h4>
			</div>
			<div class="col-md-6 form">
				<h4>3. 숙소의 전체 주소를 알려주세요.</h4>
				<input type="text" id="post" name="post" class="form-control" placeholder="우편번호">
				<button type="button" id="postBtn" class="btn" onclick="execDaumPostcode()">우편번호 찾기</button>
				<input type="text" id="address" name="address" class="form-control" placeholder="주소">
				<input type="text" id="detailAddress" name="detailAddress" class="form-control" placeholder="상세주소">
				<input type="text" id="extraAddress" name="extraAddress" class="form-control" placeholder="참고항목">
			</div>
			<div class="col-md-6 comment">
				<h4>전체 주소는 예약이 확정된 회원에게만 공개합니다.</h4>
			</div>
			<div class="col-md-6 form">
				<h4>4. 숙소에서 제공하는 편의시설을 체크하세요.</h4>
				<div class="checkboxList wrap">
					<input type="checkbox" class="checkbox" id="essentialItem" checked="checked">
					<label for="essentialItem" class="input-label checkbox"><mark>필수 품목</mark> : 수건, 침대시트, 비누, 화장지</label>
					<input type="checkbox" class="checkbox" id="wifi" name="wifi" value="1">
					<label for="wifi" class="input-label checkbox">무선 인터넷</label>
					<input type="checkbox" class="checkbox" id="lounge" name="lounge" value="1">
					<label for="lounge" class="input-label checkbox">공용 휴게실</label>
					<input type="checkbox" class="checkbox" id="bathtub" name="bathtub" value="1">
					<label for="bathtub" class="input-label checkbox">욕조</label>
					<input type="checkbox" class="checkbox" id="fitness" name="fitness" value="1">
					<label for="fitness" class="input-label checkbox">헬스장</label>
					<input type="checkbox" class="checkbox" id="parking" name="parking" value="1">
					<label for="parking" class="input-label checkbox">주차장</label>
					<input type="checkbox" class="checkbox" id="pool" name="pool" value="1">
					<label for="pool" class="input-label checkbox">수영장</label>
					<input type="checkbox" class="checkbox" id="tv" name="tv" value="1">
					<label for="tv" class="input-label checkbox">TV</label>
					<input type="checkbox" class="checkbox" id="breakfast" name="breakfast" value="1">
					<label for="breakfast" class="input-label checkbox">조식</label>
				</div>
				<input type="text" class="form-control" id="etc" placeholder="기타사항">
			</div>
			<div class="col-md-6 comment">
				<h4>
					침대가 없는 숙소는 침대시트를 제외해도 됩니다.<br>
					<br> 필수 품목은 반드시 체크해야합니다.<br>
					<br> 보기에 없는 편의시설은 기타사항에 입력하세요.
				</h4>
			</div>
		</div>
		
		<div class="container">
		<form action="" enctype="multipart/form-data">
			<div class="container form">
			    <h4>5. 숙소 사진을 올려주세요.</h4>
				<div class="uploadBtn">
					<output id="result" />
					<label for="files">사진 업로드</label>
			    	<input id="file" type="file" multiple/>
					<!-- <script>
						$("#file").change(function(){
							if(this.files && this.files[0]){
								var reader = new FileReader;
								reader.onload = function(data){
									$(".previewImg1").attr("src", data.target.result);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
					</script> -->
				</div>
				<!-- <h4>5. 숙소 사진을 올려주세요.</h4>
				<img class="col-md-4 previewImg" width="400" height="400"> <img
					class="col-md-4 previewImg" width="400" height="400"> <img
					class="col-md-4 previewImg" width="400" height="400">
				<div class="uploadBtn">
					<label for="file">사진 업로드</label> <input type="file" id="file">
				</div> -->
			</div>
		</form>
			<div class="col-md-6 form">
				<h4>6. 숙소 요금을 설정해주세요.</h4>
				<div class="moneyForm">
					<h5>수동 설정</h5>
					<div>
						<h5>6-1. 1박 기준 기본 요금을 입력하세요.</h5>
						<input type="text" id="hotelCost" name="hotelCost" class="form-control" placeholder="0">
					</div>
				</div>
				
				<div>
		          <h5>6-3. 요금을 입금받을 계좌를 입력하세요.</h5>
		          <input type="text" id="account" name="account" class="form-control" placeholder="은행 계좌번호">
		        </div>
			</div>
			<div class="col-md-6 comment">
				<h4>
					설정이 복잡하고 어려우신가요?<br> 그렇다면 자동설정 기능을 이용하세요.<br>
					<br> 자동설정 기능은<br> 모든 숙소 요금의 평균치로 계산해줍니다.
				</h4>
				<button class="btn btn-lg">자동설정</button>
			</div>
			<div class="col-md-6 form">
				<h4>7. 숙소의 이름을 정해보세요.</h4>
				<input type="text" class="form-control" id="hotelName" name="hotelName" placeholder="이름"><br>
				<br>
				<h4>8. 숙소의 상세 정보를 제공해주세요.</h4>
				<textarea class="form-control" rows="5" id="rule" name="rule"></textarea>
			</div>
			<div class="col-md-6 comment">
				<h4>
					숙소 등록의 마지막 단계입니다.<br>
					<br> 숙소의 이름은 자신의 숙소를 나타내는 가장 쉬운 방법입니다.<br> 가까운 지하철역, 주변
					볼거리를 이름에 입력해서 회원들에게 정보를 제공하세요.<br>
					<br>
					<br> 이전 단계에서 미처 입력하지 못한 정보를 입력해주세요.
				</h4>
			</div>
			<div class="col-md-12 uploadBtn">
				<button type="button" id="upload" class="btn btn-success btn-lg">등록</button>
			</div>
		</div>
	</form>
</body>
</html>