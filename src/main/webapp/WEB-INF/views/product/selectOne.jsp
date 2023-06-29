<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product selectOne</title>
</head>
<body>
	<h1>반찬정보</h1>

	<table>
		<thead>
			<tr>
				<th>상품번호</th>
				<th>상품이미지</th>
				<th>상품이름</th>
				<th>상품가격</th>
				<th>실시간재고</th>
				<th>상품설명</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${vo2.num}</td>
				<td><img width="250px" src="resources/uploadimg/${vo2.product_img}"></td>
				<td>${vo2.product_name}</td>
				<td>${vo2.product_price}</td>
				<td>${vo2.product_stock}</td>
				<td>${vo2.product_content}</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5"><a href="pr_update.do?num=${param.num}">상품수정</a>
					<a href="pr_deleteOK.do?num=${param.num}">상품삭제</a></td>
			</tr>
		</tfoot>
	</table>
</body>
</html>