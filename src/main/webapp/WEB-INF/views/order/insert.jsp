<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
								<tr>
									<td>
										<img class="rounded float-start" height="100px"
											src="${pageContext.request.contextPath}/resources/uploadimg/default.png">
									</td>
									<td>떡갈비</td>
									<td>1</td>
									<td>13,000원</td>
								</tr>
							</tbody>
						</table>
						<form method="post" role="form" class="mx-4">
							<h1 class="h2 mt-5">배송 정보</h1>
							<fieldset class="row mb-3">
								<legend class="col-form-label col-sm-3 pt-0">배송지 선택</legend>
								<div class="col-sm-9">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios1" value="option1" checked>
										<label class="form-check-label" for="gridRadios1">
											기존배송지
										</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="gridRadios" id="gridRadios2" value="option2">
										<label class="form-check-label" for="gridRadios2">
											신규배송지
										</label>
									</div>
								</div>
							</fieldset>
							<div class="row">
								<div class="form-group col-md-6 mb-3">
									<label for="inputname">수령인</label>
									<input type="text" class="form-control mt-1" id="name" name="name" placeholder="Name">
								</div>
								<div class="form-group col-md-6 mb-3">
									<label for="inputname">연락처</label>
									<div class="input-group">
										<input type="text" class="form-control mt-1" id="tel1" name="tel1" maxlength="3" placeholder="010">
										<input type="email" class="form-control mt-1" id="tel2" name="tel2" maxlength="4" placeholder="1234">
										<input type="email" class="form-control mt-1" id="tel3" name="tel3" maxlength="4" placeholder="5678">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6 mb-3">
									<label for="inputname">배송지 주소</label>
									<div class="input-group">
										<input type="text" class="form-control mt-1" placeholder="">
										<button class="btn btn-success mt-1" type="button" id="button-addon2">우편번호</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6 mb-3">
									<!-- <label for="inputname">배송지</label> -->
									<input type="text" class="form-control mt-1" id="name" name="name" placeholder="배송지">
								</div>
								<div class="form-group col-md-6 mb-3">
									<!-- <label for="inputemail">상세주소</label> -->
									<input type="email" class="form-control mt-1" id="email" name="email" placeholder="상세주소">
								</div>
							</div>
							<div class="mb-3">
								<label for="inputmessage">배송메모</label>
								<textarea class="form-control mt-1" id="message" name="message" placeholder="Message" rows="4"></textarea>
							</div>
							<h1 class="h2 mt-5">쿠폰/포인트</h1>
							<div class="row">
								<div class="form-group col-md-6 mb-3">
									<label for="inputname">쿠폰</label>
									<div class="input-group">
										<input type="text" class="form-control mt-1" placeholder="">
										<button class="btn btn-success mt-1" type="button" id="button-addon2">쿠폰사용</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="form-group col-md-6 mb-3">
									<label for="inputname">포인트</label>
									<div class="input-group">
										<input type="text" class="form-control mt-1" placeholder="">
										<button class="btn btn-success mt-1" type="button" id="button-addon2">전액사용</button>
									</div>
								</div>
							</div>
							<h1 class="h2 mt-5">결제상세</h1>
							<div class="row">
								<div class="col-md-6 mb-3">
									<table class="table">
										<tbody>
											<tr>
												<td>상품금액</td>
												<td class="text-end">10000 원</td>
											</tr>
											<tr>
												<td>배송비</td>
												<td class="text-end">+3000 원</td>
											</tr>
											<tr>
												<td>쿠폰할인</td>
												<td class="text-end">-1000 원</td>
											</tr>
											<tr>
												<td>포인트사용</td>
												<td class="text-end">-1000 원</td>
											</tr>
										</tbody>
										<tfoot>
											<tr>
												<td>결제금액</td>
												<td class="text-end">11000 원</td>
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