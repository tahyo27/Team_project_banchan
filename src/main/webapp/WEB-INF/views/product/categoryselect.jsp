<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product Test</title>
</head>
<body>

	<table>
		<thead>
			<tr>
				<th>상품번호</th>
				<th>상품이미지</th>
				<th>상품이름</th>
				<th>상품가격</th>
<!-- 			<th>카테고리번호</th> -->
			</tr>
		</thead>
		<tbody id="cvos">
			<c:forEach var="vo" items="${cvos}">
				<tr>
					<td>${vo.num}</td>
					<td><a href="pr_selectOne.do?num=${vo.num}"><img
							width="300px" src="resources/uploadimg/product/${vo.product_img}"></a></td>
					<td>${vo.product_name}</td>
					<td><fmt:formatNumber value="${vo.product_price}" pattern="#,###"/>원</td>
				</tr>
			</c:forEach>

		</tbody>
		<tfoot>
			<tr>
				<td colspan="6">1 2 3 4 5</td>
			</tr>
		</tfoot>
	</table>


</body>
</html>