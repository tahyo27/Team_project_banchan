<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member selectOne</title>
</head>
<body>
	<h1>회원정보</h1>

	<table>
		<thead>
			<tr>
				<th>num</th>
				<th>id</th>
				<th>pw</th>
				<th>name</th>
				<th>tel</th>
				<th>email</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${vo2.num}</td>
				<td>${vo2.member_id}</td>
				<td>${vo2.member_pw}</td>
				<td>${vo2.member_name}</td>
				<td>${vo2.member_tel}</td>
				<td>${vo2.member_email}</td>
			</tr>
			<tr>
				<td colspan="5"><img width="300px"
					src="resources/uploadimg/${vo2.member_profile}"></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5"><a href="m_update.do?num=${param.num}">회원수정</a>
					<a href="m_deleteOK.do?num=${param.num}">회원삭제</a></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>