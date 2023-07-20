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
	<script src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>
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
	var userNum;
	$(function () {
		$.ajax({
			url: "m_json_selectOne.do",
			data: { num: ${ user_num } },
			method: 'GET',//default get
			dataType: 'json', //xml,text
			success: function (vo2) {
				userNum = vo2.num;
				console.log('userNum:', userNum);
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
				$('#member_profile').val(vo2.member_profile);
				
				// 이미지 URL 처리
			    var imageUrl = "resources/uploadimg/" + vo2.member_profile;
			    console.log('ajax...imageUrl:'+ imageUrl);//{}
			    // 이미지 요소에 URL 설정
			    $('#profile_img').attr('src', imageUrl);
				
			},
			error: function (xhr, status, error) {
				console.log('xhr.status:', xhr.status);
			}
		});
		
	});
	

	function setAddress(address) {
		// 우편번호와 주소 정보를 해당 필드에 넣는다.
		$("#member_zipcode").val(address.zipcode);
		$("#member_address1").val(address.addr);
		// 커서를 상세주소 필드로 이동한다.
		$("#member_address2").attr("readonly", false); //읽기전용 취소
		$("#member_address2").focus();
	};
	
	function MemberDelete() {
		console.log('userNum:', userNum);
		$.ajax({
			url : 'm_user_deleteOK.do',
			data : {
				num : userNum
			},
			method : 'POST',
			success : function(response) {
				console.log('Delete successful');
				window.location.href = ".home";
			},
			error : function(xhr, status, error) {
				console.error('Delete failed:', error);
			}
		});
	};
</script>
</head>
<body>
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
						<button type="button" onclick="daum_address_find(setAddress)"
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
						<input type="text" id="tel" name="member_tel" class="form-control">
					</div>
				</div>
				<div class="form-group row" style="margin-top: 10px;">
					<label for="profile_img" class="col-sm-3 col-form-label">현재 프로필</label>
					<div class="col-sm-9">
						<img width="60px" src="" id="profile_img">
					</div>
				</div>
				<div class="form-group row" style="margin-top: 10px;">
					<label for="file" class="col-sm-3 col-form-label">사진 변경</label>
					<div class="col-sm-9">
						<input type="file" id="file" name="file" class="form-control-file">
						<input type="hidden" id="member_profile" name="member_profile"
							value="">
					</div>
				</div>
				<div class="form-group row" style="margin-top: 20px;">
					<div class="offset-sm-3 col-sm-9">
						<input type="submit" value="수정"
							class="btn btn-primary custom-btn w-75">
					</div>
				</div>
				<input type="hidden" name="check" value="user_update">
			</form>
			<div class="form-group row" style="margin-top: 20px;">
					<div class="offset-sm-3 col-sm-9">
						<button onClick="MemberDelete()">회원탈퇴</button>
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