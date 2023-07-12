<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>login page</title>
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
	max-width: 400px;
	margin: 70px auto;
	padding: 30px;
	background-color: #ffffff;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
	text-align: center;
}
</style>
</head>
<body>
	<div class="logo-block">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<a href="home">BANCHAN</a>
				</div>
			</div>
		</div>
	</div>


	
	<div class="login-form">
		<ul class="nav nav-tabs justify-content-center">
			<li class="nav-item"><a class="nav-link active" href="jsptest">회원가입</a></li>
			<li class="nav-item"><a class="nav-link" href="SNS_Login.do">로그인</a></li>
		</ul>
		
		<br>
		<hr>
		<form action="" method="post">
		</form>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>