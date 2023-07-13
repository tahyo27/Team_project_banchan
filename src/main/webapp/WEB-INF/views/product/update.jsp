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
          <a class="nav-link active" aria-current="page" style="color: black;" href="adminpage.do">돌아가기 / </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" style="color: black;" href="pr_insert.do">상품수정/삭제</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

    
<div style="display: flex; justify-content: center;">
  <section class="bg-white">
	<div class="container py-5">
		<div class="row text-center py-3">
			<div class="row">
				<div class="col md-4 col-md-offset-6">


				<form action="pr_updateOK.do" method="post" enctype="multipart/form-data"> 
					<table class="table table-bordered" style="width: 600px;">
							<tr>
									<td style="width: 150px;">카테고리</td>
								<td class="text-center">
									<select style="width: 200px;" name="category_num" class="form-control" required="required">
										<option value="1" selected="selected" >볶음·구이</option>
										<option value="2">고기반찬</option>
										<option value="3">찜·탕·찌개</option>
										<option value="4">조림·나물·무침</option>
										<option value="5">김치</option>
									</select>
								</td>
							</tr>
					<tr>
						<td style="width: 150px;">상품번호</td>
						<td><input type="text" name="num" class="form-control" style="width: 200px;" required="required" value="${vo2.num}" readonly></td>
					</tr>	
					<tr>
						<td style="width: 150px;">반찬이름</td>
						<td><input type="text" name="product_name" class="form-control" style="width: 200px;" required="required" value="${vo2.product_name}"> </td>
					</tr>	
						
					<tr>
						<td style="width: 150px;">상품이미지</td>
						<td><input type="file" name="file" class="form-control" style="width: 300px;" required="required" value="${vo2.product_img}"> </td>
					</tr>
					
					<tr>
						<td style="width: 150px;">반찬가격</td>
						<td><input type="text" name="product_price" class="form-control" style="width: 200px;" required="required" value="${vo2.product_price}"> </td>
					</tr>	
					
					<tr>
						<td style="width: 150px;">반찬설명</td>
						<td><textarea rows="10" cols="20" name="product_content" class="form-control" style="width: 200px;" required="required">${vo2.product_content}</textarea></td>
					</tr>
					
						
					<tr>
						<td colspan="2" align="center">
							<button type="submit" class="btn btn-outline-secondary me-md-2">➕ 수정완료</button>

	              		
						</td>
					</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
</section>
</div>