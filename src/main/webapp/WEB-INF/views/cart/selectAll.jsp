<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart selectAll</title>
<script type="text/javascript">
function updateQuantity(form) {
    form.submit();
}

</script>

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
		<c:forEach var="vo" items="${map.vos}" varStatus="i">
			<tr>
				<td><a href="pr_selectOne.do?num=${vo.product_num}">
					<img width="100px"
					src="resources/uploadimg/${vo.product_img}"></a>
				</td>
				<td>${vo.product_name}</td>
				<td><fmt:formatNumber value="${vo.product_price}" pattern="#,###" />원</td>
				<td>
					<form action="c_updateOK.do" method="post" onsubmit="updateQuantity(this); return false;">
						<input type="hidden" name="num" value="${vo.num}">
						<select name="amount">
							<c:forEach begin="1" end="20" var="i">
								<option value="${i}" ${i == vo.amount ? 'selected' : ''}>${i}</option>
							</c:forEach>
						</select>&nbsp;개
						<input type="submit" value="변경">
					</form>
				</td>
				<td><a href="c_deleteOK.do?num=${vo.num}">삭제하기</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5">
				50,000원 이상 구입시 배송비 무료입니다<br>
				장바구니 금액 합계 : <fmt:formatNumber value="${map.sumMoney}" pattern="#,###" />원<br>
				배송비 :  <fmt:formatNumber value="${map.fee}" pattern="#,###" />원<br>
				전체 주문 금액 : <fmt:formatNumber value="${map.allSum}" pattern="#,###" />원<br>
			</td>
		</tr>
	</table>
</body>
</html>