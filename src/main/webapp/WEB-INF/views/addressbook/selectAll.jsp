<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AddressBook selectAll TEST</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#showFormButton').click(function() {
			$('#myForm').show();
		});
	});
</script>
</head>
<body>
	<h1>배송주소록</h1>

	<button id="showFormButton">등록하기</button>
	<form id="myForm" style="display: none;">
		<table>
			<tr>
				<td><label for="id">id:</label></td>
				<td><input type="text" id="id" name="member_id" required>
			</tr>
			</table>
	</form>

	<table>
		<thead>
			<tr>
				<th>num</th>
				<th>name</th>
				<th>zipcode</th>
				<th>address1</th>
				<th>address2</th>
				<th>tel</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${vo.num}</a></td>
					<td>${vo.ab_name}</td>
					<td>${vo.ab_zipcode}</td>
					<td>${vo.ab_address1}</td>
					<td>${vo.ab_address2}</td>
					<td>${vo.ab_tel}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">1 2 3 4 5</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>