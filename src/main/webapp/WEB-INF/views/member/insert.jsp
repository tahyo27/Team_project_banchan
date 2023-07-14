<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert page</title>

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
	$(function() {
		console.log("onload....");
		$('.myButton').prop('disabled', true); //submit 비활성화
	});

	function idCheck() {
		console.log("idCheck....", $('#id').val());

		$.ajax({
			url : "json_m_idCheck.do",
			data : {
				member_id : $('#id').val()
			},
			method : 'GET',
			dataType : 'json',
			success : function(obj) {
				console.log('ajax...success:', obj);
				console.log('ajax...success:', obj.result);
				let msg = '';
				if (obj.result === 'OK') {
					msg = '사용가능한 아이디입니다.';
				} else {
					msg = '사용중인 아이디입니다.';
				}
				alert(msg);
			},
			error : function(xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		});//end $.ajax()...

	}//end idCheck()...

	function mailCheck() {
		const email = $('#userEmail').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 

		$.ajax({
			url : "mailCheck.do?email=" + email,
			method : 'GET',
			dataType : 'json',
			success : function(data) {
				console.log("data : " + data);
				checkInput.attr('disabled', false); //인증번호 입력칸 활성화
				code = data;
				alert('인증번호가 전송되었습니다.')
			}
		}); // end ajax
	}; // end send email

	//인증번호 비교
	function numberCheck() {
		console.log("code : " + code);
		const inputCode = parseInt($('.mail-check-input').val(), 10);
		const $resultMsg = $('#mail-check-warn');
		console.log("inputCode : " + inputCode);

		if (inputCode === code) {
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color', 'green');
			$('#mail-Check-Btn').attr('disabled', true);
			$('#userEmail').prop('readonly', true);
			$('.myButton').prop('disabled', false);// 인증완료시 submit 활성화
		} else {
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color', 'red');
		}
	};

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
	
	function showForm() {
		var form = document.getElementById("myForm");
		form.style.display = "block"; // 폼 보이기
	};
</script>
<style>
/* 추가적인 CSS 스타일링을 위한 스타일 시트 */
body {
	background-color: #f8f9fa; /* 배경 회색 */
}

.logo-block {
	background-color: #ffffff; /* 로고 블록 흰색 배경 */
	width: 100%;
	padding: 20px;
}

.login-block {
	background-color: #ffffff; /* 로그인 블록 흰색 배경 */
	max-width: 400px;
	margin: 0 auto;
	padding: 20px;
	margin-top: 50px;
	box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

.login-form {
	max-width: 550px;
	margin: 70px auto;
	padding: 30px;
	background-color: #ffffff;
	box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
	text-align: center;
}

form {
	font-size: 14px;
}

.btn-primary {
	background-color: #337ab7; /* 어두운 회색 배경색상 */
	border-color: #337ab7; /* 어두운 회색 테두리 색상 */
	color: #ffffff; /* 흰색 텍스트 색상 */
}

.hidden-form {
	display: none; /* 폼 숨김 */
}

.top-font {
	font-family: 'Roboto', sans-serif;
	font-weight: 600;
	color: rgb(89, 171, 110);
	font-size:30px;
	text-decoration: none;
}
.roboto_font {
	font-family: 'Roboto', sans-serif;
	font-weight: 500;
}

</style>
</head>
<body>
	<div class="logo-block">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<a href="home" class="top-font">BANCHAN</a>
				</div>
			</div>
		</div>
	</div>



	<div class="login-form">
		<ul class="nav nav-tabs justify-content-center">
			<li class="nav-item"><a class="nav-link active" href="m_insert.do">회원가입</a></li>
			<li class="nav-item"><a class="nav-link" href="SNS_Login.do">로그인</a></li>
		</ul>
		<br>
		
		<br>
		<div>
			<div id="naver_id_login" style="text-align: center">
				<a href="${naver_url}"><img width="220" height="55" 
					src="${pageContext.request.contextPath}/resources/SNSimg/btnG_완성형.png" /></a>
			</div>
			<div id="kakao_id_login" style="text-align: center">
				<a href="${kakao_url}"><img width="220" height="55" style="margin-top:15px;"
					src="${pageContext.request.contextPath}/resources/SNSimg/kakao_login_large_narrow.png" /></a>
			</div>
			<div id="google_id_login" style="text-align: center">
				<a href="${google_url}"><img width="220" height="55" style="margin-top:15px;"
					src="${pageContext.request.contextPath}/resources/SNSimg/btn_google_signin_dark_normal.png" /></a>
			</div>
		</div>
		<br>
		<hr>
		
		<!-- 	폼보여주는 버튼 -->
		<div class="row mb-3">
			<div class="col-sm-12 text-center">
				<button type="button" onclick="showForm()" class="btn btn-primary roboto_font" style="width:220px; height:50px; font-weight: bold;">이메일 회원가입</button>
			</div>
		</div>
		<div class="row mb-3 hidden-form" id="myForm">
			<form action="m_insertOK.do" method="post"
				enctype="multipart/form-data" class="input_form">

				<div class="row mb-3">
					<label for="id" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-10">
						<div class="input-group">
							<input type="text" class="form-control" id="id" name="member_id"
								required>
							<button type="button" onclick="idCheck()"
								class="btn btn-primary idCheckButton">중복체크</button>
						</div>
					</div>
				</div>

				<div class="row mb-3">
					<label for="pw" class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="pw"
							name="member_pw">
					</div>
				</div>

				<div class="row mb-3">
					<label for="name" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name"
							name="member_name">
					</div>
				</div>

				<div class="row mb-3">
					<label for="email" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-10">
						<div class="input-group">
							<input type="email" class="form-control" id="userEmail"
								name="member_email" placeholder="이메일을 입력하세요" required>
							<button type="button" class="btn btn-primary" id="mail-Check-Btn"
								onclick="mailCheck()">이메일 인증</button>
						</div>
					</div>
				</div>

				<div class="row mb-3">
					<label for="member_zipcode" class="col-sm-2 col-form-label">우편번호</label>
					<div class="col-sm-10">
						<div class="input-group">
							<input id="member_zipcode" name="member_zipcode"
								class="form-control" readonly>
							<button type="button" onclick="daum_address_find()"
								class="btn btn-primary">우편번호찾기</button>
						</div>
					</div>
				</div>

				<div class="row mb-3">
					<label for="member_address1" class="col-sm-2 col-form-label">주소</label>
					<div class="col-sm-10">
						<input id="member_address1" name="member_address1"
							class="form-control" readonly>
					</div>
				</div>

				<div class="row mb-3">
					<label for="member_address2" class="col-sm-2 col-form-label">상세주소</label>
					<div class="col-sm-10">
						<input id="member_address2" name="member_address2"
							class="form-control" readonly>
					</div>
				</div>

				<div class="row mb-3">
					<label for="tel" class="col-sm-2 col-form-label">전화번호</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="tel" name="member_tel"
							value="">
					</div>
				</div>

				<div class="row mb-3">
					<label for="file" class="col-sm-2 col-form-label">프로필</label>
					<div class="col-sm-10">
						<input type="file" class="form-control" id="file" name="file"
							value="">
					</div>
				</div>

				<div class="text-center">
					<button type="submit" class="btn btn-primary" style="width: 60%;">제출</button>
				</div>

			</form>
		</div>
	</div>
	
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>