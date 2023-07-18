<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원정보</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<script type="text/javascript">
	
</script>
<style>
</style>

</head>
<body>

	<div class="container">
		<div class="row mt-5">
			<div class="col-md-3">
				<ul class="nav flex-column nav-pills">
					<li class="nav-item"><a class="nav-link"
						data-toggle="pill" href="adminpage.do">관리자모드</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="pill"
						href="m_selectAll.do">회원정보</a></li>
					<li class="nav-item"><a class="nav-link"
						data-toggle="pill" href="pr_insert.do">상품등록</a></li>
					<li class="nav-item"><a class="nav-link" data-toggle="pill"
						href="productDetail.do">상품수정/삭제</a></li>
					<li class="nav-item"><a class="nav-link  active" data-toggle="pill"
						href="re_selectAlladmin.do">리뷰관리</a></li>
				</ul>
			</div>
			
			<div class="col-md-9">
				<div class="tab-content">
					<div id="user-info" class="tab-pane fade show active">

<section class="h-100 h-custom">
  <div class="container h-100 py-5">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="table-responsive">	
        
		<div class="container">
        <!-- DataTales Example -->
        <div class="card mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">리뷰관리</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" style="font-size:15px;">
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
</div>
</div>
</div>
</div>

</section>
</div>
</div>
</div>

            
			
	</div>
	</div>
</body>
</html>