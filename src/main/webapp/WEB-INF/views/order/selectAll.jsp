<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="container">
	<h1>주문목록</h1>
	<div>
		<form action="pr_searchList.do">
			<select name="searchKey" id="searchKey">
				<option value="name">상품명</option>
			</select>
			<input type="text" name="searchWord" id="searchWord" value="">
			<input type="submit" value="검색">
		</form>
	</div>

	<table class="table">
		<thead>
			<tr>
				<th>주문번호</th>
				<th>주문상태</th>
				<th>주문일자</th>
				<th>총상품금액</th>
				<th>배송비</th>
				<th>총주문금액</th>
			</tr>
		</thead>
		<tbody id="vos">
			<c:forEach var="vo" items="${vos}">
				<tr onclick="location.href='selectOne.do?num=${vo.num}'">
					<td>${vo.num}</td>
					<td>${vo.order_status}</td>
					<td>${vo.order_date}</td>
					<td>${vo.order_amount}</td>
					<td>${vo.order_del}</td>
					<td>${vo.order_total}</td>
				</tr>
			</c:forEach>

		</tbody>
		<tfoot>
			<tr>
				<td colspan="6">1 2 3 4 5</td>
			</tr>
		</tfoot>
	</table>
</section>