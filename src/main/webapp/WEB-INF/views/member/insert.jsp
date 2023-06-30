<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert page</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
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
				$('#demo').text(msg);
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
</script>
</head>
<body>
	<h1>회원가입</h1>

	<form action="m_insertOK.do" method="post"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td><label for="id">id:</label></td>
				<td><input type="text" id="id" name="member_id" required>
					<button type="button" onclick="idCheck()" class="idCheckButton">ID중복체크</button>
					<span id="demo"></span></td>
			</tr>
			<tr>
				<td><label for="pw">pw:</label></td>
				<td><input type="password" id="pw" name="member_pw"></td>
			</tr>
			<tr>
				<td><label for="name">name:</label></td>
				<td><input type="text" id="name" name="member_name"></td>
			</tr>
			<tr>
				<td><label for="email">email:</label></td>
				<td><input type="email" id="userEmail" name="member_email"
					placeholder="이메일을 입력하세요" required>
					<button type="button" class="btn btn-primary" id="mail-Check-Btn"
						onclick="mailCheck()">이메일 인증</button></td>
			<tr>
				<td><label for=></label></td>
				<td><input class="mail-check-input" placeholder="인증번호 6자리 입력"
					disabled="disabled" maxlength="6">
					<button type="button" onclick="numberCheck()">인증번호 확인</button></td>

				<td><span id="mail-check-warn"></span></td>
			</tr>
			<tr>
				<td><label for="member_zipcode">우편번호:</label></td>
				<td><input id="member_zipcode" name="member_zipcode"
					readonly="readonly"></td>
				<td><button type="button" onclick="daum_address_find()">우편번호찾기</button></td>
			</tr>
			<tr>
				<td><label for="member_address1">주소:</label></td>
				<td><input id="member_address1" name="member_address1"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td><label for="member_address2">상세주소:</label></td>
				<td><input id="member_address2" name="member_address2"
					readonly="readonly"></td>
			</tr>

			<tr>
				<td><label for="tel">tel:</label></td>
				<td><input type="text" id="tel" name="member_tel" value=""></td>
			</tr>
			<tr>
				<td><label for="file">profile:</label></td>
				<td><input type="file" id="file" name="file" value=""></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="myButton"></td>
			</tr>
		</table>
	</form>
</body>
</html>