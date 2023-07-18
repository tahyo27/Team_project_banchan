<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script type="text/javascript">
	$(function () {
		$.ajax({
			url: "m_json_selectOne.do",
			data: { num: ${ user_num } },
			method: 'GET',//default get
			dataType: 'json', //xml,text
			success: function (vo2) {
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
</script>
<div class="tab-content">
	<div id="user-info" class="tab-pane fade show active">
		<h3>회원정보</h3>
		<form action="m_updateOK.do" method="post" enctype="multipart/form-data">
			<input type="hidden" id="input_num" name="num">
			<input type="hidden" id="input_email" name="member_email">
			<input type="hidden" id="input_id" name="member_id">
			<div class="form-group row">
				<label for="id" class="col-sm-3 col-form-label">아이디</label>
				<div class="col-sm-9">
					<span id="span_id"></span>
				</div>
			</div>
			<div class="form-group row">
				<label for="pw" class="col-sm-3 col-form-label">비밀번호</label>
				<div class="col-sm-9">
					<input type="password" id="pw" name="member_pw" class="form-control">
				</div>
			</div>
			<div class="form-group row" style="margin-top: 7px;">
				<label for="name" class="col-sm-3 col-form-label">이름</label>
				<div class="col-sm-9">
					<input type="text" id="name" name="member_name" class="form-control">
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
					<input id="member_zipcode" name="member_zipcode" readonly class="form-control">
				</div>
				<div class="col-sm-3">
					<button type="button" onclick="daum_address_find(setAddress)" class="btn btn-secondary">우편번호 찾기</button>
				</div>
			</div>
			<div class="form-group row" style="margin-top: 7px;">
				<label for="member_address1" class="col-sm-3 col-form-label">주소</label>
				<div class="col-sm-9">
					<input id="member_address1" name="member_address1" readonly class="form-control">
				</div>
			</div>
			<div class="form-group row" style="margin-top: 7px;">
				<label for="member_address2" class="col-sm-3 col-form-label">상세주소</label>
				<div class="col-sm-9">
					<input id="member_address2" name="member_address2" readonly class="form-control">
				</div>
			</div>
			<div class="form-group row" style="margin-top: 7px;">
				<label for="tel" class="col-sm-3 col-form-label">전화번호</label>
				<div class="col-sm-9">
					<input type="text" id="tel" name="member_tel" class="form-control">
				</div>
			</div>
			<div class="form-group row" style="margin-top: 10px;">
				<label for="file" class="col-sm-3 col-form-label">프로필 사진</label>
				<div class="col-sm-9">
					<input type="file" id="file" name="file" class="form-control-file">
				</div>
			</div>
			<div class="form-group row" style="margin-top: 20px;">
				<div class="offset-sm-3 col-sm-9">
					<input type="submit" value="수정" class="btn btn-primary custom-btn w-75">
				</div>
			</div>
		</form>
	</div>
</div>