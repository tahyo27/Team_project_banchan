<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<script type="text/javascript">
	var msg = "${msg}";

	if (msg != "") {
		alert(msg);
	}
</script>
</head>
<body>
	<h1>로그인</h1>

	<form action="loginOK.do" method="post">
		<table>
			<tr>
				<td><label for="id">id:</label></td>
				<td><input type="text" id="member_id" name="member_id" value=""></td>
			</tr>
			<tr>
				<td><label for="pw">pw:</label></td>
				<td><input type="password" id="member_pw" name="member_pw" value=""></td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="로그인" ></td>
			</tr>
		</table>
	</form>
</body>
</html>