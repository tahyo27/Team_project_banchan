<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function daum_address_find() {
		new daum.Postcode({
			oncomplete: function (data) {
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

	function toggleForm() {
		$('#myForm').toggle();
	};

	function baseUpdate(num) {
		$.ajax({
			url: 'ab_updateOK.do',
			data: { num: num },
			method: 'POST',
			success: function (response) {
				console.log('Update successful');
				alert("기본배송지로 설정되었습니다.")
				location.reload(); // 페이지 새로고침		
			},
			error: function (xhr, status, error) {
				console.error('Update failed:', error);
			}
		});
	};

	function baseDelete(num) {
		$.ajax({
			url: 'ab_deleteOK.do',
			data: { num: num },
			method: 'POST',
			success: function (response) {
				console.log('Delete successful');
				alert("배송지를 삭제하였습니다.")
				location.reload(); // 페이지 새로고침		
			},
			error: function (xhr, status, error) {
				console.error('Delete failed:', error);
			}
		});
	};
</script>

<div class="tab-content">
	<div id="user-info" class="tab-pane fade show active">
		<h3>배송주소록</h3>
		<button id="showFormButton" class="btn btn-primary" onclick="toggleForm()">+ 새 배송지 등록</button>
		<form action="ab_insertOK.do" method="post" id="myForm" style="display: none;">
			<input type="hidden" id="member_num" name="member_num" value="${param.member_num}">
			<table class="table custom-table">
				<tr>
					<td><label for="ab_name">수취인</label></td>
					<td><input type="text" id="ab_name" name="ab_name" class="form-control"></td>
				</tr>
				<tr>
					<td><label for="ab_zipcode">우편번호</label></td>
					<td>
						<div class="input-group">
							<input id="ab_zipcode" name="ab_zipcode" class="form-control" readonly="readonly">
							<div class="input-group-append">
								<button type="button" class="btn btn-secondary" onclick="daum_address_find()">우편번호찾기</button>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td><label for="ab_address1">주소</label></td>
					<td><input id="ab_address1" name="ab_address1" class="form-control" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td><label for="ab_address2">상세주소</label></td>
					<td><input id="ab_address2" name="ab_address2" class="form-control" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td><label for="ab_tel">전화번호</label></td>
					<td><input id="ab_tel" name="ab_tel" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" class="btn btn-primary" value="등록">
						<button type="button" class="btn btn-secondary" onclick="toggleForm()">취소</button>
					</td>
				</tr>
			</table>
		</form>
		<table class="table custom-table">
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
						<td>
							<button type="button" class="btn btn-sm btn-primary custom-btn " onclick="baseUpdate(${vo.num})">
								<span class="small">기본배송지 설정</span>
							</button>
							<button type="button" class="btn btn-sm btn-primary custom-btn" onclick="baseDelete(${vo.num})"
								style="margin:2px auto;">
								<span class="small">삭제</span>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
			</tfoot>
		</table>
	</div>
</div>