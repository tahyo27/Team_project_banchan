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
		<h1 class="h1">검색결과</h1>
	</div>
</div>

<div class="container py-5">
	<div style="float: left;">
		<form action="q_searchList.do">
			<select name="searchKey" id="searchKey">
				<option value="title">제목만</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select> <input type="text" name="searchWord" id="searchWord" placeholder="검색어입력">
			<input type="submit" class="btn btn-success btn-lg px-3" value="검색">
		</form>
	</div>

	<table>
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>작성날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${vos}">
				<tr>
					<td><a href="q_selectOne.do?qnum=${vo.qnum}">${vo.qnum}</a></td>
					<td>${vo.title}</td>
					<td>${vo.content}</td>
					<td>${vo.writer}</td>
					<td>${vo.wdate}</td>
					<td>${vo.vcount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</section>










