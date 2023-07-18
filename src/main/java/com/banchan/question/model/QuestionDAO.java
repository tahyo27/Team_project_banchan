package com.banchan.question.model;

import java.util.List;

public interface QuestionDAO {

	public int insert(QuestionVO vo);

	public int update(QuestionVO vo);

	public int delete(QuestionVO vo);

	public List<QuestionVO> selectAll();

	public QuestionVO selectOne(QuestionVO vo);

	public List<QuestionVO> searchList(String searchKey, String searchWord);

	public void vcountUp(QuestionVO vo);
	
	public int countBoard();	//게시글 총 개수
	
	public List<QuestionVO> selectBoard(PagingVO vo); //페이징처리 게시글조회
	

}
