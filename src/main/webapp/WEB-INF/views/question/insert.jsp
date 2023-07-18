<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row text-center pt-5 pb-3">
	<div class="col-lg-6 m-auto">
		<h1 class="h1">질문하기</h1>
 	</div>
</div>
	<div class="container py-5">
		<div class="row py-5">
			<form class="col-md-9 m-auto" role="form" action="q_insertOK.do" method="post">
				<div class="row">
					<div class="form-group col-md-6 mb-3">
						<label for="title">질문</label>
						<input type="text" class="form-control mt-1" id="title" name="title" placeholder="질문을 적어주세요" >
					</div>
					<div class="form-group col-md-6 mb-3 col text-center mt-2">
						<label for="writer">작성자 :</label>
						&nbsp;&nbsp;&nbsp;${user_id}
						<input type="hidden" id="writer" name="writer" value="${user_id}">
					</div>
					<div class="mb-3">
						<label for="content">내용</label>
						<textarea class="form-control mt-1" rows="8" cols="20" name="content" placeholder="내용을 적어주세요"></textarea>
					 </div>
					<div class="row">
						<div class="col text-end mt-2">
							<button type="submit" class="btn btn-success btn-lg px-3">등록</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
