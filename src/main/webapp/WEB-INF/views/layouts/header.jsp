<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Start Top Nav -->
<nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
	<div class="container text-light">
		<div class="w-100 d-flex justify-content-between">
			<div>
				<i class="fa fa-envelope mx-2"></i>
				<a class="navbar-sm-brand text-light text-decoration-none"
					href="mailto:info@company.com">BANCHAN@company.com</a>
				<i class="fa fa-phone mx-2"></i>
				<a class="navbar-sm-brand text-light text-decoration-none" href="tel:010-020-0340">010-1111-2222</a>
			</div>
			<div>
			
				
				<c:set var="userId" value="${sessionScope.user_id}" />
				<c:set var="isLoggedIn" value="${not empty userId}" />
				
			<c:choose>
			    <c:when test="${isLoggedIn}">
			        <c:choose>
			            <c:when test="${userId eq 'admin'}">
			                <a class="text-light" href="adminpage.do">관리자페이지</a>
			            </c:when>
			            <c:otherwise>
			                <!-- 회원으로 로그인한 경우 -->
			            </c:otherwise>
			        </c:choose>
			    </c:when>
					    <c:otherwise>
					        <a class="text-light" href="m_insert.do">회원가입</a>
					    </c:otherwise>
			</c:choose>
				
<!-- 				<a class="text-light" href="https://www.instagram.com/" target="_blank"><i -->
<!-- 						class="fab fa-instagram fa-sm fa-fw me-2"></i></a> -->
<!-- 				<a class="text-light" href="https://twitter.com/" target="_blank"><i -->
<!-- 						class="fab fa-twitter fa-sm fa-fw me-2"></i></a> -->
<!-- 				<a class="text-light" href="https://www.linkedin.com/" target="_blank"><i -->
<!-- 						class="fab fa-linkedin fa-sm fa-fw"></i></a> -->
			</div>
		</div>
	</div>
</nav>
<!-- Close Top Nav -->

<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-light shadow">
	<div class="container d-flex justify-content-between align-items-center">

		<a class="navbar-brand text-success logo h1 align-self-center" href=".home">
			BANCHAN
		</a>

		<button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse"
			data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
			id="templatemo_main_nav">
			<div class="flex-fill">
				<ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
					<li class="nav-item">
						<a class="nav-link" href="pr_selectAll.do">전체</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="pr_selectCategory.do?category_num=2">고기반찬</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="pr_selectCategory.do?category_num=1">조림·나물·무침</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="pr_selectCategory.do?category_num=3">국·탕·찌개</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="pr_selectCategory.do?category_num=4">김치</a>
					</li>
				</ul>
			</div>
		<div class="navbar align-self-center d-flex">
			
			<form class="d-flex" action="pr_searchList.do">
				<select name="searchKey" id="searchKey_header">
						<option value="name">상품명</option>
				</select>
		        	<input class="form-control me-2" type="search" placeholder="상품 검색" name="searchWord" id="searchWord">
		        	<button class="btn btn-outline-success" type="submit"><i class="fas fa-search"></i></button>
		     </form>
				
		
				<c:choose>
  					<c:when test="${isLoggedIn}">	
	  					<c:choose>
					      <c:when test="${userId ne 'admin'}">
					        <a class="nav-icon position-relative text-decoration-none" href="c_selectAll.do?member_id=${userId}">
					          <i class="fa fa-fw fa-cart-arrow-down text-dark mr-1"></i>
					          <span class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">!</span>
					        </a>
					      </c:when>
					    </c:choose>
					    
				<a class="nav-icon position-relative text-decoration-none" href="logout.do">
					<i class="fa fa-fw fa-user text-dark mr-3"></i>
					<span
						class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">Logout</span>
				</a>
					 </c:when>
  					<c:otherwise>
				<a class="nav-icon position-relative text-decoration-none" href="SNS_Login.do">
					<i class="fa fa-fw fa-user text-dark mr-3"></i>
					<span
						class="position-absolute top-0 left-100 translate-middle badge rounded-pill bg-light text-dark">Login</span>
				</a>
				  </c:otherwise>
				</c:choose>
			</div>
		</div>

	</div>
</nav>
<!-- Close Header -->

<!-- Modal -->
<div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="w-100 pt-1 mb-5 text-right">
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<form action="" method="get" class="modal-content modal-body border-0 p-0">
			<div class="input-group mb-2">
				<input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
				<button type="submit" class="input-group-text bg-success text-light">
					<i class="fa fa-fw fa-search text-white"></i>
				</button>
			</div>
		</form>
	</div>
</div>