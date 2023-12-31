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
		location.href = url;
		console.log(url);

	});

	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize, searchKey, searchWord) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/m_selectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKey=" + searchKey;
		url = url + "&searchWord=" + searchWord;
		location.href = url;
	}

	//페이지 번호 클릭

	function fn_pagination(page, range, rangeSize, searchKey, searchWord) {
		var url = "${pageContext.request.contextPath}/m_selectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKey=" + searchKey;
		url = url + "&searchWord=" + searchWord;
		location.href = url;

	}

	// 	//다음 버튼 이벤트

	function fn_next(page, range, rangeSize, searchKey, searchWord) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/m_selectAll.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		url = url + "&searchKey=" + searchKey;
		url = url + "&searchWord=" + searchWord;
		location.href = url;
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
  .btn-text-horizontal span {
    display: flex;
    align-items: center;
    height: 100%;
  }
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-12">
				<div class="tab-content">
					<div id="user-info" class="tab-pane fade show active">
						<div class="row">
							<div class="col-md-10">
								<h2>회원정보</h2>
							</div>
							<div class="col-md-2">
								<a href="adminpage.do" class="btn btn-primary">Admin 페이지로</a>
							</div>
						</div>
						<!-- search{s} -->
						<div
							class="form-group row justify-content-center align-items-center">
							<div class="col-md-3 col-sm-12 mb-2 mb-md-0">
								<select class="form-control form-control-sm" name="searchKey"
									id="searchKey">
									<option value="name">이름</option>
									<option value="email">이메일</option>
									<option value="address1">주소</option>
								</select>
							</div>
							<div class="col-md-4 col-sm-10 d-flex">
								<input type="text"
									class="form-control form-control-sm"
									name="searchWord" id="searchWord"
									value="${pagination.searchWord}">
								<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch"
								style="margin-left:5px;">search</button>
							</div>
						</div>
						<!-- search{e} -->
						<br>
						<!-- table{s} -->
						<div class="table-responsive">
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
						</div>
						<!-- table{e} -->
						<!-- pagination{s} -->
						<div id="paginationBox" class="d-flex justify-content-center">
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