<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="container tab-content">
	<h3>주문목록</h3>
	<div class="row">
		<form action="o_mypageOrders.do" method="get">
			<div class="col-lg-6 form-group mb-2">
				<label for="inputname">조회기간</label>
				<div class="input-group">
					<input type="date" class="form-control" name="start_date" value="${search.start_date}">
					<input type="date" class="form-control" name="end_date" value="${search.end_date}">
					<button type="submit" class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</div>
		</form>
	</div>

	<table class="table">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문일자</th>
				<th>상품정보</th>
				<th>총결제금액</th>
				<th>주문상태</th>
			</tr>
		</thead>
		<tbody id="vos">
			<c:forEach var="vo" items="${vos}">
				<tr onclick="location.href='selectOne.do?num=${vo.num}'">
					<td>${vo.num}</td>
					<td>${vo.order_date}</td>
					<td>${vo.product_name} 포함 총 ${vo.count}건</td>
					<td>${vo.total_price}</td>
					<td>${vo.status}</td>
				</tr>
			</c:forEach>
			<c:if test="${empty vos}">
				<tr>
					<td colspan="5" class="text-center">상품주문내역이 없습니다.</td>
				</tr>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6">1 2 3 4 5</td>
			</tr>
		</tfoot>
	</table>
</section>