<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Start Item Details -->


<nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" style="color: black;" href="adminpage.do">돌아가기 / </a>
        </li>
          <li class="nav-item">
          	<a class="nav-link" style="color: black;" href="re_selectAlladmin.do">리뷰관리</a>
          </li>
      </ul>
    </div>
  </div>
</nav>

<section class="item-details section p-3">
	<div class="container col-7">
			</div>
</section>


 <!-- Begin Page Content -->
    <div class="container">
        <!-- DataTales Example -->
        <div class="card mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">리뷰관리</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>리뷰번호</th>
                                <th>상품명</th>
                                <th>아이디</th>
                                <th>등록일</th>                                          
                                <th>리뷰내용</th>
                                <th>관리</th>
                            </tr>
                        </thead>
                        <tbody>
							<c:forEach var="vo" items="${vos}">
									<tr>
										<td>${vo.num}</td>
										<td>${vo.product_name}</td>
										<td>${vo.member_id}</td>
										<td>${vo.wdate}</td>
										<td>${vo.review_content}</td>
										<td>
										<a href="re_deleteOK.do?num=${vo.num}" class="btn btn-outline-secondary me-md-2">삭제하기</a>
										</td>
									</tr>
							</c:forEach>           
                        </tbody>
                        
                    </table>
                    
                </div>
                
            </div>
    </div>
</div>
            
<script type="text/javascript" src="js/productdetails.js"></script>