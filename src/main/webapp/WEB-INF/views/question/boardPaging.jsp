<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
table {
	width: 100%;
}

a {
	text-decoration: none;
}
</style>

<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "boardList.do?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>

<section class="container tab-content">
<div class="row text-center pt-5 pb-3">
	<div class="col-lg-6 m-auto">
		<h1 class="h1">Q&A</h1>
	</div>
</div>

<div class="container py-5">
	<div style="float: left;">
		<c:if test="${user_id ne 'admin'}"> <!-- 일반사용자가 로그인한경우 -->
			<form action="q_searchList.do">
				<select name="searchKey" id="searchKey">
					<option value="title">title</option>
					<option value="content">content</option>
					<option value="writer">writer</option>
				</select> <input type="text" name="searchWord" id="searchWord" placeholder="검색어입력">
				<input type="submit" class="btn btn-success btn-lg px-3" value="검색">
			</form>
		</c:if>
		<c:if test="${user_id eq 'admin'}"> <!-- 일반사용자가 로그인한경우 -->
			<form action="admin_q_searchList.do">
				<select name="searchKey" id="searchKey">
					<option value="title">title</option>
					<option value="content">content</option>
					<option value="writer">writer</option>
				</select> <input type="text" name="searchWord" id="searchWord" placeholder="검색어입력">
				<input type="submit" class="btn btn-success btn-lg px-3" value="검색">
			</form>
		</c:if>
	</div>
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
				보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
				보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
				보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
				보기</option>
		</select>
	</div>
	
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
		<c:forEach var="list" items="${viewAll}">
			<c:if test="${user_id ne 'admin'}"> <!-- 일반사용자가 로그인한경우 -->
				<tr>
					<td><a href="q_selectOne.do?qnum=${list.qnum}">${list.qnum}</a></td>
					<td>${list.title}</td>
					<td>${list.content}</td>
					<td>${list.writer}</td>
					<td>${list.wdate}</td>
					<td>${list.vcount}</td>
				</tr>
			</c:if>
			<c:if test="${user_id eq 'admin'}"> <!-- 관리자가 로그인한경우 -->
				<tr>
					<td><a href="admin_q_selectOne.do?qnum=${list.qnum}">${list.qnum}</a></td>
					<td>${list.title}</td>
					<td>${list.content}</td>
					<td>${list.writer}</td>
					<td>${list.wdate}</td>
					<td>${list.vcount}</td>
				</tr>
			</c:if>
		</c:forEach>
		</tbody>
	</table>
	
	<c:if test="${user_id ne 'admin'}">
	<div class="row">
		<div class="col text-end mt-2">
			<input type="button" value="질문하기" class="btn btn-success btn-lg px-3"
				onclick="location.href='q_insert.do'"><br>
		</div>
	</div>
	</c:if>
	
	<div style="display: block; text-align: center;">
		<c:if test="${paging.startPage != 1 }">
			<a
				href="boardList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach var="p" begin="${paging.startPage }"
			end="${paging.endPage }">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a
						href="boardList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a
				href="boardList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
</div>
</section>