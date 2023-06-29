<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product Update</title>
</head>
<body>
	<h1>상품수정</h1>
	
	<form action="pr_updateOK.do" method="post" enctype="multipart/form-data">
			<table>
			<tr>
				<td><label for="num">상품번호</label></td>
				<td>${vo2.num}<input type="hidden" id="num" name="num" value="${vo2.num}"></td>
			</tr>
						<tr>
				<td><label for="num">카테고리번호</label></td>
				<td>${vo2.num}<input type="hidden" id="category_num" name="category_num" value="${vo2.category_num}"></td>
			</tr>
			<tr>
				<td><label for="product_name">반찬이름</label></td>
				<td><input type="text" id="product_name" name="product_name" value="${vo2.product_name}"></td>
			</tr>
			<tr>
				<td><label for="file">상품이미지</label></td>
				<td><input type="file" id="file" name="file" value="${vo2.product_img}"></td>
			</tr>
			<tr>
				<td><label for="product_price">반찬가격</label></td>
				<td><input type="text" id="product_price" name="product_price" value="${vo2.product_price}"></td>
			</tr>
			<tr>
				<td><label for="product_stock">실시간재고</label></td>
				<td><input type="text" id="product_stock" name="product_stock" value="${vo2.product_stock}"></td>
			</tr>
			<tr>
				<td><label for="product_content">반찬설명</label></td>
				<td><textarea rows="10" cols="20" name="product_content">${vo2.product_content}</textarea></td>
			</tr>
			<tr>
				<td colspan="5"><input type="submit" value="수정완료"></td>
			</tr>
		</table>
	</form>

</body>
</html>