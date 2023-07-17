<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>selectAll TEST</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<script>
	$(document).on('click', '#btnSearch', function(e) {
		e.preventDefault();
		var url = "${pageContext.request.contextPath}/m_selectAll.do";
		url = url + "?searchKey=" + $('#searchKey').val();
		url = url + "&searchWord=" + $('#searchWord').val();
		location.href = encodeURI(url);
		console.log(url);

	});

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize, searchKey, searchWord) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/m_selectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKey=" + $('#searchKey').val();
		url = url + "&searchWord=" + searchWord;
		location.href = encodeURI(url);
	}

	//페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, searchKey, searchWord) {
		var url = "${pageContext.request.contextPath}/m_selectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKey=" + searchKey;
		url = url + "&searchWord=" + searchWord;
		location.href = encodeURI(url);

	}

	// 	//다음 버튼 이벤트

	function fn_next(page, range, rangeSize, searchKey, searchWord) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/m_selectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKey=" + $('#searchKey').val();
		url = url + "&searchWord=" + searchWord;
		location.href = encodeURI(url);
	}
</script>
</head>
<body>
	<h1>회원목록</h1>

	<!-- search{s} -->

	<div class="form-group row justify-content-center">
		<div class="col-sm-3" style="padding-right: 10px">
			<select class="form-control form-control-sm" name="searchKey"
				id="searchKey">
				<option value="name">name</option>
				<option value="email">email</option>
				<option value="address1">address1</option>
			</select>
		</div>
		<div class="col-sm-6" style="padding-right: 10px">
			<input type="text" class="form-control form-control-sm"
				name="searchWord" id="searchWord">
		</div>
		<div class="col-sm-3">
			<button class="btn btn-sm btn-primary" name="btnSearch"
				id="btnSearch">검색</button>
		</div>
	</div>

	<!-- search{e} -->


	<table>
		<thead>
			<tr>
				<th>num</th>
				<th>id</th>
				<th>pw</th>
				<th>name</th>
				<th>tel</th>
				<th>email</th>
				<th>zipcode</th>
				<th>address1</th>
				<th>address2</th>
				<th>regdate</th>
				<th>profile</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td><a href="m_selectOne.do?num=${vo.num}">${vo.num}</a></td>
					<td>${vo.member_id}</td>
					<td>${vo.member_pw}</td>
					<td>${vo.member_name}</td>
					<td>${vo.member_tel}</td>
					<td>${vo.member_email}</td>
					<td>${vo.member_zipcode}</td>
					<td>${vo.member_address1}</td>
					<td>${vo.member_address2}</td>
					<td>${vo.member_regdate}</td>
					<td><img width="35px"
						src="resources/uploadimg/thumb_${vo.member_profile}"></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

	<!-- pagination{s} -->

	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchKey}', '${pagination.searchWord}' )">Previous</a></li>
			</c:if>
			<c:forEach begin="${pagination.startPage}"
				end="${pagination.endPage}" var="idx">
				<li
					class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a
					class="page-link" href="#"
					onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchKey }', '${pagination.searchWord}')">
						${idx} </a></li>
			</c:forEach>
			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#"
					onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}', '${pagination.searchKey }', '${pagination.searchWord}')">Next</a></li>
			</c:if>
		</ul>

	</div>

	<!-- pagination{e} -->







	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>