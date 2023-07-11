<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<style>
.my-text {
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
						<h3 class="text-center">비밀번호 찾기</h3>
					</div>
					<div class="card-body">
						<form action="findPw.do" method="post">
							<div class="form-group">
								<label for="member_id">아이디</label> <input type="text"
									class="form-control" id="member_id" name="member_id"
									placeholder="아이디를 입력하세요">
							</div>
							<div class="form-group">
								<label for="member_email">이메일</label> <input type="email"
									class="form-control" id="member_email" name="member_email"
									placeholder="이메일을 입력하세요">
							</div>
							<button type="submit" class="btn btn-primary btn-block">비밀번호
								찾기</button>
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