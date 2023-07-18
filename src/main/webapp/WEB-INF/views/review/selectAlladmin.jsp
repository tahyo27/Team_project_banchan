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
</head>
<body>

	<div class="container">
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
            
			
</body>
</html>