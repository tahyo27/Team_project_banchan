<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원정보</title>
</head>

<style>
/* 추가적인 CSS 스타일링을 위한 스타일 시트 */
.tab-content {
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.custom-btn {
	width: 70%;
}

.roboto_font {
	font-family: 'Roboto', sans-serif;
	font-weight: 500;
}

.search-input {
	width: 400px; /* 상품검색창 가로길이 조정 */
}

.navbar a {
	color: black; /* 링크의 텍스트 색상을 원하는 색상으로 지정 */
}
</style>

</head>
<body>


	<h3>상품수정</h3>
	<div class="container">
		<div id="user-info" class="tab-pane fade show active">
			<div style="display: flex; justify-content: center;">
				<section class="bg-white">
					<div class="container py-5">
						<div class="row text-center py-3">
							<div class="row">
								<div class="col md-4 col-md-offset-6">

									<form action="pr_updateOK.do" method="post"
										enctype="multipart/form-data">
										<table class="table table-bordered" style="width: 600px;">
											<tr>
												<td style="width: 150px;">카테고리</td>
												<td class="text-center"><select style="width: 200px;"
													name="category_num" class="form-control"
													required="required">
														<option value="1" selected="selected">조림·나물·무침</option>
														<option value="2">고기반찬</option>
														<option value="3">찜·탕·찌개</option>
														<option value="4">김치</option>
												</select></td>
											</tr>
											<tr>
												<td style="width: 150px;">상품번호</td>
												<td><input type="text" name="num" class="form-control"
													style="width: 200px;" required="required"
													value="${vo2.num}" readonly></td>
											</tr>
											<tr>
												<td style="width: 150px;">반찬이름</td>
												<td><input type="text" name="product_name"
													class="form-control" style="width: 200px;"
													required="required" value="${vo2.product_name}" readonly></td>
											</tr>

											<tr>
												<td style="width: 150px;">상품이미지</td>
												<td><input type="file" name="file" class="form-control"
													style="width: 300px;" required="required"
													value="${vo2.product_img}"></td>
											</tr>

											<tr>
												<td style="width: 150px;">반찬가격</td>
												<td><input type="text" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" name="product_price"
													class="form-control" style="width: 200px;"
													required="required" value="${vo2.product_price}"></td>
											</tr>

											<tr>
												<td style="width: 150px;">반찬설명</td>
												<td><textarea rows="10" cols="20"
														name="product_content" class="form-control"
														style="width: 200px;" required="required">${vo2.product_content}</textarea></td>
											</tr>


											<tr>
												<td colspan="2" align="center">
													<button type="submit"
														class="btn btn-outline-secondary me-md-2">➕ 수정완료</button>
												</td>
											</tr>
										</table>
									</form>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>