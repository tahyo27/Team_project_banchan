<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
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
	
<style>
/* 추가적인 CSS 스타일링을 위한 스타일 시트 */
.tab-content {
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 4px;
}

.custom-btn {
	width: 70%;
}

.roboto_font {
	font-family: 'Roboto', sans-serif;
	font-weight: 500;
}

.search-input {
	width: 400px; /* 상품검색창 가로길이 조정 */
}

.navbar a {
	color: black; /* 링크의 텍스트 색상을 원하는 색상으로 지정 */
}
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
					<li class="nav-item"><a class="nav-link active" data-toggle="pill"
						href="productDetail.do">상품수정/삭제</a></li>
				</ul>
			</div>

			<div class="col-md-9">
				<div class="tab-content">
					<div id="user-info" class="tab-pane fade show active">
						<h3>상품수정/삭제</h3>
						
						
<section class="h-100 h-custom">
  <div class="container h-100 py-5">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="table-responsive">
        
          <table class="table">
            <thead>
              <tr>
                <th scope="col">상품정보</th>
                <th scope="col">상품가격</th>
                <th scope="col"></th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
					
              	<c:forEach var="vo" items="${vos}" varStatus="i">
              <tr>
                <th scope="row">
                  <div class="d-flex align-items-center">
                      <a href="pr_selectOne.do?num=${vo.num}">
						        <img width="200px" src="${pageContext.request.contextPath}/resources/uploadimg/product/${vo.product_img}"></a>
                    <div class="flex-column ms-4">
                      <p class="mb-2">${vo.product_name}</p>
                      <th class="align-middle">
                  <p class="mb-0" style="font-weight: 500;"><fmt:formatNumber value="${vo.product_price}" pattern="#,###" />원</p>
              		  </th>
              		  
              		  
              		   <td class="align-middle text-center">
                <a href="pr_update.do?num=${vo.num}" class="btn btn-outline-secondary me-md-2">수정하기</a>
              </td>
              		   <td class="align-middle text-center">
                <a href="pr_deleteOK.do?num=${vo.num}" class="btn btn-outline-secondary me-md-2">삭제하기</a>
            		  </td>
                    </div>
                  </div>
              </tr>
              </c:forEach>
            </tbody>
          </table>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>