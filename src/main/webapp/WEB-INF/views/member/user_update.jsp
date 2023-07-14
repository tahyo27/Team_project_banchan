<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원정보</title>
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
</head>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url : "m_json_selectOne.do",
			data:{num:${user_num}},
			method:'GET',//default get
// 			method:'POST',
			dataType:'json', //xml,text
			success : function(vo2) {
				console.log('ajax...success:', vo2);//{}
				$('#span_id').text(vo2.member_id);
				$('#span_email').text(vo2.member_email);
				$('#member_zipcode').val(vo2.member_zipcode);
				$('#member_address1').val(vo2.member_address1);
				$('#member_address2').val(vo2.member_address2);
				$('#input_num').val(vo2.num);
				$('#input_id').val(vo2.member_id);
				$('#input_email').val(vo2.member_email);
				$('#pw').val(vo2.member_pw);
				$('#name').val(vo2.member_name);
				$('#tel').val(vo2.member_tel);
			},
			error:function(xhr,status,error){
				console.log('xhr.status:', xhr.status);
			}
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
				$("#member_zipcode").val(data.zonecode);
				$("#member_address1").val(addr);
				// 커서를 상세주소 필드로 이동한다.
				$("#member_address2").attr("readonly", false); //읽기전용 취소
				$("#member_address2").focus();
			}
		}).open();
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
					<li class="nav-item"><a class="nav-link active"
						data-toggle="pill" href="m_user_udpate.do">회원정보</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="pill"
						href="ab_selectAll.do?member_num=2">배송주소록</a></li>
				</ul>
			</div>

			<div class="col-md-9">
				<div class="tab-content">
					<div id="user-info" class="tab-pane fade show active">
						<h3>회원정보</h3>
						<form action="m_updateOK.do" method="post"
							enctype="multipart/form-data">
							<input type="hidden" id="input_num" name="num"> <input
								type="hidden" id="input_email" name="member_email"> <input
								type="hidden" id="input_id" name="member_id">
							<div class="form-group row">
								<label for="id" class="col-sm-3 col-form-label">아이디</label>
								<div class="col-sm-9">
									<span id="span_id"></span>
								</div>
							</div>
							<div class="form-group row">
								<label for="pw" class="col-sm-3 col-form-label">비밀번호</label>
								<div class="col-sm-9">
									<input type="password" id="pw" name="member_pw"
										class="form-control">
								</div>
							</div>
							<div class="form-group row" style="margin-top: 7px;">
								<label for="name" class="col-sm-3 col-form-label">이름</label>
								<div class="col-sm-9">
									<input type="text" id="name" name="member_name"
										class="form-control">
								</div>
							</div>
							<div class="form-group row" style="margin-top: 7px;">
								<label for="email" class="col-sm-3 col-form-label">이메일</label>
								<div class="col-sm-9">
									<span id="span_email"></span>
								</div>
							</div>
							<div class="form-group row">
								<label for="member_zipcode" class="col-sm-3 col-form-label">우편번호</label>
								<div class="col-sm-6">
									<input id="member_zipcode" name="member_zipcode" readonly
										class="form-control">
								</div>
								<div class="col-sm-3">
									<button type="button" onclick="daum_address_find()"
										class="btn btn-secondary">우편번호 찾기</button>
								</div>
							</div>
							<div class="form-group row" style="margin-top: 7px;">
								<label for="member_address1" class="col-sm-3 col-form-label">주소</label>
								<div class="col-sm-9">
									<input id="member_address1" name="member_address1" readonly
										class="form-control">
								</div>
							</div>
							<div class="form-group row" style="margin-top: 7px;">
								<label for="member_address2" class="col-sm-3 col-form-label">상세주소</label>
								<div class="col-sm-9">
									<input id="member_address2" name="member_address2" readonly
										class="form-control">
								</div>
							</div>
							<div class="form-group row" style="margin-top: 7px;">
								<label for="tel" class="col-sm-3 col-form-label">전화번호</label>
								<div class="col-sm-9">
									<input type="text" id="tel" name="member_tel"
										class="form-control">
								</div>
							</div>
							<div class="form-group row" style="margin-top: 10px;">
								<label for="file" class="col-sm-3 col-form-label">프로필 사진</label>
								<div class="col-sm-9">
									<input type="file" id="file" name="file"
										class="form-control-file">
								</div>
							</div>
							<div class="form-group row" style="margin-top: 20px;">
								<div class="offset-sm-3 col-sm-9">
									<input type="submit" value="수정"
										class="btn btn-primary custom-btn">
								</div>
							</div>
						</form>
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