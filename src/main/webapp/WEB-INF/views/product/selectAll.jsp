<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product Test</title>
</head>
<body>
<h1>반찬목록</h1>
<!-- 	<div> -->
<!-- 		<form action="pr_searchList.do"> -->
<!-- 			<select name="searchKey" id="searchKey"> -->
<!-- 			<option value="name"name>상품명</option> -->
<!-- 		</select>  -->
<!-- 		<input type="text" name="searchWord" id="searchWord" value=""> -->
<!-- 		<input type="submit" value="상품검색">  -->
<!-- 		</form> -->
<!-- 	</div> -->

	<table >
		<thead>
			<tr>
				<th>상품번호</th>
				<th>상품이미지</th>
				<th>상품이름</th>
				<th>상품가격</th>
<!-- 			<th>카테고리번호</th> -->
			</tr>
		</thead>
		<tbody id="vos">
			<c:forEach var="vo" items="${vos}">
				<tr>
					
<%-- 			<td><a href="pr_selectOne.do?num=${vo.num}">${vo.num}</a></td> --%>
					<td>${vo.num}</td>
					<td><img width="35px" src="resources/uploadimg/thumb_${vo.product_img}"></td>
					<td>${vo.product_name}</td>
					<td>${vo.product_price}</td>
<%-- 				<td>${vo.category_num}</td> --%>
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