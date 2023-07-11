<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Find PW page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}
</script>
<style>
.banchan_text {
	font-family: 'Roboto', sans-serif;
	font-weight: bold;
	color: rgb(89, 171, 110);
}
.roboto_font {
font-family: 'Roboto', sans-serif;
font-weight: 400;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center mt-5">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h1 class="banchan_text text-center" style="margin-top: 40px;">BANCHAN</h1>
						<h3 class="text-center roboto_font" style="font-size: 20px;">Find PW</h3>
					</div>
					<div class="card-body">
						<form action="findPw.do" method="post">
							<div class="form-group">
								<label for="member_id" class="roboto_font">ID</label> <input type="text"
									class="form-control" id="member_id" name="member_id"
									placeholder="아이디를 입력하세요">
							</div>
							<div class="form-group" style="margin-top: 15px;">
								<label for="member_email" class="roboto_font">EMAIL</label> <input type="email"
									class="form-control" id="member_email" name="member_email"
									placeholder="이메일을 입력하세요">
							</div>
							<button type="submit" class="btn btn-primary btn-block roboto_font" style="margin-top: 20px;" >비밀번호 찾기</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>