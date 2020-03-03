<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소 숙박 예약은 쌍용비앤비 - 숙소 수정</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- header -->
<link rel="stylesheet" href="res/css/header.css">
<!-- icon -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- ajax alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- kakao post -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//수정,취소 alert
$(document).ready(function () {
	$('#update').bind('click', function(){
		$.ajax({
			url:'fix',
			data:$('#updateForm').serialize(),
			success:function(isGood){
				if(swal("숙소 수정이 완료되었습니다.", "success")){
					location.href = '02';
				}
			},
			error: function(a, b, errMsg){
				alert(errMsg, 'error');
			},
		});
	});
	$('#cancel').bind('click', function(){
		swal({
			title: "숙소 수정을 취소하겠습니까?",
			text: "지금까지 수정한 정보는 저장되지 않습니다.",
			icon: "warning",
			buttons: true,
			dangerMode: true,
		})
		.then((willDelete) => {
			if (willDelete) {
			    location.href = '02';
			  } else {}
			});
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
.form{
	padding: 5%;
}
.form-control{
	padding:20px;
	width: 84%;
}
.comment{
	margin-top: 9%;
    margin-bottom: 20%;
    padding: 1%;
	border: 1px solid;
    border-color: #b9b9b9;
}
#postBtn{
    margin: 0;
    width: auto;
}
#post{
	width: auto;
    display: inline;
}
#address{
	width: 93.5%;
}
#detailAddress, #extraAddress{
	width: auto;
    display: inline;
}
.checkbox[type=checkbox]{display:none;}
label.input-label { 
  cursor: pointer;
  }
label.input-label::before {
  font-family: FontAwesome;
  margin:0 20px;
  font-size: 20px;
  color: rgba(4, 120, 100, 0.2);
  transition: transform 0.2s ease-out, color 0.2s ease;
}
label.input-label.checkbox::before {
  content: "\f0c8";
}
input.checkbox + label.input-label:active::before {
  transform: scale3d(1.5,1.5,1);
}
input.checkbox:checked + label.input-label::before {
  display: inline-block; 
  font-family: FontAwesome; 
  color:#12c952;
  transform: scale3d(1,1,1);
}
input.checkbox:checked + label.input-label.checkbox::before {
    content: "\f14a";
}
.uploadBtn label{
	padding: 1%;
	font-size: 18px;
	line-height: normal;
	background-color: #dddddd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-radius: 8px;
	margin: 3%;
}
.uploadBtn input[type="file"]{
	display: none;
}
.form .btn{
    margin-top: 5%;
    margin-bottom: 5%;
    width: 15%;
    font-weight: bold;
}
.comment .btn{
	margin-top: 5%;
	margin-bottom: 8%;
	font-weight: bold;
}
/* button[type=submit] */.uploadBtn .btn{
	margin-top: 5%;
    margin-bottom: 5%;
    margin-right: 5%;
    width: 15%;
    height: 2%;
    font-weight: bold;
}
.uploadBtn{
	text-align: center;
}
.moneyForm{
	padding: 3%;
}
textarea{
	resize: none;
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
					<li><a href="/namgiyun.home//01" style="font-size: medium;"><b>내 숙소 등록</b></a></li>
					<li><a href="/namgiyun.home//02" data-toggle="tab"
						aria-expanded="true" style="color: #303030; font-size: medium;"><b>내
								숙소 보기</b></a></li>
					<li><a href="/namgiyun.home//userReservation" data-toggle="tab"
						aria-expanded="true" style="color: #303030; font-size: medium;"><b>예약
								확인</b></a></li>
					<li><a href="/namgiyun.home//hostReservation" data-toggle="tab"
						aria-expanded="true" style="color: #303030; font-size: medium;"><b>호스트
								전용 예약내역</b></a></li>
					<li class="active"><a href="/namgiyun.home//customerservice/01" data-toggle="tab"
						aria-expanded="true" style="color: #303030; font-size: medium;"><b>문의내역</b></a></li>
					<li><a href="/namgiyun.home//userInfo" data-toggle="tab" aria-expanded="true"
						style="color: #303030; font-size: medium;"><b>회원정보수정</b></a></li>
				</ul>
			</div>
			<!-- tab menu end -->
   
   
	<hr>
	<form name="updateForm" id="updateForm" method="POST" action="fix">
	  <input type="hidden" id="hotelNum" name="hotelNum" value="${hotelInfo.hotelNum}">
	  <div class="container">
		<h3 align="center">ㅡ 나만의 숙소를 수정하세요 ㅡ</h3>
		<br><br>
			  <div class="col-md-6 form">
			    <h4>1. 숙소에 수용가능한 인원은 몇 명인가요?</h4>
			    <input type="number" class="form-control" id="guest" name="guest" value="${hotelInfo.guest}">
			  </div>
			  <div class="col-md-6 comment">
		        <h4>인원은 최소 1명부터 시작합니다.</h4>
			  </div>
			  <div class="col-md-6 form">
			    <h4>2. 침실, 침대, 욕실 수를 알려주세요.</h4>
			    <input type="number" class="form-control" id="bedRoom" name="bedRoom" value="${hotelInfo.bedRoom}" min="1">
			    <input type="number" class="form-control" id="bed" name="bed" value="${hotelInfo.bed}" min="0">
			    <input type="number" class="form-control" id="bathRoom" name="bathRoom" value="${hotelInfo.bathRoom}" min="1">
			  </div>
			  <div class="col-md-6 comment">
		        <h4>침실 1개당 침대 수를 입력하지 말아주세요.<br><br>
		        	침실과 침대 수는 전체 개수입니다.</h4>
			  </div>
			  <div class="col-md-6 form">
			    <h4>3. 숙소의 전체 주소를 알려주세요.</h4>
				<input type="text" id="post" name="post" class="form-control" value="${hotelInfo.post}">
			    <button type="button" id="postBtn" class="btn" onclick="execDaumPostcode()">우편번호 찾기</button>
				<input type="text" id="address" name="address" class="form-control" value="${hotelInfo.address}">
				<input type="text" id="detailAddress" name="detailAddress" class="form-control" value="${hotelInfo.detailAddress}">
				<input type="text" id="extraAddress" name="extraAddress" class="form-control" value="${hotelInfo.extraAddress}">
			  </div>
			  <div class="col-md-6 comment">
		        <h4>전체 주소는 예약이 확정된 회원에게만 공개합니다.</h4>
			  </div>
			  <div class="col-md-6 form">
			    <h4>4. 숙소에서 제공하는 편의시설을 체크하세요.</h4>	
				  <div class="checkboxList wrap">
				    <input type="checkbox" class="checkbox" id="essentialItem" value="essentialItem" checked="checked">
				    <label for="essentialItem" class="input-label checkbox"><mark>필수 품목</mark> : 수건, 침대시트, 비누, 화장지</label>
				    <c:choose>
				      <c:when test="${hotelInfo.wifi eq true}">
				        <input type="checkbox" class="checkbox" id="wifi" name="wifi" value="1" checked="checked">
				        <label for="wifi" class="input-label checkbox">무선 인터넷</label>
				      </c:when>
				      <c:otherwise>
				        <input type="checkbox" class="checkbox" id="lounge" name="wifi" value="1">
				        <label for="wifi" class="input-label checkbox">무선 인터넷</label>
				      </c:otherwise>
				    </c:choose>
				    <c:choose>
				      <c:when test="${hotelInfo.lounge eq true}">
				        <input type="checkbox" class="checkbox" id="lounge" name="lounge" value="1" checked="checked">
				        <label for="lounge" class="input-label checkbox">공용 휴게실</label>
			          </c:when>
				      <c:otherwise>
				        <input type="checkbox" class="checkbox" id="lounge" name="lounge" value="1">
				        <label for="lounge" class="input-label checkbox">공용 휴게실</label>
				      </c:otherwise>
				    </c:choose>
				    <c:choose>
				      <c:when test="${hotelInfo.bathtub eq true}">
				        <input type="checkbox" class="checkbox" id="bathtub" name="bathtub" value="1" checked="checked">
				        <label for="bathtub" class="input-label checkbox">욕조</label>
			          </c:when>
				      <c:otherwise>
				        <input type="checkbox" class="checkbox" id="bathtub" name="bathtub" value="1">
				        <label for="bathtub" class="input-label checkbox">욕조</label>
				      </c:otherwise>
				    </c:choose>
				    <c:choose>
				      <c:when test="${hotelInfo.fitness eq true}">
				        <input type="checkbox" class="checkbox" id="fitness" name="fitness" value="1" checked="checked">
				    	<label for="fitness" class="input-label checkbox">헬스장</label>
			          </c:when>
				      <c:otherwise>
				        <input type="checkbox" class="checkbox" id="fitness" name="fitness" value="1">
				        <label for="fitness" class="input-label checkbox">헬스장</label>
				      </c:otherwise>
				    </c:choose>
				    <c:choose>
				      <c:when test="${hotelInfo.parking eq true}">
				        <input type="checkbox" class="checkbox" id="parking" name="parking" value="1" checked="checked">
				    	<label for="parking" class="input-label checkbox">주차장</label>
			          </c:when>
				      <c:otherwise>
				        <input type="checkbox" class="checkbox" id="parking" name="parking" value="1">
				    	<label for="parking" class="input-label checkbox">주차장</label>
				      </c:otherwise>
				    </c:choose>
				    <c:choose>
				      <c:when test="${hotelInfo.pool eq true}">
				        <input type="checkbox" class="checkbox" id="pool" name="pool" value="1" checked="checked">
				    	<label for="pool" class="input-label checkbox">수영장</label>
			          </c:when>
				      <c:otherwise>
				        <input type="checkbox" class="checkbox" id="pool" name="pool" value="1">
				    	<label for="pool" class="input-label checkbox">수영장</label>
				      </c:otherwise>
				    </c:choose>
				    <c:choose>
				      <c:when test="${hotelInfo.tv eq true}">
				        <input type="checkbox" class="checkbox" id="tv" name="tv" value="1" checked="checked">
				    	<label for="tv" class="input-label checkbox">TV</label>
			          </c:when>
				      <c:otherwise>
				        <input type="checkbox" class="checkbox" id="tv" name="tv" value="1">
				    	<label for="tv" class="input-label checkbox">TV</label>
				      </c:otherwise>
				    </c:choose>
				    <c:choose>
				      <c:when test="${hotelInfo.breakfast eq true}">
				        <input type="checkbox" class="checkbox" id="breakfast" name="breakfast" value="1" checked="checked">
				    	<label for="breakfast" class="input-label checkbox">조식</label>
			          </c:when>
				      <c:otherwise>
				        <input type="checkbox" class="checkbox" id="breakfast" name="breakfast" value="1">
				    	<label for="breakfast" class="input-label checkbox">조식</label>
				      </c:otherwise>
				    </c:choose>
				  </div>
				  <input type="text" class="form-control" id="etc" name="etc" value="${hotelInfo.etc}">
			  </div>
			  <div class="col-md-6 comment">
		        <h4>침대가 없는 숙소는 침대시트를 제외해도 됩니다.<br><br>
		        	필수 품목은 반드시 체크해야합니다.<br><br>
		        	보기에 없는 편의시설은 기타사항에 입력하세요.</h4>
			  </div>
	  </div>
      <div class="container">
	    <div class="container form">
	      <h4>5. 숙소 사진을 올려주세요.</h4>
			<div class="uploadBtn">
				<output id="result" />
				<label for="files">사진 업로드</label>
		    	<input id="files" type="file" multiple/>
			</div>
	      <!-- <h4>5. 숙소 사진을 올려주세요.</h4>
		  <img class="col-md-4 previewImg" width="400" height="400">
		  <img class="col-md-4 previewImg" width="400" height="400">
		  <img class="col-md-4 previewImg" width="400" height="400">
		  <div class="uploadBtn">
		    <label for="file">사진 업로드</label>
		    <input type="file" id="file">
		  </div> -->
	    </div>
	    <div class="col-md-6 form">
	      <h4>6. 숙소 요금을 설정해주세요.</h4>
	      <div class="moneyForm">
	        <h5>수동 설정</h5>
	          <div>
	            <h5>6-1. 1박 기준 기본 요금을 입력하세요.</h5>
	            <input type="text" id="hotelCost" name="hotelCost" class="form-control" value="${hotelInfo.hotelCost}">
	          </div>
	      </div>
		  
		  <div>
	        <h5>6-3. 요금을 입금받을 계좌를 입력하세요.</h5>
	        <input type="text" id="account" name="account" class="form-control" value="${hotelInfo.account}">
	      </div>
	    </div>
		<div class="col-md-6 comment">
	      <h4>설정이 복잡하고 어려우신가요?<br>
	       	    그렇다면 자동설정 기능을 이용하세요.<br><br>
	                   자동설정 기능은<br>
	                   모든 숙소 요금의 평균치로 계산해줍니다.</h4>
	      <button class="btn btn-lg">자동설정</button>
		</div>
		<div class="col-md-6 form">
		  <h4>7. 숙소의 이름을 정해보세요.</h4>
		  <input type="text" class="form-control" id="hotelName" name="hotelName" value="${hotelInfo.hotelName}"><br><br>
		  <h4>8. 숙소의 상세 정보를 제공해주세요.</h4>
		  <textarea class="form-control" rows="5" id="rule" name="rule">${hotelInfo.rule}</textarea>
		</div>
		<div class="col-md-6 comment">
	      <h4>숙소 등록의 마지막 단계입니다.<br><br>
	      	    숙소의 이름은 자신의 숙소를 나타내는 가장 쉬운 방법입니다.<br>
			    가까운 지하철역, 주변 볼거리를 이름에 입력해서 회원들에게 정보를 제공하세요.<br><br><br>
			    이전 단계에서 미처 입력하지 못한 정보를 입력해주세요.</h4>
		</div>
		<div class="col-md-12 uploadBtn">
		  <button type="button" id="update" class="btn btn-success btn-lg">수정</button>
		  <button type="button" id="cancel" class="btn btn-lg">취소</button>
		</div>
	  </div>
	</form>
</body>
</html>