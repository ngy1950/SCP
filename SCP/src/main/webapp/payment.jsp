<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!--PGũ�ν�����¡�ʼ����� ����-->
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<!--PGũ�ν�����¡�ʼ����� ��-->
<link
   href="https://fonts.googleapis.com/css?family=Lato:300,400,600,900"
   rel="stylesheet" />
<!--�ش� CSS�� ���θ� ��ü �������� ������ �ݴϴ�. ������ ������ �������ּ���.-->
<!-- ����Ʈ�����ο����� JQuery 1.4.4 ������ ����Ǿ��ֽ��ϴ�. �߰��� ȣ���ϸ� �浹�� ���� �� �ֽ��ϴ�. -->
<script src="/layout/basic/js/jquery-1.9.1.min.js"></script>
<script src="/layout/basic/js/jquery.bxslider.js"></script>
<script>
   window.jQuery1_9_1 = jQuery.noConflict(true);
</script>
<script type="text/javascript" src="/ec-js/common.js"></script>
<!-- �ش� JS�� �÷��ø� ����ϱ� ���� ��ũ��Ʈ�Դϴ�. -->



<title>����������</title>

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


               <!-- ��� �޴��� -->
            <div class="row row1">
               <ul class="largenav pull-right">
                  <c:if test="${null ne user.name}">      <!-- �α��� �� ���� -->
                     <li class="upper-links"><a class="links" href="logout.do">
                           ${user.name} �α׾ƿ�</a></li>
                  </c:if>
                  <c:if test="${null eq user.name}">      <!-- �α��� �� �� ���� -->
                     <ul class="largenav pull-right">
                        <li class="upper-links"><a class="links" href="login.jsp">�α���
                        </a></li>
                  </c:if>
                  <li class="upper-links dropdown"><a class="links"
                     href="http://clashhacks.in/">������</a>
                     <ul class="dropdown-menu">
                        <li class="profile-li"><a class="profile-links"
                           href="http://yazilife.com/">��������</a></li>
                        <li class="profile-li"><a class="profile-links"
                           href="http://hacksociety.tech/">���ֹ�������</a></li>
                        <li class="profile-li"><a class="profile-links"
                           href="http://clashhacks.in/">1:1����</a></li>
                     </ul></li>
                  <li class="upper-links dropdown"><a class="links"
                     href="http://clashhacks.in/">����������</a>
                     <ul class="dropdown-menu">
                        <li class="profile-li"><a class="profile-links"
                           href="http://yazilife.com/">�ֹ������ȸ</a></li>
                        <li class="profile-li"><a class="profile-links"
                           href="http://hacksociety.tech/">���/��ȯ/��ǰ</a></li>
                        <li class="profile-li"><a class="profile-links"
                           href="http://clashhacks.in/">��������</a></li>
                        <li class="profile-li"><a class="profile-links"
                           href="http://clashhacks.in/">����Ʈ</a></li>
                     </ul></li>
                  <li class="upper-links"><a class="links"
                     href="http://clashhacks.in/">��ٱ���</a></li>
               </ul>
            </div>

            <div align="center">
               <a href="index.do"><img src="resources/img/���θ� ���ι��/logo1.png"></a>
               <div class="mb-3">
                  <input type="text" style="width: 87%; height: auto; margin: 0px;"
                     class="input-lg" placeholder="�˻��� ��ǰ�� �Է����ּ���." name="searchText">
                  <input class="btn btn-outline-secondary"
                     style="height: 50px; margin: 0px; width: auto; text-align: left;"
                     type="submit" value="�˻�">
               </div>
            </div>


            <!--iCON Ÿ�� ��� -->
            <div class="collapse navbar-collapse"
               id="bs-example-navbar-collapse-1">
               <ul class="nav navbar-nav navbar-left" style="margin-left: 15px;">
                  <li class="dropdown"><a href="#" class="dropdown-toggle"
                     data-toggle="dropdown">��ǰ ī�װ�<b class="caret"></b></a>
                     <ul class="dropdown-menu">
                        <li><a href="#">���� �Ƿ�</a></li>
                        <li><a href="#">���� �Ƿ�</a></li>
                        <li class="divider"></li>
                        <li><a href="#">�Ź�</a></li>
                        <li class="divider"></li>
                        <li><a href="#">���/�ð�</a></li>
                        <li class="divider"></li>
                        <li><a href="#">��Ƽ</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Ư��</a></li>
                     </ul></li>
                  <li><a href="#">����Ʈ ��ǰ</a></li>
                  <li><a href="#">NEW ��ǰ</a></li>
                  <li><a href="#">�ؿ�����</a></li>
                  <li><a href="#">������</a></li>
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
               <li>��ǰ�� �ɼ� �� ���� ������ ��ǰ�� �Ǵ� ��ٱ��Ͽ��� �����մϴ�.</li>
            </ul>
         </td>
      </tr>
   </table>
      <div>
         <table border="1" summary="" align="center">
            <caption>�⺻���</caption>
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
                     <th scope="col" >�̹���</th>
                     <th scope="col">��ǰ����</th>
                     <th scope="col">�ǸŰ�</th>
                     <th scope="col">�� ��</th>
                     <th scope="col">��۱���</th>
                     <th scope="col">��ۺ�</th>
                     <th scope="col">�� ��</th>
                  </tr>
               </thead>
               <tbody>
                  <tr align="center">
                     <td><img src="resources/img/payment_img/smile_T_small_img.jpg"></td>
                     <td><strong>���� �����ϸ� ����</strong></td>
                     <td><strong>499,900��</strong></td>
                     <td>1</td>
                     <td>�⺻���</td>
                     <td>4,500��</td>
                     <td>�հ�</td>
                  </tr>
               </tbody>
               <tfoot>
                  <tr>
                     <td colspan="7" align="right">��ǰ���� �ݾ�&nbsp;<strong>499,000</strong>+ ��ۺ�&nbsp;<strong>4500</strong>&nbsp;= �հ� : <strong>503,500</strong></td>
                  </tr>
               </tfoot>               
         </table>      
      </div>
      <br>
      <div>
         <table border="1" align="center" width="800">
            <caption>�ֹ� ���� �Է�</caption>
            <colgroup>
               <col style="width: 139px;"/>
               <col style="width: auto;"/>               
            </colgroup>
            <tbody>
               <tr>
                  <th scope="row" height="50">�ֹ��Ͻô� ��</th>
                  <td><input id="oname" name="oname" type="text" /></td>
               </tr>
               <tr>
                  <th scope="row" >�ּ�</th>
                  <td height="100"><input id="address1" name="address1" type="text" size="6" maxlength="6"/>�����ȣ</br>
                  <input id="address1" name="address1" size="40" type="text"/> �⺻�ּ�</br>
                  <input id="address2" name="address2" size="40" type="text"/> �������ּ�</td>
               </tr>
               <tr>
                  <th scope="row"   height="50">��ȭ��ȣ</th>
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
                        <th scope="row" height="100">�̸���</th>
                        <td><input id="email1" name="email1" value="" type="text" />@<input id="email2" name="email2" type="text" /><select id="email3">
                              <option value="" selected="selected">- �̸��� ���� -</option>
                              <option value="naver.com">naver.com</option>
                              <option value="daum.net">daum.net</option>
                              <option value="nate.com">nate.com</option>
                              <option value="hotmail.com">hotmail.com</option>
                              <option value="yahoo.com">yahoo.com</option>
                              <option value="empas.com">empas.com</option>
                              <option value="korea.com">korea.com</option>
                              <option value="dreamwiz.com">dreamwiz.com</option>
                              <option value="gmail.com">gmail.com</option>
                              <option value="etc">�����Է�</option>
                        </select>
                           <ul class="gBlank5 txtInfo">
                              <li> �̸����� ���� �ֹ�ó�������� �����帳�ϴ�.</li>
                              <li> �̸��� �ּҶ����� �ݵ�� ���Ű����� �̸����ּҸ� �Է��� �ּ���.</li>
                           </ul></td>
                     </tr>
            </tbody>
            
         </table>
      </div>
      <br>
      <div>
         <table border="1" align="center" width="800" height= 60>
         <caption>�������Ա�</caption>
            <tr>
               <td><strong>�Աݰ��� : ������� 000000-00000-00000 &nbsp;&nbsp;�����ָ� : ��ħ�޻�</strong></td>
               <td align="center"><input type="button" value="��ǰ�ֹ�"></input></td>
            </tr>
         </table>
      </div>
   </div>
</body>
</html>