<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function setAmount() {
		var amountInput = document.getElementById("amountInput");
		var selectedAmount = document.querySelector("select[name='amount']").value;
		amountInput.value = selectedAmount;
	}
</script>

<!-- Start Item Details -->
<section class="item-details section p-3">
	<input value="${vo2.num}" type="text" name="num" hidden="true" />
	<input value="${vo2.product_price}" type="text"	name="product_price" hidden="true" />
	<div class="container col-7">
		<div class="top-area row">
			<div class="row align-items-end">
				<div class="col-lg-6 col-md-12 col-12">
					<div class="product-images">
						<main id="gallery">
							<div class="main-img">
								<img
				src="${pageContext.request.contextPath}/resources/uploadimg/product/${vo2.product_img}" class="img-fluid">
							</div>
							
						</main>
					</div>
				</div>
<div class="col-lg-6 col-md-12 col-12">
	<div class="product-info mt-5">
		<h2 class="title mb-3">${vo2.product_name}</h2>
		<p class="mb-5">${vo2.product_content}</p>
		<h3 class="price mb-3"><fmt:formatNumber value="${vo2.product_price}" pattern="#,###"/>원</h3>
		<hr>
		<div class="row justify-content-between align-items-center mt-4 mb-4">
			<div class="col-6">
				상품 수량
			</div>
			<div class="col-6">
				<select name="amount">
					<c:forEach begin="1" end="10" var="i">
						<option value="${i}">${i}</option>
					</c:forEach>
				</select>&nbsp;개 
			</div>
		</div>
	</div>
	<div class="product-info">
		<div class="bottom-content">
			<div class="row">
				<div class="col-lg-12 col-md-4 col-12">
					<div>
						<form action="c_insertOK.do" method="post">
							<input type="hidden" name="product_num" value="${vo2.num}"> 
							<input type="hidden" name="member_id" value="${user_id}"> 
							<input type="hidden" name="amount" value="" id="amountInput"> 
							<button class="btn btn-outline-primary" style="height: 50px; width: 100%;" name="add_cart" type="submit" onclick="setAmount()">장바구니 추가</button>
						</form>
					</div>
				</div>								
			</div>
		</div>
	</div>
</div>
			</div>
		</div>
		<hr>
		<div class="mt-5">
			
		</div>
			</div>
</section>
<!-- End Item Details -->

 <!-- Begin Page Content -->
    <div class="container">
        <!-- DataTales Example -->
        <div class="card mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">리뷰</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>리뷰번호</th>
                                <th>아이디</th>
                                <th>등록일</th>                                          
                                <th>리뷰내용</th>
                            </tr>
                        </thead>
                        <tbody>
							<c:forEach var="vo" items="${rvos}">
									<tr>
										<td>${vo.num}</td>
										<td>${vo.member_id}</td>
										<td>${vo.wdate}</td>
										<td>${vo.review_content}</td>
									</tr>
							</c:forEach>           
                        </tbody>
                        
                    </table>
                    
                </div>
                
            </div>
    </div>
</div>
            
<script type="text/javascript" src="js/productdetails.js"></script>