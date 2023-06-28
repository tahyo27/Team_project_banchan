<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAll TEST</title>
</head>
<body>
	<h1>회원목록</h1>
	
	<div style="padding:5px">
		<form action="m_searchList.do">
			<select name="searchKey" id="searchKey">
				<option value="name">name</option>
<!-- 				<option value="tel">tel</option> -->
			</select>
			<input type="text" name="searchWord" id="searchWord" value="">
			<input type="submit" value="검색">
		</form>
	</div>

	<table>
	<thead>
		<tr>
			<th>num</th>
			<th>id</th>
			<th>pw</th>
			<th>name</th>
			<th>tel</th>
			<th>email</th>
			<th>profile</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="vo" items="${vos}">
			<tr>
				<td><a href="m_selectOne.do?num=${vo.num}">${vo.num}</a></td>
				<td>${vo.member_id}</td>
				<td>${vo.member_pw}</td>
				<td>${vo.member_name}</td>
				<td>${vo.member_tel}</td>
				<td>${vo.member_email}</td>
				<td><img width="35px" src="resources/uploadimg/thumb_${vo.member_profile}"></td>
			</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5">1 2 3 4 5</td>
		</tr>
	</tfoot>
	</table>
</body>
</html>