<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="container tab-content">
	<h3>주문목록</h3>
	<form action="${isAdmin ? 'o_adminOrders.do' : 'o_mypageOrders.do'}" method="get">
		<div class="row">
			<c:if test="${isAdmin}">
				<div class="col-lg-3 form-group mb-2">
					<label for="inputname">주문상태</label>
					<select class="form-select" name="status">
						<option value="전체" ${search.status eq '전체' ? 'selected' :''}>전체</option>
						<option value="배송준비중" ${search.status eq '배송준비중' ? 'selected' :''}>배송준비중</option>
						<option value="발송처리" ${search.status eq '발송처리' ? 'selected' :''}>발송처리</option>
						<option value="배송완료" ${search.status eq '배송완료' ? 'selected' :''}>배송완료</option>
						<option value="취소" ${search.status eq '취소' ? 'selected' :''}>취소</option>
						<option value="판매취소" ${search.status eq '판매취소' ? 'selected' :''}>판매취소</option>
						<option value="반품요청" ${search.status eq '반품요청' ? 'selected' :''}>반품요청</option>
						<option value="반품처리" ${search.status eq '반품처리' ? 'selected' :''}>반품처리</option>
						<option value="반품요청" ${search.status eq '반품요청' ? 'selected' :''}>반품요청</option>
						<option value="교환처리" ${search.status eq '교환처리' ? 'selected' :''}>교환처리</option>
					</select>
				</div>
			</c:if>
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
		</div>
	</form>

	<table class="table">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문일자</th>
				<c:if test="${isAdmin}">
					<th>주문자</th>
				</c:if>
				<th>상품정보</th>
				<th>총결제금액</th>
				<th>주문상태</th>
			</tr>
		</thead>
		<tbody id="vos">
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td><a href="o_mypageOrder.do?num=${vo.num}">${vo.num}</a></td>
					<td>${vo.order_date}</td>
					<c:if test="${isAdmin}">
						<td><a href="m_selectOne.do?num=${vo.member_num}">${vo.member_name}(${vo.member_id})</a></td>
					</c:if>
					<td>${vo.product_name} 포함 총 ${vo.count}건</td>
					<td>${vo.total_price}</td>
					<td>${vo.status}</td>
				</tr>
			</c:forEach>
			<c:if test="${empty vos}">
				<tr>
					<td colspan="6" class="text-center">상품주문내역이 없습니다.</td>
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