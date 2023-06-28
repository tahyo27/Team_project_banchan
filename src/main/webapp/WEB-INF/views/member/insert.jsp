<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert page</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		console.log("onload....");
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
		} else {
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color', 'red');
		}
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
					<button type="button" onclick="idCheck()" class="myButton">ID중복체크</button>
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
				<td><label for="tel">tel:</label></td>
				<td><input type="text" id="tel" name="member_tel" value="011"></td>
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