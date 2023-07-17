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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
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
<style>
.table-custom th {
	font-family: 'Roboto', sans-serif;
	font-weight: 600;
	font-size: 14px;
}

.table-custom td {
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
	font-size: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-3">
				<ul class="nav flex-column nav-pills">
					<li class="nav-item"><a class="nav-link" data-toggle="pill"
						href="adminpage.do">관리자모드</a></li>
					<li class="nav-item"><a class="nav-link active"
						data-toggle="pill" href="m_selectAll.do">회원정보</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="pill"
						href="pr_insert.do">상품등록</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="pill"
						href="productDetail.do">상품수정/삭제</a></li>
				</ul>
			</div>
			<div class="col-md-9">
				<div class="tab-content">
					<div id="user-info" class="tab-pane fade show active">
						<h3>회원정보</h3>
						<!-- search{s} -->

						<div
							class="form-group row justify-content-center align-items-center">
							<div class="col-sm-3" style="padding-right: 10px">
								<select class="form-control form-control-sm" name="searchKey"
									id="searchKey">
									<option value="name">name</option>
									<option value="email">email</option>
									<option value="address1">address1</option>
								</select>
							</div>
							<div class="col-sm-8" style="padding-right: 10px; width:20%;">
								<input type="text" class="form-control form-control-sm"
									name="searchWord" id="searchWord">
							</div>
							<div class="col-sm d-flex align-items-center">
								<button class="btn btn-sm btn-primary" name="btnSearch"
									id="btnSearch">검색</button>
							</div>
						</div>

						<!-- search{e} -->
						<br>
						<!-- table{s} -->
						<link rel="stylesheet" href="styles.css">

						<table class="table table-striped table-bordered table-custom">
							<thead>
								<tr>
									<th>번호</th>
									<th>아이디</th>
									<th>비밀번호</th>
									<th>이름</th>
									<th>전화번호</th>
									<th>이메일</th>
									<th>우편번호</th>
									<th>주소</th>
									<th>상세주소</th>
									<th>등록일</th>
									<th>프로필</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${vos}">
									<tr>
										<td><a href="m_selectOne.do?num=${vo.num}"><span
												style="font-size: 10px;">${vo.num}</span></a></td>
										<td>${vo.member_id}</td>
										<td>${vo.member_pw}</td>
										<td>${vo.member_name}</td>
										<td>${vo.member_tel}</td>
										<td>${vo.member_email}</td>
										<td>${vo.member_zipcode}</td>
										<td>${vo.member_address1}</td>
										<td>${vo.member_address2}</td>
										<td>${vo.member_regdate}</td>
										<td><img width="25px"
											src="resources/uploadimg/thumb_${vo.member_profile}"></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- table{e} -->

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


					</div>
				</div>
			</div>
		</div>
	</div>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>