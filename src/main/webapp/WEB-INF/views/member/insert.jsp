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

$(function(){
	console.log("onload....");
});

function idCheck(){
	console.log("idCheck....",$('#id').val());
	
	$.ajax({
		url : "json_m_idCheck.do",
		data:{member_id:$('#id').val()},
		method:'GET',
		dataType:'json',
		success : function(obj) {
			console.log('ajax...success:', obj);
			console.log('ajax...success:', obj.result);
			let msg = '';
			if(obj.result==='OK'){
				msg = '사용가능한 아이디입니다.';
			}else{
				msg = '사용중인 아이디입니다.';
			}
			$('#demo').text(msg);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
	
}//end idCheck()...

</script>
</head>
<body>
	<h1>회원가입</h1>
	
	<form action="m_insertOK.do" method="post" enctype="multipart/form-data">
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
				<td><input type="email" name="member_email" placeholder="이메일을 입력하세요" required></td>
			</tr>
			<tr>
				<td><label for="tel">tel:</label></td>
				<td><input type="text" id="tel" name="member_tel" value="011"></td>
			</tr>
			<tr>
				<td><label for="file">file:</label></td>
				<td><input type="file" id="file" name="file" value=""></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="myButton"></td>
			</tr>
		</table>
	</form>
</body>
</html>