package com.banchan.member.model;

import lombok.Data;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Data
public class Paging {

	private int listSize = 50; // 초기값으로 목록개수를 10으로 셋팅
	private int rangeSize = 10; // 초기값으로 페이지범위를 10으로 셋팅
	private int page;
	private int range;
	private int listCnt;
	private int pageCnt;
	private int startPage;
	private int startList;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private String searchKey;
	private String searchWord; // 키워드
	
	
	public void pageInfo(int page, int range, int listCnt) {

		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		
		//전체 페이지수 
		log.info("pageCnt....listCnt:{}...listSize:{}",listCnt,listSize);
		this.pageCnt =  (int) Math.ceil((double)listCnt/listSize); //double로 형변환후 연산 후 올림
		log.info("pageCnt....pageCnt:{}",pageCnt);
		//시작 페이지
		this.startPage = (range - 1) * rangeSize + 1 ;

		//끝 페이지
		this.endPage = range * rangeSize;	

		//게시판 시작번호
		this.startList = (page - 1) * listSize;

		//이전 버튼 상태
		this.prev = range == 1 ? false : true;

		//다음 버튼 상태
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}

	}

}
