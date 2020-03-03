<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>고객센터</title>
</head>

<!-- main header -->
<link href="./resources/css/scp_main.css" rel="stylesheet" type="text/css">
<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- notice -->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="./resources/css/q&a.css" rel="stylesheet" type="text/css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="./resources/js/q&a.js" charset="UTF-8"></script>

<body>
<!-- 헤더 -->
	<form action="search.do" method="POST" name="mainForm">
		<nav class="navbar navbar-default navcarbox" role="navigation">
			<div class="container">
				<div class="row row1">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
					</div>


					<!-- 상단 메뉴바 -->
					<div class="row row1">
						<ul class="largenav pull-right">
							<c:if test="${null ne user.name}">
								<!-- 로그인 된 상태 -->
								<li class="upper-links"><a class="links" href="logout.do">
										${user.name} 로그아웃</a></li>
							</c:if>
							<c:if test="${null eq user.name}">
								<!-- 로그인 안 된 상태 -->
								<ul class="largenav pull-right">
									<li class="upper-links"><a class="links" href="login.jsp">로그인
									</a></li>
							</c:if>
							<li class="upper-links dropdown"><a class="links"
								href="getNoticeList.do">고객센터</a>
								<ul class="dropdown-menu">
									<li class="profile-li"><a class="getNoticeList.do" href="">공지사항</a></li>
									<li class="profile-li"><a class="profile-links"
										href="q&a.jsp#tab2">자주묻는질문</a></li>
									<li class="profile-li"><a class="profile-links"
										href="q&a.jsp#tab3">1:1문의</a></li>
								</ul></li>
							<c:if test="${null ne user.name}">
								<!-- 로그인 된 상태 -->
								<li class="upper-links dropdown"><a class="links"
									href="mypage2.jsp">마이페이지</a>
							</c:if>
							<ul class="dropdown-menu">
								<li class="profile-li"><a class="profile-links"
									href="mypage2.jsp">주문배송조회</a></li>
								<li class="profile-li"><a class="profile-links"
									href="http://hacksociety.tech/">취소/교환/반품</a></li>
								<li class="profile-li"><a class="profile-links"
									href="mypage_custom_info.jsp">할인쿠폰</a></li>
								<li class="profile-li"><a class="profile-links"
									href="mypage_custom_info.jsp">포인트</a></li>
							</ul>
							</li>
							<li class="upper-links"><a class="links"
								href="http://clashhacks.in/">장바구니</a></li>
						</ul>
					</div>

					<div align="center">
						<a href="index.do"><img src="resources/img/쇼핑몰 메인배너/logo1.png"></a>
						<div class="mb-3">
							<input type="text" style="width: 87%; height: auto; margin: 0px;"
								class="input-lg" placeholder="검색할 물품을 입력해주세요." name="searchText">
							<input class="btn btn-outline-secondary"
								style="height: 50px; margin: 0px; width: auto; text-align: left;"
								type="submit" value="검색">
						</div>
					</div>


					<!--iCON 타겟 목록 -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-left" style="margin-left: 15px;">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown">상품 카테고리<b class="caret"></b></a>
								<ul class="dropdown-menu">
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("남성의류", "UTF-8")%>">남성
											의류</a></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("여성의류", "UTF-8")%>">여성
											의류</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("신발", "UTF-8")%>">신발</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("쥬얼리/시계", "UTF-8")%>">쥬얼리/시계</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("뷰티", "UTF-8")%>">뷰티</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("식품", "UTF-8")%>">식품</a></li>
								</ul></li>
							<li><a href="#">베스트 상품</a></li>
							<li><a href="#">NEW 상품</a></li>
							<li><a href="#">해외직구</a></li>
							<li><a href="#">무료배송</a></li>
						</ul>
					</div>
				</div>
		</nav>
	</form>
	<!-- 헤더 끝 -->

<!-- notice -->
<section>

<div class="container">

<!-- tab menu -->
<div class="tabbable">
  <ul class="nav nav-tabs" id="mytab">
    <li class="active"><a href="getNoticeList.do">공지사항</a></li>
    <li><a href="#tab2" data-toggle="tab">자주묻는질문</a></li>
    <li><a href="#tab3" data-toggle="tab">1:1 문의</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab1">
    
    	<div class="container">
    	<h3 class="text-center text-success"> 공지사항 </h3><br>
    	<table class="table table-hover" style="text-align: center;">
			  <tr>
			  	<td>번호</td>
			  	<td>제목</td>
			  	<td>날짜</td>
			  	<td>조회수</td>
			  </tr>
			  <tr>
			 <c:forEach var="notice" items="${noticeList}"> <!-- get을 안쓰는 이유는 커맨드 객체에서 끄집어내서 쓰기때문에 원래는 board.getSeq()임 -->
            <tr>
               <td align="center">${notice.seq }</td>
               <td align="center"><a href="getNotice.do?seq=${notice.seq}">${notice.title}</a></td>
               <td align="center">${notice.regDate}</td>
               <td align="center">${notice.cnt}</td>
            </tr>
            </c:forEach>
            </tr>
		</table>	
    	</div>
    
    </div>
    <div class="tab-pane" id="tab2">
      
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
		        <strong class="readMore">판매자에게 어떻게 문의 할 수 있나요?</strong>
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
		        <strong class="readMore">이미 주문을 했는데, 배송지를 변경하고 싶어요.</strong>
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
    
    <div class="tab-pane" id="tab3">
    	<div class="container">
    	<h3 class="text-center text-success"> 1:1 문의 </h3><br>
    	<p><small>ㆍ상품정보, 상품출고확인, A/S등의 문의는 [상품페이지 > 상품Q&A]를 통해 파트너사에 직접 문의시 빠른 처리가 가능합니다.<br>
    			    ㆍ전화번호, 주소, 이메일, 계좌번호 등의 개인정보는 타인에 의해 도용될 위험이 있으니, 문의 시 입력하지 않도록 주의해 주시기 바랍니다.</small></p>
    	<table class="table">
    		<tr>
    			<td class="active"> 문의유형 </td>
    			<td>
	    			<div class="radio">
					  <label><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>배송 관련 </label>&nbsp;
					  <label><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1">배송지연보상신청</label>&nbsp;
					  <label><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1">취소/교환/반품</label>
					</div>
    			</td>
    		</tr>
    		<tr>
    			<td class="active"><label>관련상품</label></td>
    			<td>
					<label><input type="text" class="form-control" name="buy_prod" placeholder="구매한 상품을 입력하세요."></label>
    			</td>
    		</tr>
    		<tr>
    			<td class="detail" style="background-color: #eeeeee9e;"><label>상세 문의내용</label></td>
    			<td>
    				<textarea rows="10" cols="85" placeholder="상세 문의 내용을 작성해주십시오 (500자 이내)"></textarea>
    			</td>
    		</tr>
    		<tr>
    		<td></td>
    			<td style="float: left;margin-left: 20%;border-top: 0px;margin-top: 2%;">
    			<input type="submit" value="확인">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    			<a href="q&a.jsp"><input type="reset" value="취소"></a>
    			</td>
    		</tr>
    	</table>
    	</div>
    </div><!-- tab3 end -->
  </div><!-- tab-content end -->
</div><!-- tabbabble end -->

</div>

</section>


</body>
</html>