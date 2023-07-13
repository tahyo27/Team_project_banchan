<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript">
function deleteItem(){
	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	     document.removefrm.submit();
	 }else{   //취소
	     return false;
	 }
	}
 </script>


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
          	<a class="nav-link" style="color: black;" href="productDetail.do">상품수정/삭제</a>
          </li>
      </ul>
    </div>
  </div>
</nav>


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
    
    
    
    
    
    


