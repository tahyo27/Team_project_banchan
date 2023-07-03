<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find Pw page</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script type="text/javascript">
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}
</script>
</head>
<body>
	<div class="text-center">
		<h1>비밀번호 찾기</h1>
		<p>아이디와 이메일을 입력해주세요</p>
	</div>
	<form action="findPw.do" method="post">
		<div>
			<input type="text" id="member_id" name="member_id" placeholder="Enter ID">
		</div>

		<div>
			<input type="email" id="member_email" name="member_email" placeholder="Enter Email">
		</div>

		<button type="submit">비밀번호 찾기</button>
	</form>
</body>
</html>