<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Insert page</title>

</head>
<body>
	<h1>반찬등록</h1>

	<form action="pr_insertOK.do" method="post" enctype="multipart/form-data">
		<table id="memberList">
		<tr>
				<td><label for="category_num">카테고리번호</label></td>
				<td><input type="text" id="category_num" name="category_num" value=""></td>
			</tr>
			<tr>
				<td><label for="product_name">반찬이름</label></td>
				<td><input type="text" id="product_name" name="product_name" value="반찬이름"></td>
			</tr>
			<tr>
				<td><label for="file">상품이미지</label></td>
				<td><input type="file" id="file" name="file"></td>
			</tr>
			<tr>
				<td><label for="product_price">반찬가격</label></td>
				<td><input type="text" id="product_price" name="product_price" value="5000"></td>
			</tr>
			<tr>
				<td><label for="prodoct_stock">실시간재고</label></td>
				<td><input type="text" id="prodoct_stock" name="prodoct_stock" value="100"></td>
			</tr>
			<tr>
				<td><label for="product_content">반찬설명</label></td>
				<td><textarea rows="10" cols="20" name="product_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="5"><input type="submit" value="등록완료"></td>
			</tr>
		</table>
	</form>

</body>
</html>

