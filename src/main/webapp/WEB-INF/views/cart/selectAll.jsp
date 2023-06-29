<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart TEST</title>
</head>
<body>
	<h1>장바구니</h1>

	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>상품이미지</th>
				<th>상품명</th>
				<th>금액</th>
				<th>구매수량</th>
			</tr>
		</thead>

		<tbody id="vos">
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${vo.num}</td>
					<td><a href="pr_selectOne.do?num=${vo.product_num}"><img width="100px"
							src="resources/uploadimg/${vo.product_img}"></a></td>
					<td>${vo.product_name}</td>
					<td>${vo.product_price}</td>
					<td>${vo.amount}</td>
				</tr>
			</c:forEach>
		</tbody>

		<tfoot>
			<tr>
			</tr>
		</tfoot>
	</table>
</body>
</html>