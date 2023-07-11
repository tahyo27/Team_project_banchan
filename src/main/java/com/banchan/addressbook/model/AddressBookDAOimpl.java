package com.banchan.addressbook.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class AddressBookDAOimpl implements AddressBookDAO{

	@Autowired
	SqlSession sqlSession;
	
	public AddressBookDAOimpl() {
		log.info("AddressBookDAOimpl()....");
	}
	
	@Override
	public List<AddressBookVO> selectAll(AddressBookVO vo) {
		log.info("AddressBook_selectAll().....vo: {}", vo);
		return sqlSession.selectList("AB_SELECT_ALL", vo);
	}


	@Override
	public int insert(AddressBookVO vo) {
		log.info("AddressBook_insert().....vo: {}", vo);
		return sqlSession.insert("AB_INSERT", vo);
	}

	@Override
	public int update(AddressBookVO vo) { //기본배송을 여기로 할지 생각중 참고한곳에선 수정이 없음
		log.info("AddressBook_update().....vo: {}", vo);
		return sqlSession.update("AB_UPDATE", vo);
	}

	@Override
	public int delete(AddressBookVO vo) {
		log.info("delete()...{}", vo);
		return sqlSession.delete("AB_DELETE", vo);
	}

}
