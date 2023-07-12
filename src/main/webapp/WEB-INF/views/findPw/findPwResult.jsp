<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FindPW Result Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
	var count = 5;
	var countdown = setInterval(function() {
		document.getElementById("countdown").textContent = count;
		count--;
		if (count < 0) {
			clearInterval(countdown);
			window.location.href = "home";
		}
	}, 1000); // 1초마다 카운트 다운

	window.onload = function() {
		setTimeout(function() {
			window.location.href = "home";
		}, 5000); // 5초 후에 "home" 페이지로 이동
	};
</script>
<style>
.result_text {
	color: black;
	font-size: 24px;
	font-weight: bold;
	margin-top: 40px;
	font-family: 'Roboto', sans-serif;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center mt-5">
			<div class="col-md-6">
				<div class="card border-0 shadow">
					<div class="card-body text-center">
						<h2 class="result_text">임시 비밀번호가 전송되었습니다.</h2>
						<br>
						<h1 class="result_text">${member_email}</h1>
						<br>
						<h2 class="result_text">을 확인해주세요.</h2>
						<p class="result_text">
							이 페이지는 <span id="countdown">5</span>초 후에 자동으로 이동됩니다.
						</p>
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