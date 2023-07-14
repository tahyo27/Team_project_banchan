<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>login page</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<style>
/* 추가적인 CSS 스타일링을 위한 스타일 시트 */
body {
	background-color: #f8f9fa; /* 배경 회색 */
}

.logo-block {
	background-color: #ffffff; /* 로고 블록 흰색 배경 */
	width: 100%;
	padding: 20px;
}

.login-block {
	background-color: #ffffff; /* 로그인 블록 흰색 배경 */
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	margin-top: 50px;
	box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

.login-form {
	max-width: 550px;
	margin: 70px auto;
	padding: 30px;
	background-color: #ffffff;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
	text-align: center;
}

#kakao_id_login {
	margin-top: 10px;
}

#google_id_login {
	margin-top: 10px;
}

.login-form table {
	width: 300px;
	border-collapse: collapse;
}

.login-form table td {
	padding: 10px;
}

.login-form table input[type="text"], .login-form table input[type="password"]
	{
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-left:85px;
}

.login-form table input[type="submit"] {
	padding: 10px 20px;
	background-color: #337ab7;
	border: none;
	border-radius: 3px;
	color: #fff;
	cursor: pointer;
	width: 95%;
	margin-left: 102px;
}

.roboto_font {
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
}
.last_one {
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
	font-size:10;
	margin-top:10px;
}
.top-font {
	font-family: 'Roboto', sans-serif;
	font-weight: 600;
	color: rgb(89, 171, 110);
	font-size:30px;
	text-decoration: none;
}
</style>

<script type="text/javascript">
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
		// 현재 URL에서 파라미터를 제거하고 다시 로드
		var currentUrl = window.location.href;
		var newUrl = currentUrl.split('?')[0];
		window.location.href = newUrl;
	}
</script>
</head>

<body>
	<div class="logo-block">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<a href="home" class="top-font">BANCHAN</a>
				</div>
			</div>
		</div>
	</div>

	<div class="login-form">
		<ul class="nav nav-tabs justify-content-center">
			<li class="nav-item"><a class="nav-link" href="m_insert.do">회원가입</a></li>
			<li class="nav-item"><a class="nav-link active" href="SNS_Login.do">로그인</a></li>
		</ul>
		<br> <br>
		<h6 class="roboto_font">안녕하세요! BANCHAN입니다 🙂</h6>
		<br>
		<hr>
		<br>
		<div>
			<div id="naver_id_login" style="text-align: center">
				<a href="${naver_url}"><img width="220" height="55"
					src="${pageContext.request.contextPath}/resources/SNSimg/btnG_완성형.png" /></a>
			</div>
			<div id="kakao_id_login" style="text-align: center">
				<a href="${kakao_url}"><img width="220" height="55"
					src="${pageContext.request.contextPath}/resources/SNSimg/kakao_login_large_narrow.png" /></a>
			</div>
			<div id="google_id_login" style="text-align: center">
				<a href="${google_url}"><img width="220" height="55"
					src="${pageContext.request.contextPath}/resources/SNSimg/btn_google_signin_dark_normal.png" /></a>
			</div>
		</div>
		<br>
		<hr>
		<div class="roboto_font">아이디/비밀번호로 로그인</div>
		<form action="loginOK.do" method="post">
			<table>
				<tr>
					<td><label for="id"></label></td>
					<td><input type="text" id="member_id" name="member_id"
						placeholder="아이디를 입력해 주세요." value=""></td>
				</tr>
				<tr>
					<td><label for="pw"></label></td>
					<td><input type="password" id="member_pw" name="member_pw"
						placeholder="비밀번호를 입력해 주세요." value=""></td>
				</tr>

				<tr>
					<td colspan="2"><input type="submit" value="로그인"></td>
				</tr>
			</table>
		</form>
		<div class="last_one">
			<a href="findPwView.do">아이디/비밀번호를 잊으셨나요?</a><br>BANCHAN 회원이 아니신가요? &nbsp;
			<a href="m_insert.do">회원가입</a>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>