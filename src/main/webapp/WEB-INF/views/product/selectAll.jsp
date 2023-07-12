<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="bg-white">
	<div class="container py-5">
		<div class="row text-center py-3">
			<div class="col-lg-6 m-auto">
			</div>
		</div>
		

<div class="row row-cols-1 row-cols-md-3 g-4">
    	<c:forEach var="vo" items="${vos}">
  <div class="col">
    <div class="card h-100">
      <a href="pr_selectOne.do?num=${vo.num}"><img src="${pageContext.request.contextPath}/resources/uploadimg/product/${vo.product_img}" class="card-img-top"></a>
      <div class="card-body">
      	 <h5 class="card-title">${vo.product_name}</h5>
        <fmt:formatNumber value="${vo.product_price}" pattern="#,###" />원
      </div>
    </div>
  </div>
    	</c:forEach>
 </div>

	</div>
</section>