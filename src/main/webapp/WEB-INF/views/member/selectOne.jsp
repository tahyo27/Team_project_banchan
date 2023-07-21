<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="tab-content">
	<div id="user-info" class="tab-pane fade show active">
		<h1>회원정보</h1>
		<table class="table table-custom">
			<thead>
				<tr>
					<td colspan="10" class="text-center">
						<img width="100px" src="resources/uploadimg/thumb_${vo2.member_profile}">
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th>번호</th>
					<td>${vo2.num}</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${vo2.member_id}</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${vo2.member_pw}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${vo2.member_name}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${vo2.member_tel}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${vo2.member_email}</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>${vo2.member_zipcode}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${vo2.member_address1}</td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>${vo2.member_address2}</td>
				</tr>
				<tr>
					<th>등록일</th>
					<td>${vo2.member_regdate}</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="10" class="text-right">
						<a href="m_update.do?num=${param.num}" class="btn btn-primary">회원수정</a>
						<a href="m_deleteOK.do?num=${param.num}" class="btn btn-danger">회원삭제</a>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</div>