        <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript">
function updateQuantity(form) {
    form.submit();
}
</script>

<section class="h-100 h-custom">
  <div class="container h-100 py-5">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col">
        <div class="table-responsive">
        
        	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <a href="c_deleteAllOK.do?member_id=${user_id}" class="btn btn-outline-secondary me-md-2">장바구니 비우기</a>
        	</div>
        	<br>
        
        
          <table class="table">
            <thead>
              <tr>
                <th scope="col" class="h5">${user_id}님의 장바구니</th>
                <th scope="col">선택수량</th>
                <th scope="col">상품가격</th>
                <th scope="col"></th>
              </tr>
            </thead>
            <tbody>
            
			      
					
              	<c:forEach var="vo" items="${map.vos}" varStatus="i">
              <tr>
                <th scope="row">
                  <div class="d-flex align-items-center">
                      <a href="pr_selectOne.do?num=${vo.product_num}">
						        <img width="200px" src="${pageContext.request.contextPath}/resources/uploadimg/product/${vo.product_img}"></a>
                    <div class="flex-column ms-4">
                      <p class="mb-2">${vo.product_name}</p>
                    </div>
                  </div>
                </th>
                
                
                <td class="align-middle">
                  <p class="mb-0" style="font-weight: 500;"></p>
                    <form action="c_updateOK.do" method="post" onsubmit="updateQuantity(this); return false;">
						<input type="hidden" name="num" value="${vo.num}">
						<input type="hidden" name="member_id" value="${user_id}">
						<select name="amount">
							<c:forEach begin="1" end="20" var="i">
								<option value="${i}" ${i == vo.amount ? 'selected' : ''}>${i}</option>
							</c:forEach>
						</select>&nbsp;개
						<button type="submit" class="btn btn-light">변경</button>
					</form>
                  
                </td>
                <td class="align-middle">
                  <p class="mb-0" style="font-weight: 500;"><fmt:formatNumber value="${vo.product_price}" pattern="#,###" />원</p>
                </td>
                
               <td class="align-middle text-end">
                <a href="c_deleteOK.do?num=${vo.num}&member_id=${user_id}" class="text-danger"><i class="fas fa-trash fa-lg"></i></a>
              </td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        
          			<c:if test="${empty map.vos}">
          				<br>
			 		 	<div id="normal_empty_cart" class="fs-1 text-center"><h3>장바구니에 담긴 상품이 없습니다</h3></div>
					</c:if>
					
        
         <div>
			<div class="pt-1 text-end">
				
				50,000원 이상 구매 시 배송비 무료입니다<br>
				<hr>
				장바구니 금액 합계 : <fmt:formatNumber value="${map.sumMoney}" pattern="#,###" />원<br>
				배송비 :  <fmt:formatNumber value="${map.fee}" pattern="#,###" />원<br>
				전체 주문 금액 : <fmt:formatNumber value="${map.allSum}" pattern="#,###" />원<br>
				
			</div>
         </div>
         
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
     		   <a href="o_insert.do" class="btn btn-outline-success">주문하기</a>
        	</div>
        	
        
       </div>
      </div>
     </div>
    </section>
    
    
    
    
    
    