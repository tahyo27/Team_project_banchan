<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>배송주소록 테스트</title>
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
			data : {num: num},
			method : 'POST',
			success : function(response) {
				console.log('Update successful');
				location.reload(); // 페이지 새로고침
			},
			error : function(xhr, status, error) {
				console.error('Update failed:', error);
			}
		});
	};
</script>

<style>

</style>

</head>
<body>

	<div class="container">
		<div class="row mt-5">
			<div class="col-md-3">
				<ul class="nav flex-column nav-pills">
					<li class="nav-item"><a class="nav-link"
						data-toggle="pill" href="#user-info">회원정보</a></li>
					<li class="nav-item"><a class="nav-link active" data-toggle="pill"
						href="#address-book">배송주소록</a></li>
				</ul>
			</div>

			<div class="col-md-9">
				<div class="tab-content">
					<div id="user-info" class="tab-pane fade show active">
						<h3>배송주소록</h3>
						<div class="container">
							<div class="row">
								<div class="col-md-12">
									<button id="showFormButton" class="btn btn-primary">+
										새 배송지 등록</button>
								</div>
							</div>
						</div>
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