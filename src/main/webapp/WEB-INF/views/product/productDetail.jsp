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
</body>
</html>