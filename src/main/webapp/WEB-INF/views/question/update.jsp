<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section class="container tab-content">
	<div class="row text-center pt-5 pb-3">
	<div class="col-lg-6 m-auto">
		<h1 class="h1">질문수정</h1>
	</div>
</div>
	<div class="container py-5">
		<div class="row py-5">
			<form class="col-md-9 m-auto" role="form" action="q_updateOK.do" method="post">
				<div class="row">
					<div class="form-group col-md-6 mb-3">
						<label for="qnum">글번호</label>
						${vo2.qnum}
						<input type="hidden" id="qnum" name="qnum" value="${vo2.qnum}">
						</td>
					</div>
					<hr>
					<div class="form-group col-md-6 mb-3">
						<label for="title">질문</label>
						<input type="text" class="form-control mt-1" id="title" name="title" value="${vo2.title}">
					</div>
					<div class="form-group col-md-6 mb-3 col text-center mt-2">
						<label for="writer">작성자 :</label>
						&nbsp;&nbsp;&nbsp;
						${vo2.writer}<input type="hidden" id="writer" name="writer" value="${vo2.writer}">
					</div>
					<div class="mb-3">
						<label for="content">내용</label>
						<textarea class="form-control mt-1" rows="8" cols="20" name="content">${vo2.content}</textarea>
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
</section>