<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>login</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/login.css">
</head>

<body>
	<section>
		<div class="signin-wrapper clearfix">
			<div class="col-md-12 centered clearfix">
				<div class="signin " style="max-width: 440px; margin: 0 auto;">
					<div class="signin-heading centered">
						<h4
							class="c-slate lineHeight-l fontSize-l fontWeight-5 textAlign-center breakPointS-fontSize-xl"
							style="color: white;">
							로그인<br />
						</h4>
					</div>
					<div class="marginBottom-l textAlign-center">
						<span class="fontSize-m fontWeight-3 c-silver"
							style="font-size: 1.9em;"> 로그인 </span>
					</div>
					<div class="signin-form">
						<form class="marginBottom-m breakPointS-marginBottom-l"
							action="login.do" name="loginForm" method="POST">
							<div class="marginBottom-m email">
								<div class="width-100 uiIcon uiIcon--l">
									<input class="width-100 input input--default input--l"
										type="text" name="id" placeholder="아이디를 입력하세요!">

									<svg class="svgIcon fill-smoke--d" width="30" height="30"
										viewBox="0 -6 30 30" enable-background="new 0 -6 30 30">
                                    <path
											d="M15 11.9c-.9 0-1.7-.2-2.3-.7l-5.7-4.4v8.1c0 .1 0 .3.1.4.1.1.2.2.3.2 2.5.4 5 .5 7.5.5s5-.2 7.5-.5c.1 0 .3-.1.4-.2.2-.1.2-.3.2-.4v-8.1l-5.7 4.4c-.6.5-1.4.7-2.3.7zm-1.3-2.3c.3.3.8.4 1.3.4s1-.1 1.3-.4l6.1-4.7c.3-.3.5-.6.6-1v-.8c0-.1 0-.3-.1-.4-.1-.1-.2-.2-.4-.2-2.5-.3-5-.5-7.5-.5s-5 .2-7.5.5c-.1 0-.2.1-.3.2-.2.1-.2.3-.2.4v.9c.1.3.3.6.6 1l6.1 4.6z"></path>
                                </svg>
								</div>

								<div class="error textAlign-center"></div>
							</div>

							<div class="marginBottom-s password">
								<div class="width-100 uiIcon uiIcon--l">
									<input class="width-100 input input--default input--l"
										type="password" name="passwd" placeholder="암호를 입력하세요">

									<svg class="svgIcon fill-smoke--d" width="30" height="30"
										viewBox="0 -6 30 30" enable-background="new 0 -6 30 30">
                                    <path
											d="M21.6 8.3c-.2-.2-.5-.3-.9-.3h-.7v-2.6c0-1.3-.5-2.4-1.4-3.2-.9-.8-2.1-1.2-3.6-1.2s-2.7.4-3.6 1.2c-.9.8-1.4 1.9-1.4 3.2v2.6h-.7c-.3 0-.7.1-.9.4-.3.2-.4.5-.4.8v6.1c0 .3.1.5.3.7.2.2.4.3.7.4 1.9.4 3.9.6 6 .6 2 0 4-.2 5.9-.6.3-.1.5-.2.7-.4.2-.2.3-.4.3-.7v-6.1c.1-.3 0-.6-.3-.9zm-8.6-2.4c0-1.3.7-1.9 2-1.9s2 .6 2 1.9v2.1h-4v-2.1z"></path>
                                </svg>
								</div>

								<div class="error textAlign-center"></div>
							</div>

							<div>
								<button id="login-button" type="submit"
									class="width-100 button button--l button--flat bg-green c-white">
									로그인</button>
							</div>
						</form>

					</div>
					<div class="margin-t-3">
						<span class="c-silver fontWeight-3"><a
							class="js-signup-link link link--blue" href="joinMember.jsp">회원가입</a></span>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>
	<!--Login design ends here-->
</body>
</html>