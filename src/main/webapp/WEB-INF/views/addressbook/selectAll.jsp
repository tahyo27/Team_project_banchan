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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script type="text/javascript">
	$(document).ready(function() {
		$('#showFormButton').click(function() {
			$('#myForm').show();
		});
	});

	function daum_address_find() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					//주소문자열과 참고항목 합치기 참고항목 안씀
					addr += extraAddr;

				} else {
					addr += ' ';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$("#ab_zipcode").val(data.zonecode);
				$("#ab_address1").val(addr);
				// 커서를 상세주소 필드로 이동한다.
				$("#ab_address2").attr("readonly", false); //읽기전용 취소
				$("#ab_address2").focus();
			}
		}).open();
	};

	function hide_form() {
		$('#myForm').hide();
	};

	function baseUpdate(num) {

		$.ajax({
			url : 'ab_updateOK.do',
			data : {
				num : num
			},
			method : 'POST',
			success : function(response) {
				console.log('Update successful');
				alert("기본배송지로 설정되었습니다.")
				location.reload(); // 페이지 새로고침		
			},
			error : function(xhr, status, error) {
				console.error('Update failed:', error);
			}
		});
	};
	
	function baseDelete(num) {

		$.ajax({
			url : 'ab_deleteOK.do',
			data : {
				num : num
			},
			method : 'POST',
			success : function(response) {
				console.log('Delete successful');
				alert("배송지를 삭제하였습니다.")
				location.reload(); // 페이지 새로고침		
			},
			error : function(xhr, status, error) {
				console.error('Delete failed:', error);
			}
		});
	};
</script>
<style>
/* 추가적인 CSS 스타일링을 위한 스타일 시트 */
.tab-content {
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.custom-btn {
	font-size: 4px;
	font-family: 'Roboto', sans-serif;
	font-weight: 600;
}

.table {
	margin-top: 20px;
}

.table th {
	text-align: center;
	font-family: 'Roboto', sans-serif;
	font-weight: 600;
	font-size: 15px;
}

.table td {
	vertical-align: middle;
	font-family: 'Roboto', sans-serif;
	font-weight: 400;
	font-size: 12px;
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
	<!-- Start Top Nav -->
	<nav
		class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block"
		id="templatemo_nav_top">
		<div class="container text-light">
			<div class="w-100 d-flex justify-content-between">
				<div>
					<i class="fa fa-envelope mx-2"></i> <a
						class="navbar-sm-brand text-light text-decoration-none"
						href="mailto:info@company.com">BANCHAN@company.com</a> <i
						class="fa fa-phone mx-2"></i> <a
						class="navbar-sm-brand text-light text-decoration-none"
						href="tel:010-020-0340">010-1111-2222</a>
				</div>
				<div>
					<a class="text-light" href="m_insert.do">회원가입</a> <a
						class="text-light" href="adminpage.do">관리자페이지</a>
				</div>
			</div>
		</div>
	</nav>
	<!-- Close Top Nav -->

	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light shadow">
		<div
			class="container d-flex justify-content-between align-items-center">

			<a
				class="navbar-brand text-success logo h1 align-self-center roboto_font"
				style="font-size: 40px;" href=".home"> BANCHAN </a>

			<button class="navbar-toggler border-0" type="button"
				data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div
				class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
				id="templatemo_main_nav">
				<div class="flex-fill">

					<form class="d-flex justify-content-center align-items-center"
						action="pr_searchList.do">
						<select name="searchKey" id="searchKey_header"
							style="margin-right: 10px;">
							<option value="name">상품명</option>
						</select> <input class="form-control me-2 search-input" type="search"
							placeholder="상품 검색" name="searchWord" id="searchWord">
						<button class="btn btn-outline-success" type="submit">
							<i class="fas fa-search">검색</i>
						</button>
					</form>
				</div>

				<div class="navbar align-self-center d-flex">
					<a class="nav-icon position-relative text-decoration-none"
						href="c_selectAll.do?member_id=${user_id}"> <i
						class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i> <span
						class="ml-1 ">장바구니</span>
					</a> <a class="nav-icon position-relative text-decoration-none"
						style="margin-left: 10px;" href="SNS_Login.do"> <i
						class="fa fa-fw fa-user text-dark"></i><span class="ml-1 ">마이페이지</span>
					</a> </a> <a class="nav-icon position-relative text-decoration-none"
						style="margin-left: 10px;" href="logout.do"><i class="fas fa-sign-out-alt"></i><span class="ml-1 ">로그아웃</span> </a>
				</div>
			</div>

		</div>
	</nav>
	<!-- Close Header -->
	
	<div class="container">
		<div class="row mt-5">
			<div class="col-md-3">
				<ul class="nav flex-column nav-pills">
					<li class="nav-item"><a class="nav-link" data-toggle="pill"
						href="m_user_udpate.do">회원정보</a></li>
					<li class="nav-item"><a class="nav-link active"
						data-toggle="pill" href="ab_selectAll.do?member_num=2">배송주소록</a></li>
				</ul>
			</div>

			<div class="col-md-9">
				<div class="tab-content">
					<div id="user-info" class="tab-pane fade show active">
						<h3>배송주소록</h3>
						<button id="showFormButton" class="btn btn-primary">+ 새
							배송지 등록</button>
						<form action="ab_insertOK.do" method="post" id="myForm"
							style="display: none;">
							<table class="table">
								<tr>
									<td><label for="ab_name">수취인</label></td>
									<td><input type="text" id="ab_name" name="ab_name"
										class="form-control"></td>
								</tr>
								<tr>
									<td><label for="ab_zipcode">우편번호</label></td>
									<td>
										<div class="input-group">
											<input id="ab_zipcode" name="ab_zipcode" class="form-control"
												readonly="readonly">
											<div class="input-group-append">
												<button type="button" class="btn btn-secondary"
													onclick="daum_address_find()">우편번호찾기</button>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td><label for="ab_address1">주소</label></td>
									<td><input id="ab_address1" name="ab_address1"
										class="form-control" readonly="readonly"></td>
								</tr>
								<tr>
									<td><label for="ab_address2">상세주소</label></td>
									<td><input id="ab_address2" name="ab_address2"
										class="form-control" readonly="readonly"></td>
								</tr>
								<tr>
									<td><label for="ab_tel">전화번호</label></td>
									<td><input id="ab_tel" name="ab_tel" class="form-control"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit"
										class="btn btn-primary" value="등록">
										<button type="button" class="btn btn-secondary"
											onclick="hide_form()">취소</button></td>
								</tr>
								<tr>
									<input type="hidden" id="member_num" name="member_num"
										value="${param.member_num}">
								</tr>
							</table>
						</form>

						<table class="table">
							<thead>
								<tr>
									<th>수취인</th>
									<th>우편번호</th>
									<th>주소</th>
									<th>상세주소</th>
									<th>전화번호</th>
									<th>기본</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="vo" items="${vos}">
									<tr>
										<td>${vo.ab_name}</td>
										<td>${vo.ab_zipcode}</td>
										<td>${vo.ab_address1}</td>
										<td>${vo.ab_address2}</td>
										<td>${vo.ab_tel}</td>
										<td>${vo.ab_base}</td>
										<td><button type="button"
												class="btn btn-sm btn-primary custom-btn"
												onclick="baseUpdate(${vo.num})">
												<span class="small">기본배송지 설정</span>
											</button>
											<button type="button"
												class="btn btn-sm btn-primary custom-btn"
												onclick="baseDelete(${vo.num})" style="margin:2px auto;">
												<span class="small">삭제</span>
											</button></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="8">1 2 3 4 5</td>
								</tr>
							</tfoot>
						</table>



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