<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>review selectAll</title>

</head>
<body>
	<h3>사용자 리뷰 목록(나의 리뷰)</h3>
	

	<table border="1">
	<thead>
		<tr>
			<td>상품명</td>
			<td>리뷰작성일</td>
			<td>리뷰내용</td>
			<td></td>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${vos}">
		<tr>
			<td>${vo.product_name}</td>
			<td>${vo.wdate}</td>
			<td>${vo.review_content}</td>
			<td><a href="re_deleteOK.do?num=${vo.num}">삭제</a></td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>