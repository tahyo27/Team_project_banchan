package com.banchan.question.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class QuestionDAOimpl implements QuestionDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public QuestionDAOimpl() {
		log.info("BoardDAOimpl....");
	}

	@Override
	public int insert(QuestionVO vo) {
		log.info("insert()....{}",vo);
		return sqlSession.insert("Q_INSERT",vo);
	}

	@Override
	public int update(QuestionVO vo) {
		log.info("update()....{}",vo);
		return sqlSession.update("Q_UPDATE",vo);
	}

	@Override
	public int delete(QuestionVO vo) {
		log.info("delete()....{}",vo);
		return sqlSession.delete("Q_DELETE",vo);
	}

	@Override
	public List<QuestionVO> selectAll() {
		log.info("selectAll()....");
		return sqlSession.selectList("Q_SELECT_ALL");
	}
	

	@Override
	public QuestionVO selectOne(QuestionVO vo) {
		log.info("selectOne()....{}",vo);
		
		return sqlSession.selectOne("Q_SELECT_ONE",vo);
	}

	@Override
	public List<QuestionVO> searchList(String searchKey, String searchWord) {
		log.info("searchList()....searchKey:{}",searchKey);
		log.info("searchList()....searchWord:{}",searchWord);
		String key = "";
		if(searchKey.equals("title")) {
			key = "Q_SEARCH_LIST_TITLE";
		}else if(searchKey.equals("content")) {
			key = "Q_SEARCH_LIST_CONTENT";
			
		}else {
			key = "Q_SEARCH_LIST_WRITER";
			
		}
		return sqlSession.selectList(key,"%"+searchWord+"%");
	}

	@Override
	public void vcountUp(QuestionVO vo) {
		log.info("vcountUp()....{}",vo);
		sqlSession.update("Q_VCOUNT_UP",vo);
	}

	@Override
	public int countBoard() {
		log.info("countBoard()...");
		return sqlSession.selectOne("Q_SELECT_ALL_COUNT");
	}

	@Override
	public List<QuestionVO> selectBoard(PagingVO vo) {
		log.info("selectBoard()...{}",vo);
		return sqlSession.selectList("Q_SELECT_ALL_LIST",vo);
	}



	

}
