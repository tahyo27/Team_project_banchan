<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member selectOne</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<style>
.table-custom th {
	font-family: 'Roboto', sans-serif;
	font-weight: 600;
	font-size: 16px;
}

.table-custom td {
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
	font-size: 14px;
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
						<h1>회원정보</h1>

						<br>
						<table class="table table-custom">
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
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${vo2.num}</td>
									<td>${vo2.member_id}</td>
									<td>${vo2.member_pw}</td>
									<td>${vo2.member_name}</td>
									<td>${vo2.member_tel}</td>
									<td>${vo2.member_email}</td>
									<td>${vo2.member_zipcode}</td>
									<td>${vo2.member_address1}</td>
									<td>${vo2.member_address2}</td>
									<td>${vo2.member_regdate}</td>
								</tr>
								<tr>
									<td colspan="10" class="text-center"><img width="300px"
										src="resources/uploadimg/${vo2.member_profile}"></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="10" class="text-right"><a
										href="m_update.do?num=${param.num}" class="btn btn-primary">회원수정</a>
										<a href="m_deleteOK.do?num=${param.num}"
										class="btn btn-danger">회원삭제</a></td>
								</tr>
							</tfoot>
						</table>


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>