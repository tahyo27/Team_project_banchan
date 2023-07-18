<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script>
	var count = 5;
	var countdown = setInterval(function() {
		document.getElementById("countdown").textContent = count;
		count--;
		if (count < 0) {
			clearInterval(countdown);
			window.location.href = ".home";
		}
	}, 1000); // 1초마다 카운트 다운

	window.onload = function() {
		setTimeout(function() {
			window.location.href = ".home";
		}, 5000); // 5초 후에 "home" 페이지로 이동
	};
</script>
<style type="text/css">
html, div, body, h3 {
	margin: 0;
	padding: 0;
}

h3 {
	display: inline-block;
	padding: 0.6em;
}

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
	<div style="background-color: #15a181; width: 100%; height: 50px; text-align: center; color: white;">
  <h3>Naver_Login Success</h3>
</div>
<br>
<div style="text-align: center;">
  <h2 id="name">환영합니다 ${name}님</h2>
  <h3 id="email">${email}</h3>
  <p class="result_text">이 페이지는 <span id="countdown">5</span>초 후에 자동으로 이동됩니다.</p>
  <a href=".home" style="display: inline-block; margin-top: 10px; text-decoration: none; color: #15a181; font-weight: bold;">홈으로 돌아가기</a>
</div>
</body>

</html>