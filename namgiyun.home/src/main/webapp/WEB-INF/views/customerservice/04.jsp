<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<!-- header -->
<link rel="stylesheet" href="/namgiyun.home/res/css/header.css">
<script>
$(document).ready(function(){
	$(".readMore").click(function(){
		var This=$(this);
		
		$(this).next().toggle(function() {
			
		})
	});
})
</script>
<style>
.notice:first-child{
    margin-top:10px;
    }
.notice {
    padding: 15px;
    background-color: #fafafa;
    border-left: 6px solid #7f7f84;
    margin-bottom: 10px;
    -webkit-box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
       -moz-box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
            box-shadow: 0 5px 8px -6px rgba(0,0,0,.2);
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
.notice>.desc{
    display:none;
}
.readMore{
    cursor:pointer;
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
<section>

<div class="container">

<!-- tab menu -->
		<div class="container">
			<h3 class="text-center text-success"> 자주묻는 질문 </h3><br>
		    <div class="notice">
		        <strong class="readMore">환불을 신청했는데 환불 기간은 얼마나 소요되나요?</strong>
		          <div class="desc">
		            <br>
		            <p>
						<strong style="color:red;">√ 결제수단별 환불 기간 상이</strong><br><br>
						환불 접수 완료 후, 결제 수단별 환불 시점은 아래와 같이 소요됩니다.<br>
						(반품환불은 상품 회수>업체 입고>환불승인단계를 거쳐 진행되오니 참고 부탁드립니다.)<br><br>
						  - 신용카드 : 2 영업일 이내, 카드사 승인 취소(페이코,케이페이,페이나우 등 간편결제 동일)<br>
						  - 체크카드 : 2 영업일 이내, 카드사 승인 취소 후 해당 카드에 연계된 계좌로 입금<br>
						  - 실시간 계좌이체 : 2 영업일 이내, 승인 취소 후 결제 계좌로 입금<br>
						  - 휴대폰 결제 : 휴대폰 결제 전체 취소 시, 즉시 취소 반영 <br>
							&nbsp;&nbsp;(휴대폰 전월 결제 주문 및 부분 취소 계좌 환불인 경우에는 아래 무통장입금 환불과 동일하게 진행됩니다.)<br>
						  - 무통장입금 : 2 영업일 이내 환불신청 계좌로 입금<br>
						    &nbsp;&nbsp;(Ex. 7월 6일(금) 즉시취소/취소/환불 승인 > 7월 10일(화) 이내 결제사 취소 반영)<br>
						  - 위메프 포인트 : 즉시 적립<br>
						    &nbsp;&nbsp;(단, 무통장입금+포인트 복합 결제시 무통장입금건 환불처리 이후 포인트 적립됩니다.)<br><br>
						<small>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요.</small>
		            </p>        
		        </div>
		    </div>
		    <div class="notice">
		        <strong class="readMore">호스트에게 어떻게 문의 할 수 있나요?</strong>
		          <div class="desc">
		            <br>
		            <p>
						<strong style="color:red;">√ 상품 상세페이지 > 상품정보, 구매내역>주문상세 에 기재된 판매자 연락처 또는 상품 Q&A 게시판을 통해 직접 문의 가능</strong><br><br>
						- 상품 상세 페이지와 주문내역>주문상세보기 에서 판매자정보 확인이 가능합니다.<br>
						  &nbsp;&nbsp;(노출정보: 판매자명/상호/대표자명/전화번호/이메일/사업자등록번호/주소 등)<br>
						  &nbsp;&nbsp;판매자정보에 기재된 전화번호 또는 상품페이지 Q&A를 통해 판매자에게 직접 문의할 수 있습니다.<br><br>			
						- Q&A게시판에 작성하신 질문 및 답변 내역은 마이페이지 > Q&A에서 확인 할 수 있습니다.<br>
						  &nbsp;&nbsp;(판매종료된 상품에 대해서는 Q&A 문의 작성이 불가합니다.)<br><br>			
						추가 문의 사항이 있는 경우 [마이페이지 > 위메프톡] 을 이용하시거나,<br>
						1:1문의 접수해주시면 위메프에서 확인하여 안내드리겠습니다.<br><br>
						<small>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요.</small>
		            </p>        
		        </div>
		    </div>
		    <div class="notice">
		        <strong class="readMore">포인트는 현금으로 교환할 수 있나요?</strong>
		          <div class="desc">
		            <br>
		            <p>
		               <strong style="color:red;">√ 유료포인트만 환급 가능</strong><br><br>
						ㆍ무료포인트는 현금으로 교환할 수 없습니다.<br>
						ㆍ유료포인트의 경우 5% 환급 수수료로 공제되고 95%가 환급이 가능합니다.<br>
						ㆍ유료포인트 환급 신청 시 유료 포인트는 바로 회수되며, 5% 환급수수료를 제외한 나머지 금액만 환급 처리됩니다.<br>
						  &nbsp;&nbsp;&nbsp;(90% 현금 환급, 5% 포인트 환급)<br>
						ㆍ유료포인트 환급은 신청일로부터 3~6일 후 지급됩니다.<br>
						  &nbsp;&nbsp;&nbsp;단, 현금환급 신청 금액이 30만원을 넘을 경우 신청일로부터 7~10일 후 지급됩니다.<br>
						ㆍ결제수단이 무통장입금 또는 휴대폰 전월결제 주문 및 부분취소로 계좌 환불이 필요하나 계좌번호 확인이 어려운 경우<br>
						   &nbsp;&nbsp;&nbsp;위메프 유료포인트로 우선 환급 될 수 있으며, 포인트 사용을 원치 않을 경우 1:1문의를 접수해주시면 지급된 포인트 회수 후 전액 계좌 환급이 가능합니다.<br><br>
						<small>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요.</small>
		            </p>        
		        </div>
		    </div>
		    <div class="notice">
		        <strong class="readMore">고객센터에서 전화상으로 본인 확인 후 대리 결제가 가능한가요?</strong>
		          <div class="desc">
		            <br>
		            <p>
		               <strong style="color:red;">√ 텔레마트 고객센터를 통해 구매(결제) 대행 가능</strong><br><br>
						ㆍ전화주문 이용 서비스 약관 및 개인정보수집 동의한 고객님께서는 위메프 내 전 상품 서비스 이용 가능합니다.<br>
						  &nbsp;&nbsp;&nbsp;(단, 컬처/여행, 롯데백화점 등 무통장입금 제외딜은 불가)<br>
						ㆍ무통장 입금 결제수단만 가능합니다.<br>
						ㆍ텔레마트 고객센터 : 1644-4555 | 평일 09시~18시 (점심시간 13시~14시)<br><br>
						<small>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요.</small>
		            </p>        
		        </div>
		    </div>
		    <div class="notice">
		        <strong class="readMore">예약을 변경하고 싶어요.</strong>
		          <div class="desc">
		            <br>
		            <p>
		               <strong style="color:red;">√ 마이페이지 > 주문배송조회 페이지 에서 변경가능</strong><br><br>
						ㆍ배송지 변경은 마이페이지 > 주문배송조회 페이지에서 구매상세내역 > 배송정보/배송지 변경 버튼을 클릭하여 변경할 수 있습니다.<br>
						ㆍ배송지 변경은 상품이 발송되기 전 '입금대기' 및 '배송준비중/신규주문' 단계에서만 변경이 가능합니다.<br>
						ㆍ한 결제번호당 하나의 배송지만 설정하실 수 있습니다.<br>
						ㆍ'상품출고대기/상품준비중' 단계에서는 변경이 어려워 취소신청 부탁드립니다. 다만 즉각적인 취소가 어려우며, 상품이 출고되었을 경우에는 취소가 어려울 수 있습니다.<br>
						ㆍ상품이 이미 출고되어 배송중인 상태에서는 배송지 변경이 불가능합니다.<br><br>
						<small>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. 1:1문의하기</small>
		            </p>        
		        </div>
		    </div>
		    <div class="notice">
		        <strong class="readMore">할인 쿠폰은 어떻게 사용하나요?</strong>
		          <div class="desc">
		            <br>
		            <p>
		               <strong style="color:red;">√ 주문/결제 페이지의 [쿠폰사용] 버튼 선택 > 적용가능 쿠폰 선택 후 [적용] 버튼 클릭</strong><br><br>
						ㆍ상품페이지 내 [할인쿠폰 발급] 버튼이 확인되는 상품이라면, 할인쿠폰 적용이 가능한 상품입니다.<br>
						ㆍ주문/결제 페이지의 [쿠폰사용] 버튼에서 적용 가능한 할인쿠폰을 선택 후 사용하실 수 있습니다.<br>
						ㆍ할인쿠폰에 따라 사용조건이 상이하기 때문에, 마이페이지 > 할인쿠폰에서 보유중인 할인쿠폰 내역과 사용조건을 확인하시기 바랍니다.<br>
						ㆍ할인쿠폰 별로 사용할 수 있는 카테고리에 제한이 있을 수 있습니다.<br>
						ㆍ또한 쿠폰을 사용할 수 있는 카테고리에 속해 있는 상품이라도 일부 상품은 쿠폰적용 불가상품으로 분류된 경우가 있습니다.<br>
						ㆍ할인이 적용된 일부 특가딜 상품 또는 특정딜에는 쿠폰사용이 어렵습니다.<br><br>			 
						<small>답변이 충분하지 않으셨다면, 1:1문의를 이용해 주세요. 1:1문의하기</small>
		            </p>        
		        </div>
		    </div>
		</div><!-- q&a end -->
    </div><!-- tab2 end -->

</section>
</body>
</html>