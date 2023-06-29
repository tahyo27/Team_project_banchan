<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div>
	<div class="event">
		<a href="#none"><img width="300px"
			src="resources/uploadimg/event.png"></a>
	</div>

	<div class="wrap">
		<div class="logo">
			<a href="home.do"><img src="resources/uploadimg/logo.svg"></a>
		</div>

		<div class="search">
			<form action="searchList.do">
				<input type="text" placeholder="남도의 맛있는 음식을, 집에서 간편하게">
				<button>검색</button>
			</form>
		</div>

		<div class="abc">
			<ul>
				<li><a href="#none">로그인</a></li>
				<li><a href="#none">장바구니</a></li>
				<li><a href="#none">마이페이지</a></li>
				<li><a href="#none">후기/재구매</a></li>
			</ul>
		</div>
	</div>

	<div class="category">
		<jsp:include page="category.jsp"></jsp:include>
	</div>
</div>