<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>������</title>
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
<!-- ��� -->
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


					<!-- ��� �޴��� -->
					<div class="row row1">
						<ul class="largenav pull-right">
							<c:if test="${null ne user.name}">
								<!-- �α��� �� ���� -->
								<li class="upper-links"><a class="links" href="logout.do">
										${user.name} �α׾ƿ�</a></li>
							</c:if>
							<c:if test="${null eq user.name}">
								<!-- �α��� �� �� ���� -->
								<ul class="largenav pull-right">
									<li class="upper-links"><a class="links" href="login.jsp">�α���
									</a></li>
							</c:if>
							<li class="upper-links dropdown"><a class="links"
								href="getNoticeList.do">������</a>
								<ul class="dropdown-menu">
									<li class="profile-li"><a class="getNoticeList.do" href="">��������</a></li>
									<li class="profile-li"><a class="profile-links"
										href="q&a.jsp#tab2">���ֹ�������</a></li>
									<li class="profile-li"><a class="profile-links"
										href="q&a.jsp#tab3">1:1����</a></li>
								</ul></li>
							<c:if test="${null ne user.name}">
								<!-- �α��� �� ���� -->
								<li class="upper-links dropdown"><a class="links"
									href="mypage2.jsp">����������</a>
							</c:if>
							<ul class="dropdown-menu">
								<li class="profile-li"><a class="profile-links"
									href="mypage2.jsp">�ֹ������ȸ</a></li>
								<li class="profile-li"><a class="profile-links"
									href="http://hacksociety.tech/">���/��ȯ/��ǰ</a></li>
								<li class="profile-li"><a class="profile-links"
									href="mypage_custom_info.jsp">��������</a></li>
								<li class="profile-li"><a class="profile-links"
									href="mypage_custom_info.jsp">����Ʈ</a></li>
							</ul>
							</li>
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
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("�����Ƿ�", "UTF-8")%>">����
											�Ƿ�</a></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("�����Ƿ�", "UTF-8")%>">����
											�Ƿ�</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("�Ź�", "UTF-8")%>">�Ź�</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("���/�ð�", "UTF-8")%>">���/�ð�</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("��Ƽ", "UTF-8")%>">��Ƽ</a></li>
									<li class="divider"></li>
									<li><a
										href="getCategory.do?category=<%=URLEncoder.encode("��ǰ", "UTF-8")%>">��ǰ</a></li>
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
	<!-- ��� �� -->

<!-- notice -->
<section>

<div class="container">

<!-- tab menu -->
<div class="tabbable">
  <ul class="nav nav-tabs" id="mytab">
    <li class="active"><a href="getNoticeList.do">��������</a></li>
    <li><a href="#tab2" data-toggle="tab">���ֹ�������</a></li>
    <li><a href="#tab3" data-toggle="tab">1:1 ����</a></li>
  </ul>
  <div class="tab-content">
    <div class="tab-pane active" id="tab1">
    
    	<div class="container">
    	<h3 class="text-center text-success"> �������� </h3><br>
    	<table class="table table-hover" style="text-align: center;">
			  <tr>
			  	<td>��ȣ</td>
			  	<td>����</td>
			  	<td>��¥</td>
			  	<td>��ȸ��</td>
			  </tr>
			  <tr>
			 <c:forEach var="notice" items="${noticeList}"> <!-- get�� �Ⱦ��� ������ Ŀ�ǵ� ��ü���� ������� ���⶧���� ������ board.getSeq()�� -->
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
			<h3 class="text-center text-success"> ���ֹ��� ���� </h3><br>
		    <div class="notice">
		        <strong class="readMore">ȯ���� ��û�ߴµ� ȯ�� �Ⱓ�� �󸶳� �ҿ�ǳ���?</strong>
		          <div class="desc">
		            <br>
		            <p>
						<strong style="color:red;">�� �������ܺ� ȯ�� �Ⱓ ����</strong><br><br>
						ȯ�� ���� �Ϸ� ��, ���� ���ܺ� ȯ�� ������ �Ʒ��� ���� �ҿ�˴ϴ�.<br>
						(��ǰȯ���� ��ǰ ȸ��>��ü �԰�>ȯ�ҽ��δܰ踦 ���� ����ǿ��� ���� ��Ź�帳�ϴ�.)<br><br>
						  - �ſ�ī�� : 2 ������ �̳�, ī��� ���� ���(������,��������,���̳��� �� ������� ����)<br>
						  - üũī�� : 2 ������ �̳�, ī��� ���� ��� �� �ش� ī�忡 ����� ���·� �Ա�<br>
						  - �ǽð� ������ü : 2 ������ �̳�, ���� ��� �� ���� ���·� �Ա�<br>
						  - �޴��� ���� : �޴��� ���� ��ü ��� ��, ��� ��� �ݿ� <br>
							&nbsp;&nbsp;(�޴��� ���� ���� �ֹ� �� �κ� ��� ���� ȯ���� ��쿡�� �Ʒ� �������Ա� ȯ�Ұ� �����ϰ� ����˴ϴ�.)<br>
						  - �������Ա� : 2 ������ �̳� ȯ�ҽ�û ���·� �Ա�<br>
						    &nbsp;&nbsp;(Ex. 7�� 6��(��) ������/���/ȯ�� ���� > 7�� 10��(ȭ) �̳� ������ ��� �ݿ�)<br>
						  - ������ ����Ʈ : ��� ����<br>
						    &nbsp;&nbsp;(��, �������Ա�+����Ʈ ���� ������ �������Աݰ� ȯ��ó�� ���� ����Ʈ �����˴ϴ�.)<br><br>
						<small>�亯�� ������� �����̴ٸ�, 1:1���Ǹ� �̿��� �ּ���.</small>
		            </p>        
		        </div>
		    </div>
		    <div class="notice">
		        <strong class="readMore">�Ǹ��ڿ��� ��� ���� �� �� �ֳ���?</strong>
		          <div class="desc">
		            <br>
		            <p>
						<strong style="color:red;">�� ��ǰ �������� > ��ǰ����, ���ų���>�ֹ��� �� ����� �Ǹ��� ����ó �Ǵ� ��ǰ Q&A �Խ����� ���� ���� ���� ����</strong><br><br>
						- ��ǰ �� �������� �ֹ�����>�ֹ��󼼺��� ���� �Ǹ������� Ȯ���� �����մϴ�.<br>
						  &nbsp;&nbsp;(��������: �Ǹ��ڸ�/��ȣ/��ǥ�ڸ�/��ȭ��ȣ/�̸���/����ڵ�Ϲ�ȣ/�ּ� ��)<br>
						  &nbsp;&nbsp;�Ǹ��������� ����� ��ȭ��ȣ �Ǵ� ��ǰ������ Q&A�� ���� �Ǹ��ڿ��� ���� ������ �� �ֽ��ϴ�.<br><br>			
						- Q&A�Խ��ǿ� �ۼ��Ͻ� ���� �� �亯 ������ ���������� > Q&A���� Ȯ�� �� �� �ֽ��ϴ�.<br>
						  &nbsp;&nbsp;(�Ǹ������ ��ǰ�� ���ؼ��� Q&A ���� �ۼ��� �Ұ��մϴ�.)<br><br>			
						�߰� ���� ������ �ִ� ��� [���������� > ��������] �� �̿��Ͻðų�,<br>
						1:1���� �������ֽø� ���������� Ȯ���Ͽ� �ȳ��帮�ڽ��ϴ�.<br><br>
						<small>�亯�� ������� �����̴ٸ�, 1:1���Ǹ� �̿��� �ּ���.</small>
		            </p>        
		        </div>
		    </div>
		    <div class="notice">
		        <strong class="readMore">����Ʈ�� �������� ��ȯ�� �� �ֳ���?</strong>
		          <div class="desc">
		            <br>
		            <p>
		               <strong style="color:red;">�� ��������Ʈ�� ȯ�� ����</strong><br><br>
						����������Ʈ�� �������� ��ȯ�� �� �����ϴ�.<br>
						����������Ʈ�� ��� 5% ȯ�� ������� �����ǰ� 95%�� ȯ���� �����մϴ�.<br>
						����������Ʈ ȯ�� ��û �� ���� ����Ʈ�� �ٷ� ȸ���Ǹ�, 5% ȯ�޼����Ḧ ������ ������ �ݾ׸� ȯ�� ó���˴ϴ�.<br>
						  &nbsp;&nbsp;&nbsp;(90% ���� ȯ��, 5% ����Ʈ ȯ��)<br>
						����������Ʈ ȯ���� ��û�Ϸκ��� 3~6�� �� ���޵˴ϴ�.<br>
						  &nbsp;&nbsp;&nbsp;��, ����ȯ�� ��û �ݾ��� 30������ ���� ��� ��û�Ϸκ��� 7~10�� �� ���޵˴ϴ�.<br>
						������������ �������Ա� �Ǵ� �޴��� �������� �ֹ� �� �κ���ҷ� ���� ȯ���� �ʿ��ϳ� ���¹�ȣ Ȯ���� ����� ���<br>
						   &nbsp;&nbsp;&nbsp;������ ��������Ʈ�� �켱 ȯ�� �� �� ������, ����Ʈ ����� ��ġ ���� ��� 1:1���Ǹ� �������ֽø� ���޵� ����Ʈ ȸ�� �� ���� ���� ȯ���� �����մϴ�.<br><br>
						<small>�亯�� ������� �����̴ٸ�, 1:1���Ǹ� �̿��� �ּ���.</small>
		            </p>        
		        </div>
		    </div>
		    <div class="notice">
		        <strong class="readMore">�����Ϳ��� ��ȭ������ ���� Ȯ�� �� �븮 ������ �����Ѱ���?</strong>
		          <div class="desc">
		            <br>
		            <p>
		               <strong style="color:red;">�� �ڷ���Ʈ �����͸� ���� ����(����) ���� ����</strong><br><br>
						����ȭ�ֹ� �̿� ���� ��� �� ������������ ������ ���Բ����� ������ �� �� ��ǰ ���� �̿� �����մϴ�.<br>
						  &nbsp;&nbsp;&nbsp;(��, ��ó/����, �Ե���ȭ�� �� �������Ա� ���ܵ��� �Ұ�)<br>
						�������� �Ա� �������ܸ� �����մϴ�.<br>
						���ڷ���Ʈ ������ : 1644-4555 | ���� 09��~18�� (���ɽð� 13��~14��)<br><br>
						<small>�亯�� ������� �����̴ٸ�, 1:1���Ǹ� �̿��� �ּ���.</small>
		            </p>        
		        </div>
		    </div>
		    <div class="notice">
		        <strong class="readMore">�̹� �ֹ��� �ߴµ�, ������� �����ϰ� �;��.</strong>
		          <div class="desc">
		            <br>
		            <p>
		               <strong style="color:red;">�� ���������� > �ֹ������ȸ ������ ���� ���氡��</strong><br><br>
						������� ������ ���������� > �ֹ������ȸ ���������� ���Ż󼼳��� > �������/����� ���� ��ư�� Ŭ���Ͽ� ������ �� �ֽ��ϴ�.<br>
						������� ������ ��ǰ�� �߼۵Ǳ� �� '�Աݴ��' �� '����غ���/�ű��ֹ�' �ܰ迡���� ������ �����մϴ�.<br>
						���� ������ȣ�� �ϳ��� ������� �����Ͻ� �� �ֽ��ϴ�.<br>
						��'��ǰ�����/��ǰ�غ���' �ܰ迡���� ������ ����� ��ҽ�û ��Ź�帳�ϴ�. �ٸ� �ﰢ���� ��Ұ� ������, ��ǰ�� ���Ǿ��� ��쿡�� ��Ұ� ����� �� �ֽ��ϴ�.<br>
						����ǰ�� �̹� ���Ǿ� ������� ���¿����� ����� ������ �Ұ����մϴ�.<br><br>
						<small>�亯�� ������� �����̴ٸ�, 1:1���Ǹ� �̿��� �ּ���. 1:1�����ϱ�</small>
		            </p>        
		        </div>
		    </div>
		    <div class="notice">
		        <strong class="readMore">���� ������ ��� ����ϳ���?</strong>
		          <div class="desc">
		            <br>
		            <p>
		               <strong style="color:red;">�� �ֹ�/���� �������� [�������] ��ư ���� > ���밡�� ���� ���� �� [����] ��ư Ŭ��</strong><br><br>
						����ǰ������ �� [�������� �߱�] ��ư�� Ȯ�εǴ� ��ǰ�̶��, �������� ������ ������ ��ǰ�Դϴ�.<br>
						���ֹ�/���� �������� [�������] ��ư���� ���� ������ ���������� ���� �� ����Ͻ� �� �ֽ��ϴ�.<br>
						������������ ���� ��������� �����ϱ� ������, ���������� > ������������ �������� �������� ������ ��������� Ȯ���Ͻñ� �ٶ��ϴ�.<br>
						���������� ���� ����� �� �ִ� ī�װ��� ������ ���� �� �ֽ��ϴ�.<br>
						������ ������ ����� �� �ִ� ī�װ��� ���� �ִ� ��ǰ�̶� �Ϻ� ��ǰ�� �������� �Ұ���ǰ���� �з��� ��찡 �ֽ��ϴ�.<br>
						�������� ����� �Ϻ� Ư���� ��ǰ �Ǵ� Ư�������� ��������� ��ƽ��ϴ�.<br><br>			 
						<small>�亯�� ������� �����̴ٸ�, 1:1���Ǹ� �̿��� �ּ���. 1:1�����ϱ�</small>
		            </p>        
		        </div>
		    </div>
		</div><!-- q&a end -->
    </div><!-- tab2 end -->
    
    <div class="tab-pane" id="tab3">
    	<div class="container">
    	<h3 class="text-center text-success"> 1:1 ���� </h3><br>
    	<p><small>����ǰ����, ��ǰ���Ȯ��, A/S���� ���Ǵ� [��ǰ������ > ��ǰQ&A]�� ���� ��Ʈ�ʻ翡 ���� ���ǽ� ���� ó���� �����մϴ�.<br>
    			    ����ȭ��ȣ, �ּ�, �̸���, ���¹�ȣ ���� ���������� Ÿ�ο� ���� ����� ������ ������, ���� �� �Է����� �ʵ��� ������ �ֽñ� �ٶ��ϴ�.</small></p>
    	<table class="table">
    		<tr>
    			<td class="active"> �������� </td>
    			<td>
	    			<div class="radio">
					  <label><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>��� ���� </label>&nbsp;
					  <label><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1">������������û</label>&nbsp;
					  <label><input type="radio" name="optionsRadios" id="optionsRadios1" value="option1">���/��ȯ/��ǰ</label>
					</div>
    			</td>
    		</tr>
    		<tr>
    			<td class="active"><label>���û�ǰ</label></td>
    			<td>
					<label><input type="text" class="form-control" name="buy_prod" placeholder="������ ��ǰ�� �Է��ϼ���."></label>
    			</td>
    		</tr>
    		<tr>
    			<td class="detail" style="background-color: #eeeeee9e;"><label>�� ���ǳ���</label></td>
    			<td>
    				<textarea rows="10" cols="85" placeholder="�� ���� ������ �ۼ����ֽʽÿ� (500�� �̳�)"></textarea>
    			</td>
    		</tr>
    		<tr>
    		<td></td>
    			<td style="float: left;margin-left: 20%;border-top: 0px;margin-top: 2%;">
    			<input type="submit" value="Ȯ��">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    			<a href="q&a.jsp"><input type="reset" value="���"></a>
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