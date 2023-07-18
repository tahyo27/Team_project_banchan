<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<section class="container tab-content">
<h3>my리뷰</h3>
<div class="row">
		<div class="container">
        <!-- DataTales Example -->
        <div class="card mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">리뷰관리</h6>
            </div>
            <div class="card-body">
                
                    <table class="table" style="font-size:15px;">
                        <thead>
                            <tr>
          	                   	<td>상품명</td>
								<td>리뷰작성일</td>
								<td>리뷰내용</td>
								<td></td>
                            </tr>
                        </thead>
                        <tbody>
							<c:forEach var="vo" items="${vos}">
		<tr>
			<td>${vo.product_name}</td>
			<td>${vo.wdate}</td>
			<td>${vo.review_content}</td>
			<td><a href="re_deleteOKuser.do?num=${vo.num}">삭제</a></td>
		</tr>
		</c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
   		 </div>
	</div>
</section>
