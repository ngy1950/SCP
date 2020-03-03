<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--PG크로스브라우징필수내용 시작-->
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<!--PG크로스브라우징필수내용 끝-->
<link
   href="https://fonts.googleapis.com/css?family=Lato:300,400,600,900"
   rel="stylesheet" />
<!--해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요.-->
<!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. -->
<script src="/layout/basic/js/jquery-1.9.1.min.js"></script>
<script src="/layout/basic/js/jquery.bxslider.js"></script>
<script>
   window.jQuery1_9_1 = jQuery.noConflict(true);
</script>
<script type="text/javascript" src="/ec-js/common.js"></script>
<!-- 해당 JS는 플래시를 사용하기 위한 스크립트입니다. -->



<title>결제페이지</title>

<link
   href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
   rel="stylesheet" id="bootstrap-css">
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
   <script
      src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

   <link href="resources/css/scp_main.css" rel="stylesheet"
      type="text/css">
      <script src="resources/js/getProduct.js"></script>
</head>
<body id="body_sub">
   <form action="search.do" method="post" name="mainForm">
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
                  <c:if test="${null ne user.name}">      <!-- 로그인 된 상태 -->
                     <li class="upper-links"><a class="links" href="logout.do">
                           ${user.name} 로그아웃</a></li>
                  </c:if>
                  <c:if test="${null eq user.name}">      <!-- 로그인 안 된 상태 -->
                     <ul class="largenav pull-right">
                        <li class="upper-links"><a class="links" href="login.jsp">로그인
                        </a></li>
                  </c:if>
                  <li class="upper-links dropdown"><a class="links"
                     href="http://clashhacks.in/">고객센터</a>
                     <ul class="dropdown-menu">
                        <li class="profile-li"><a class="profile-links"
                           href="http://yazilife.com/">공지사항</a></li>
                        <li class="profile-li"><a class="profile-links"
                           href="http://hacksociety.tech/">자주묻는질문</a></li>
                        <li class="profile-li"><a class="profile-links"
                           href="http://clashhacks.in/">1:1문의</a></li>
                     </ul></li>
                  <li class="upper-links dropdown"><a class="links"
                     href="http://clashhacks.in/">마이페이지</a>
                     <ul class="dropdown-menu">
                        <li class="profile-li"><a class="profile-links"
                           href="http://yazilife.com/">주문배송조회</a></li>
                        <li class="profile-li"><a class="profile-links"
                           href="http://hacksociety.tech/">취소/교환/반품</a></li>
                        <li class="profile-li"><a class="profile-links"
                           href="http://clashhacks.in/">할인쿠폰</a></li>
                        <li class="profile-li"><a class="profile-links"
                           href="http://clashhacks.in/">포인트</a></li>
                     </ul></li>
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
                        <li><a href="#">남성 의류</a></li>
                        <li><a href="#">여성 의류</a></li>
                        <li class="divider"></li>
                        <li><a href="#">신발</a></li>
                        <li class="divider"></li>
                        <li><a href="#">쥬얼리/시계</a></li>
                        <li class="divider"></li>
                        <li><a href="#">뷰티</a></li>
                        <li class="divider"></li>
                        <li><a href="#">특가</a></li>
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

   <div id = "container">
   <table align="center" width="800">
      <tr>
         <td align="left">
            <ul >
               <li>상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
            </ul>
         </td>
      </tr>
   </table>
      <div>
         <table border="1" summary="" align="center">
            <caption>기본배송</caption>
            <colgroup>
                  <col style="width: auto" />
                  <col style="width: 240px" />
                  <col style="width: 98px" />
                  <col style="width: 75px" />
                  <col style="width: 98px" />
                  <col style="width: 98px" />
                  <col style="width: 85px" />
                  <col style="width: 98px" />
            </colgroup>
               <thead>
                  <tr>
                     <th scope="col" >이미지</th>
                     <th scope="col">상품정보</th>
                     <th scope="col">판매가</th>
                     <th scope="col">수 량</th>
                     <th scope="col">배송구분</th>
                     <th scope="col">배송비</th>
                     <th scope="col">합 계</th>
                  </tr>
               </thead>
               <tbody>
                  <tr align="center">
                     <td><img src="resources/img/payment_img/smile_T_small_img.jpg"></td>
                     <td><strong>헤이 스마일맨 투맨</strong></td>
                     <td><strong>499,900원</strong></td>
                     <td>1</td>
                     <td>기본배송</td>
                     <td>4,500원</td>
                     <td>합계</td>
                  </tr>
               </tbody>
               <tfoot>
                  <tr>
                     <td colspan="7" align="right">상품구매 금액&nbsp;<strong>499,000</strong>+ 배송비&nbsp;<strong>4500</strong>&nbsp;= 합계 : <strong>503,500</strong></td>
                  </tr>
               </tfoot>               
         </table>      
      </div>
      <br>
      <div>
         <table border="1" align="center" width="800">
            <caption>주문 정보 입력</caption>
            <colgroup>
               <col style="width: 139px;"/>
               <col style="width: auto;"/>               
            </colgroup>
            <tbody>
               <tr>
                  <th scope="row" height="50">주문하시는 분</th>
                  <td><input id="oname" name="oname" type="text" /></td>
               </tr>
               <tr>
                  <th scope="row" >주소</th>
                  <td height="100"><input id="address1" name="address1" type="text" size="6" maxlength="6"/>우편번호</br>
                  <input id="address1" name="address1" size="40" type="text"/> 기본주소</br>
                  <input id="address2" name="address2" size="40" type="text"/> 나머지주소</td>
               </tr>
               <tr>
                  <th scope="row"   height="50">전화번호</th>
                  <td><select id="phone1" name="phone1">
                              <option value="02">02</option>
                              <option value="031">031</option>
                              <option value="032">032</option>
                              <option value="033">033</option>
                              <option value="041">041</option>
                              <option value="042">042</option>
                              <option value="043">043</option>
                              <option value="044">044</option>
                              <option value="051">051</option>
                              <option value="052">052</option>
                              <option value="053">053</option>
                              <option value="054">054</option>
                              <option value="055">055</option>
                              <option value="061">061</option>
                              <option value="062">062</option>
                              <option value="063">063</option>
                              <option value="064">064</option>
                              <option value="0502">0502</option>
                              <option value="0503">0503</option>
                              <option value="0504">0504</option>
                              <option value="0505">0505</option>
                              <option value="0506">0506</option>
                              <option value="0507">0507</option>
                              <option value="070">070</option>
                              <option value="010">010</option>
                              <option value="011">011</option>
                              <option value="016">016</option>
                              <option value="017">017</option>
                              <option value="018">018</option>
                              <option value="019">019</option>
                        </select>-<input id="ophone2" name="ophone2" maxlength="4" size="4" value="" type="text" />-
                        <input id="ophone3" name="ophone3" maxlength="4" size="4" value="" type="text" /></td>
               </tr>
            </tbody>
            <tbody>
               <tr>
                        <th scope="row" height="100">이메일</th>
                        <td><input id="email1" name="email1" value="" type="text" />@<input id="email2" name="email2" type="text" /><select id="email3">
                              <option value="" selected="selected">- 이메일 선택 -</option>
                              <option value="naver.com">naver.com</option>
                              <option value="daum.net">daum.net</option>
                              <option value="nate.com">nate.com</option>
                              <option value="hotmail.com">hotmail.com</option>
                              <option value="yahoo.com">yahoo.com</option>
                              <option value="empas.com">empas.com</option>
                              <option value="korea.com">korea.com</option>
                              <option value="dreamwiz.com">dreamwiz.com</option>
                              <option value="gmail.com">gmail.com</option>
                              <option value="etc">직접입력</option>
                        </select>
                           <ul class="gBlank5 txtInfo">
                              <li> 이메일을 통해 주문처리과정을 보내드립니다.</li>
                              <li> 이메일 주소란에는 반드시 수신가능한 이메일주소를 입력해 주세요.</li>
                           </ul></td>
                     </tr>
            </tbody>
            
         </table>
      </div>
      <br>
      <div>
         <table border="1" align="center" width="800" height= 60>
         <caption>무통장입금</caption>
            <tr>
               <td><strong>입금계좌 : 기업은행 000000-00000-00000 &nbsp;&nbsp;예금주명 : 아침햇살</strong></td>
               <td align="center"><input type="button" value="상품주문"></input></td>
            </tr>
         </table>
      </div>
   </div>
</body>
</html>