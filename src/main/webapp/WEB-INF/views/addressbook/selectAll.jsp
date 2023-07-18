<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
	function setAddress(address) {
		// 우편번호와 주소 정보를 해당 필드에 넣는다.
		$("#ab_zipcode").val(address.zipcode);
		$("#ab_address1").val(address.addr);
		// 커서를 상세주소 필드로 이동한다.
		$("#ab_address2").attr("readonly", false); //읽기전용 취소
		$("#ab_address2").focus();
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
								<button type="button" class="btn btn-secondary" onclick="daum_address_find(setAddress)">우편번호찾기</button>
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