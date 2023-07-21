<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
table {
	width: 100%;
}

a {
	text-decoration: none;
}
</style>
<section class="container tab-content">
<div class="row text-center pt-5 pb-3">
	<div class="col-lg-6 m-auto">
		<h1 class="h1">질문</h1>
	</div>
</div>

<div class="container py-5">
	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>질문</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>${vo2.qnum}</td>
				<td>${vo2.title}</td>
				<td>${vo2.content}</td>
				<td>${vo2.writer}</td>
				<td>${vo2.wdate}</td>
				<td>${vo2.vcount}</td>
			</tr>
			<tr>

			</tr>
		</tbody>
		<div class="row">
			<div class="col text-end mt-2">
				<c:if test="${vo2.writer eq user_id }">
					<!-- 글쓴이와 로그인한사람이 같을 경우 수정삭제가능 -->
					<input type="button" value="수정" class="btn btn-success btn-lg px-3"
						onclick="location.href='q_update.do?qnum=${param.qnum}'">
					<input type="button" value="삭제" class="btn btn-success btn-lg px-3"
						onclick="location.href='q_deleteOK.do?qnum=${param.qnum}'">
				</c:if>
			</div>
		</div>
	</table>
</div>
<hr>
<c:if test="${'admin' eq user_id }">
	<!-- 로그인한 사람이 관리자(admin)인 경우만 답변쓰기 가능 -->
	<div class="row text-center pt-5 pb-3">
		<div class="col-lg-6 m-auto">
			<h1 class="h1">답변(관리자)</h1>
		</div>
	</div>
	<div class="container py-5">
		<table>
			<tr>
				<th>content</th>
				<th>writer</th>
			</tr>
			<tr>
				<td>
					<form action="a_insertOK.do">
						<input type="hidden" name="qnum" value="${param.qnum}"> <input
							type="hidden" name="writer" value="${user_id}"> <input
							type="text" name="content" value="답변입니다."> <input
							type="submit" value="입력완료" class="myButton">
					</form>
				</td>
				<td>${user_id}</td>
			</tr>
		</table>
	</div>
<hr>
</c:if>
<div class="row text-center pt-5 pb-3">
	<div class="col-lg-6 m-auto">
		<h1 class="h1">답변 ${user_id }</h1>
	</div>
</div>
<div class="container py-5">
	<table>
		<tr>
			<th>답글번호</th>
			<th>답변내용</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th></th>
		</tr>
		<c:forEach var="an" items="${ans}">
			<tr>
				<td>${an.anum}</td>
				<c:if test="${'admin' eq user_id }">
					<!-- 글을 쓴 관리자만 수정 삭제 가능 -->
					<td>
						<form action="a_updateOK.do">
							<input type="hidden" name="qnum" value="${an.qnum}"> <input
								type="hidden" name="anum" value="${an.anum}"> <input
								type="text" name="content" value="${an.content}"> <input
								type="submit" value="수정완료" class="myButton">
							<td>${an.writer}</td>
							<td>${an.wdate}</td>
						</form>
					</td>
					<td><a href="a_deleteOK.do?anum=${an.anum}&qnum=${an.qnum}"
						class="myButton">답글삭제</a></td>
				</c:if>
			
				<c:if test="${vo2.writer eq user_id}">
				<!-- 질문쓴사람과 로그인한사람이 같으면 -->
							<td>${an.content}</td>
							<td>${an.writer}</td>
							<td>${an.wdate}</td>
				</c:if>
				<c:if test="${vo2.writer ne user_id && user_id ne 'admin'}">
				<!-- 질문쓴사람과 로그인한사람이 다르면 -->
							<td>비밀글입니다
				</c:if>
				


			</tr>
		</c:forEach>
	</table>
</div>
</section>

