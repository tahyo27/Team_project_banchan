<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Update</title>
</head>
<body>
	<h1>회원수정</h1>
	
	<form action="m_updateOK.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td><label for="num">num:</label></td>
				<td><span id="span_num">${vo2.num}</span><input type="hidden" id="num" name="num"
					value="${vo2.num}"></td>
			</tr>
			<tr>
				<td><label for="id">id:</label></td>
				<td><span id="span_id">${vo2.member_id}</span></td>
			</tr>
			<tr>
				<td><label for="pw">pw:</label></td>
				<td><input type="password" id="pw" name="member_pw" value="${vo2.member_pw}"></td>
			</tr>
			<tr>
				<td><label for="name">name:</label></td>
				<td><input type="text" id="name" name="member_name"
					value="${vo2.member_name}"></td>
			</tr>
			<tr>
				<td><label for="tel">tel:</label></td>
				<td><input type="text" id="tel" name="member_tel" value="${vo2.member_tel}"></td>
			</tr>
			<tr>
				<td><label for="email">email:</label></td>
				<td><span id="span_email">${vo2.member_email}</span></td>
			</tr>
			<tr>
				<td><label for="file">file:</label></td>
				<td>
					<input type="file" id="file" name="file">
					<input type="hidden" id="profile" name="member_profile" value="${vo2.member_profile}">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원수정완료"></td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>