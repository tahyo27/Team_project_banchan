<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product selectOne</title>
</head>
<body>
	<h1>장바구니</h1>

	<table border="1">
		<tr>
			<td>상품이미지</td>
			<td>상품명</td>
			<td>금액</td>
			<td>수량</td>
			<td></td>
		</tr>
		<c:forEach var="vo" items="${vos}">
		<tr>
			<td><img width="100px"
				src="resources/uploadimg/${vo.product_img}"></td>
			<td>${vo.product_name}</td>
			<td>${vo.product_price}</td>
			<td>${vo.amount}</td>
			<td><a href="c_deleteOK.do?num=${vo.num}">삭제</a></td>
		</tr>
		</c:forEach>
	</table>