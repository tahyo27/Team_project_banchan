<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" style="color: black;" href="adminpage.do">관리자 모드</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" style="color: black;" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            상품 관리
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" style="color: black;" href="pr_insert.do">상품등록</a></li>
            <li><a class="dropdown-item" style="color: black;" href="productDetail.do">상품 수정/삭제</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" style="color: black;" href="re_selectAlladmin.do">리뷰관리</a>
        </li>
      </ul>
    </div>
  </div>
</nav>


