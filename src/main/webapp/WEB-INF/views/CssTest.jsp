<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>login page</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<script>
	function showForm() {
		var form = document.getElementById("myForm");
		form.style.display = "block"; // 폼 보이기
	}
</script>
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

form {
	font-size: 14px;
}

.btn-primary {
	background-color: #337ab7; /* 어두운 회색 배경색상 */
	border-color: #337ab7; /* 어두운 회색 테두리 색상 */
	color: #ffffff; /* 흰색 텍스트 색상 */
}

.hidden-form {
	display: none; /* 폼 숨김 */
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
		<!-- 	폼보여주는 버튼 -->
		<div class="row mb-3">
			<div class="col-sm-12 text-center">
				<button type="button" onclick="showForm()" class="btn btn-primary">폼
					보기</button>
			</div>
		</div>
		<div class="row mb-3 hidden-form" id="myForm">
			<form action="m_insertOK.do" method="post"
				enctype="multipart/form-data" class="input_form">

				<div class="row mb-3">
					<label for="id" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-10">
						<div class="input-group">
							<input type="text" class="form-control" id="id" name="member_id"
								required>
							<button type="button" onclick="idCheck()"
								class="btn btn-primary idCheckButton">중복체크</button>
						</div>
					</div>
				</div>

				<div class="row mb-3">
					<label for="pw" class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="pw"
							name="member_pw">
					</div>
				</div>

				<div class="row mb-3">
					<label for="name" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name"
							name="member_name">
					</div>
				</div>

				<div class="row mb-3">
					<label for="email" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-10">
						<div class="input-group">
							<input type="email" class="form-control" id="userEmail"
								name="member_email" placeholder="이메일을 입력하세요" required>
							<button type="button" class="btn btn-primary" id="mail-Check-Btn"
								onclick="mailCheck()">이메일 인증</button>
						</div>
					</div>
				</div>

				<div class="row mb-3">
					<label for="member_zipcode" class="col-sm-2 col-form-label">우편번호</label>
					<div class="col-sm-10">
						<div class="input-group">
							<input id="member_zipcode" name="member_zipcode"
								class="form-control" readonly>
							<button type="button" onclick="daum_address_find()"
								class="btn btn-primary">우편번호찾기</button>
						</div>
					</div>
				</div>

				<div class="row mb-3">
					<label for="member_address1" class="col-sm-2 col-form-label">주소</label>
					<div class="col-sm-10">
						<input id="member_address1" name="member_address1"
							class="form-control" readonly>
					</div>
				</div>

				<div class="row mb-3">
					<label for="member_address2" class="col-sm-2 col-form-label">상세주소</label>
					<div class="col-sm-10">
						<input id="member_address2" name="member_address2"
							class="form-control" readonly>
					</div>
				</div>

				<div class="row mb-3">
					<label for="tel" class="col-sm-2 col-form-label">전화번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="tel" name="member_tel"
							value="">
					</div>
				</div>

				<div class="row mb-3">
					<label for="file" class="col-sm-2 col-form-label">프로필</label>
					<div class="col-sm-10">
						<input type="file" class="form-control" id="file" name="file"
							value="">
					</div>
				</div>

				<div class="text-center">
					<button type="submit" class="btn btn-primary" style="width: 60%;">제출</button>
				</div>

			</form>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>