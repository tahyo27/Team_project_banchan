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
</script>

</head>
<body>
	<h1>배송주소록</h1>

	<button id="showFormButton">+새 배송지 등록</button>
	<form action="ab_insertOK.do" method="post" id="myForm"
		style="display: none;">
		<table>
			<tr>
				<td><label for="ab_name">수취인:</label></td>
				<td><input type="text" id="ab_name" name="ab_name" value="">
			</tr>
			<tr>
				<td><label for="ab_zipcode">우편번호:</label></td>
				<td><input id="ab_zipcode" name="ab_zipcode" readonly="readonly"></td>
				<td><button type="button" onclick="daum_address_find()">우편번호찾기</button></td>
			</tr>
			<tr>
			<td><label for="ab_address1">주소:</label></td>
			<td><input id="ab_address1" name="ab_address1"
				readonly="readonly"></td>
			</tr>
			<tr>
			<td><label for="ab_address2">상세주소:</label></td>
			<td><input id="ab_address2" name="ab_address2" readonly="readonly"></td>
			</tr>
			<tr>
			<td><label for="ab_tel">전화번호:</label></td>
			<td><input id="ab_tel" name="ab_tel"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit">
				<td><button type="button" onclick="hide_form()">취소</button></td>
			</tr>
			<tr>
			<input type="hidden" id="member_num" name="member_num" value="${param.member_num}">
			</tr>
		</table>
	</form>

	<table>
		<thead>
			<tr>
				<th>num</th>
				<th>name</th>
				<th>zipcode</th>
				<th>address1</th>
				<th>address2</th>
				<th>tel</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td>${vo.num}</a></td>
					<td>${vo.ab_name}</td>
					<td>${vo.ab_zipcode}</td>
					<td>${vo.ab_address1}</td>
					<td>${vo.ab_address2}</td>
					<td>${vo.ab_tel}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5">1 2 3 4 5</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>