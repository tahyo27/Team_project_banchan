package idle.com.banchan.addressbook.model;

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
	public int update(AddressBookVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(AddressBookVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
