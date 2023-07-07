<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product selectOne</title>
</head>
<body>
	<h1>반찬정보</h1>
			
			<a href="pr_update.do?num=${param.num}">상품수정(관리자)</a>
			<a href="pr_deleteOK.do?num=${param.num}">상품삭제(관리자)</a>
			

	<table border=1>
		<tr>
			<td><img width="300px"
				src="resources/uploadimg/${vo2.product_img}"></td>
			<td>
				<table border=1>
					<tr>
						<td>상품명</td>
						<td>${vo2.product_name}</td>
					</tr>
					<tr>
						<td>상품가격</td>
						<td><fmt:formatNumber value="${vo2.product_price}" pattern="#,###"/>원</td>
					</tr>
					<tr>
						<td>실시간재고</td>
						<td>${vo2.product_stock}</td>
					</tr>
					<tr>
						<td colspan="2">
							<form action="c_insertOK.do" method="post">
								<input type="hidden" name="product_num" value="${vo2.num}"> 
								<select	name="amount">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>&nbsp;개 
								<input type="submit" value="장바구니에 담기">
							</form>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<table>
		<tr>
		<td>${vo2.product_content}</td>
		</tr>
	</table>
	<hr>
	<h3>리뷰 목록</h3>
	
	<table border="1">
	<thead>
		<tr>
			<td>상품명</td>
			<td>작성자</td>
			<td>리뷰작성일</td>
			<td>리뷰내용</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="vo" items="${rvos}">
		<tr>
			<td>${vo.product_name}</td>
			<td>${vo.member_id}</td>
			<td>${vo.wdate}</td>
			<td>${vo.review_content}</td>
		</tr>
		</c:forEach>
		</tbody>
	</table>
	
</body>
</html>