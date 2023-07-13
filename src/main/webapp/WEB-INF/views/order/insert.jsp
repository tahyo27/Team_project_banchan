<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="bg-light">
	<div class="container py-5">
		<div class="row text-center py-3">
			<div class="col-lg-6 m-auto">
				<h1 class="h1">주문/결제</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-9 m-auto mt-5">
				<div class="card">
					<div class="card-body">
						<table class="table text-center align-middle">
							<thead>
								<tr>
									<th colspan="2">상품정보</th>
									<th>수량</th>
									<th>금액</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cart" items="${carts}">
									<tr data-detail='{"product_num":${cart.product_num},"amount":${cart.amount},"price":${cart.product_price * cart.amount}}'>
										<td>
											<img class="rounded float-start" height="100px"
												src="${pageContext.request.contextPath}/resources/uploadimg/product/${cart.product_img}">
										</td>
										<td>${cart.product_name}</td>
										<td>${cart.amount}</td>
										<td>
											<fmt:formatNumber value="${cart.product_price * cart.amount}" pattern="#,###" />원
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<form class="mx-4" id="orderForm">
							<h1 class="h2 mt-5">배송 정보</h1>
							<fieldset class="row mb-3">
								<legend class="col-form-label col-sm-3 pt-0">배송지 선택</legend>
								<div class="col-sm-9">
									<c:forEach var="address" items="${addressBooks}">
										<div class="form-check">
											<input class="form-check-input" type="radio" name="addressBooks"
												id="gridRadios${address.num}" value="${address.num}"
												onclick="setAddress(this)"
												data-name='${address.ab_name}'
												data-zipcode='${address.ab_zipcode}'
												data-address1='${address.ab_address1}'
												data-address2='${address.ab_address2}'
												data-tel='${address.ab_tel}'>
											<label class="form-check-label" for="gridRadios${address.num}">
												${address.ab_address1} ${address.ab_address2}
											</label>
										</div>
									</c:forEach>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="addressBooks"
											id="gridRadios" value="new" onclick="setAddress(this)" checked>
										<label class="form-check-label" for="gridRadios">
											신규배송지
										</label>
									</div>
								</div>
							</fieldset>
							<div class="row">
								<div class="form-group col-md-6 mb-3">
									<label for="inputname">수령인</label>
									<input type="text" class="form-control mt-1" id="name" name="receiver_name" placeholder="Name">
								</div>
								<div class="form-group col-md-6 mb-3">
									<label for="inputname">연락처</label>
									<div class="input-group">
										<input type="text" class="form-control mt-1" id="tel1" name="tel1" maxlength="3" placeholder="010">
										<input type="text" class="form-control mt-1" id="tel2" name="tel2" maxlength="4" placeholder="1234">
										<input type="text" class="form-control mt-1" id="tel3" name="tel3" maxlength="4" placeholder="5678">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6 mb-3">
									<label for="inputname">배송지 주소</label>
									<div class="input-group">
										<input type="text" class="form-control mt-1" name="zipcode" placeholder="">
										<button class="btn btn-success mt-1" type="button" id="button-addon2">우편번호</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6 mb-3">
									<input type="text" class="form-control mt-1" id="address1" name="address1" placeholder="배송지">
								</div>
								<div class="form-group col-md-6 mb-3">
									<input type="text" class="form-control mt-1" id="address2" name="address2" placeholder="상세주소">
								</div>
							</div>
							<div class="mb-3">
								<label for="inputmessage">배송메모</label>
								<textarea class="form-control mt-1" id="memo" name="memo" placeholder="Message" rows="4"></textarea>
							</div>
							<!-- <h1 class="h2 mt-5">쿠폰/포인트</h1>
							<div class="row">
								<div class="form-group col-md-6 mb-3">
									<label for="inputname">쿠폰</label>
									<div class="input-group">
										<input type="text" class="form-control mt-1" name="discount_coupon" placeholder="">
										<button class="btn btn-success mt-1" type="button" id="button-addon2">쿠폰사용</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6 mb-3">
									<label for="inputname">포인트</label>
									<div class="input-group">
										<input type="text" class="form-control mt-1" name="use_point" placeholder="">
										<button class="btn btn-success mt-1" type="button" id="button-addon2">전액사용</button>
									</div>
								</div>
							</div> -->
							<h1 class="h2 mt-5">결제상세</h1>
							<div class="row">
								<div class="col-md-6 mb-3">
									<table class="table">
										<tbody>
											<tr>
												<td>상품금액</td>
												<td class="text-end" data-order_price="${order_price}">
													${order_price} 원</td>
											</tr>
											<tr>
												<td>배송비</td>
												<td class="text-end" data-delivery_fee="${delivery_fee}">
													+${delivery_fee} 원</td>
											</tr>
											<!-- <tr>
												<td>쿠폰할인</td>
												<td class="text-end">-1000 원</td>
											</tr>
											<tr>
												<td>포인트사용</td>
												<td class="text-end">-1000 원</td>
											</tr> -->
										</tbody>
										<tfoot>
											<tr>
												<td>결제금액</td>
												<td class="text-end" data-total_price="${order_price + delivery_fee}">
													${order_price + delivery_fee} 원</td>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col text-end mt-2">
									<button type="submit" class="btn btn-success btn-lg px-3">결제하기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script type="text/javascript">
	const formElem = document.getElementById('orderForm');
	formElem.onsubmit = async (e) => {
		e.preventDefault();

		const formData = new FormData(formElem);

		const details = [];
		document.querySelectorAll('tr[data-detail]').forEach(element => details.push(JSON.parse(element.dataset.detail)));
		console.log(details);

		details.forEach((element, i) => {
			for (const [key, value] of Object.entries(element)) {
				formData.append('details[' + i + '].' + key, value);
			}
		});

		const tel = formData.get('tel1') + '-' + formData.get('tel2') + '-' + formData.get('tel3');
		formData.append('tel', tel);

		const order_price = document.querySelector('td[data-order_price]').dataset.order_price;
		formData.append('order_price', order_price);

		const delivery_fee = document.querySelector('td[data-delivery_fee]').dataset.delivery_fee;
		formData.append('delivery_fee', delivery_fee);

		const total_price = document.querySelector('td[data-total_price]').dataset.total_price;
		formData.append('total_price', total_price);

		for (const pair of formData.entries()) {
			console.log(pair[0] + ', ' + pair[1]);
		}

		let response = await fetch('insertOk.do', {
			method: 'POST',
			body: formData
		});

		let result = await response.json();

		console.log(result);
	};

	function setAddress(addressElem) {
		console.log(addressElem.value);

		if (addressElem.value!='new') {
			const {name, zipcode, address1, address2, tel} = addressElem.dataset;
			const [tel1, tel2, tel3] = tel.split('-');
			document.querySelector('input[name=receiver_name]').value = name;
			document.querySelector('input[name=zipcode]').value = zipcode;
			document.querySelector('input[name=address1]').value = address1;
			document.querySelector('input[name=address2]').value = address2;
			document.querySelector('input[name=tel1]').value = tel1;
			document.querySelector('input[name=tel2]').value = tel2;
			document.querySelector('input[name=tel3]').value = tel3;
		} else {
			document.querySelector('input[name=receiver_name]').value = '';
			document.querySelector('input[name=zipcode]').value = '';
			document.querySelector('input[name=address1]').value = '';
			document.querySelector('input[name=address2]').value = '';
			document.querySelector('input[name=tel1]').value = '';
			document.querySelector('input[name=tel2]').value = '';
			document.querySelector('input[name=tel3]').value = '';
		}
	}
</script>