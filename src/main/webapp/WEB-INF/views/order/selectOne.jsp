<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section class="container tab-content">
	<h3>주문 상세정보</h3>

	<h4 class="mt-5">주문 상품정보</h4>
	<table class="table text-center align-middle">
		<thead>
			<tr>
				<th colspan="2">상품정보</th>
				<th>수량</th>
				<th>금액</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="detail" items="${vo.details}">
				<tr>
					<td>
						<img class="rounded float-start" height="100px"
							src="${pageContext.request.contextPath}/resources/uploadimg/product/${detail.product_img}">
					</td>
					<td>${detail.product_name}</td>
					<td>${detail.amount}</td>
					<td>
						<fmt:formatNumber value="${detail.price}" pattern="#,###" />원
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<h4 class="mt-5">배송정보</h4>
	<table class="table">
		<tbody>
			<tr>
				<td>수령인</td>
				<td>${vo.receiver_name}</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${vo.tel}</td>
			</tr>
			<tr>
				<td>배송지</td>
				<td>(${vo.zipcode}) ${vo.address1} ${vo.address2}</td>
			</tr>
			<tr>
				<td>배송메모</td>
				<td>${vo.memo}</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td>상태</td>
				<td>${vo.status}</td>
			</tr>
		</tfoot>
	</table>

	<h4 class="mt-5">결제정보</h4>
	<table class="table">
		<tbody>
			<tr>
				<td>상품금액</td>
				<td class="text-end">
					<fmt:formatNumber value="${vo.order_price}" pattern="#,###" />원
				</td>
			</tr>
			<tr>
				<td>배송비</td>
				<td class="text-end">
					<fmt:formatNumber value="${vo.delivery_fee}" pattern="#,###" />원
				</td>
			</tr>
			<tr>
				<td>쿠폰할인</td>
				<td class="text-end">
					<fmt:formatNumber value="${vo.discount_coupon}" pattern="#,###" />원
				</td>
			</tr>
			<tr>
				<td>포인트사용</td>
				<td class="text-end">
					<fmt:formatNumber value="${vo.use_point}" pattern="#,###" />원
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td>결제금액</td>
				<td class="text-end">
					<fmt:formatNumber value="${vo.total_price}" pattern="#,###" />원
				</td>
			</tr>
		</tfoot>
	</table>
	<div class="row">
		<div class="col text-end mt-2">
			<button type="button" class="btn btn-danger btn-lg px-3" onclick="cancleOrder(${vo.num})">취소</button>
		</div>
	</div>
</section>
<script type="text/javascript">
	async function cancleOrder(num) {
		console.log('order.num:', num);

		const formData = new FormData();
		formData.append('num', num);

		let response = await fetch('order/cancleOk.do', {
			method: 'POST',
			body: formData
		});

		let result = await response.json();
		console.log(result);

		if (result.result > 0) {
			alert('주문 취소가 완료되었습니다.');
			location.href = 'o_mypageOrder.do?num=' + num;
		} else {
			alert('주문 취소가 실패되었습니다.');
		}
	}
</script>