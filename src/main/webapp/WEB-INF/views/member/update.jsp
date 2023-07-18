<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Member Update</title>
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
						<h1>회원수정</h1>

						<form action="m_updateOK.do" method="post"
							enctype="multipart/form-data">
							<table class="table">
								<tr>
									<td><label for="num">번호</label></td>
									<td><span id="span_num">${vo2.num}</span><input
										type="hidden" id="num" name="num" value="${vo2.num}"></td>
								</tr>
								<tr>
									<td><label for="id">아이디</label></td>
									<td><span id="span_id">${vo2.member_id}</span></td>
								</tr>
								<tr>
									<td><label for="pw">비밀번호</label></td>
									<td><input type="password" id="pw" name="member_pw"
										value="${vo2.member_pw}"></td>
								</tr>
								<tr>
									<td><label for="name">이름</label></td>
									<td><input type="text" id="name" name="member_name"
										value="${vo2.member_name}"></td>
								</tr>
								<tr>
									<td><label for="tel">전화번호</label></td>
									<td><input type="text" id="tel" name="member_tel"
										value="${vo2.member_tel}"></td>
								</tr>
								<tr>
									<td><label for="email">이메일</label></td>
									<td><span id="span_email">${vo2.member_email}</span></td>
								</tr>
								<tr>
									<td><label for="file">프로필 사진</label></td>
									<td><input type="file" id="file" name="file"> <input
										type="hidden" id="profile" name="member_profile"
										value="${vo2.member_profile}"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" value="회원수정완료"></td>
								</tr>
								<input type="hidden" name="check" value="admin_update">
							</table>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>