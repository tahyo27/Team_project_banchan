package com.banchan.question.model;

import lombok.Data;

@Data
public class PagingVO {

	private int nowPage; // 현재페이지
	private int startPage; // 시작페이지
	private int endPage; // 끝페이지
	private int total; // 전체 게시글 개수
	private int cntPerPage; // 페이지당 글개수
	private int lastPage; // 마지막페이지
	private int start; // SQL쿼리에 씀
	private int end; // SQL쿼리에 씀
	private int cntPage = 5;

	public PagingVO() {
		System.out.println("create PagingVO()....");
	}

	public PagingVO(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}

	// 제일 마지막 페이지 계산
	private void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
	}

	// 시작,끝페이지 계산
	private void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int) Math.ceil((double) nowPage / (double) cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}

	// DB쿼리에서 사용할 start, end값 계산
	private void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}

}
