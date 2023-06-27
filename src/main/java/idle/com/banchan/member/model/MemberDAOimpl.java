package idle.com.banchan.member.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class MemberDAOimpl implements MemberDAO {

	@Autowired
	SqlSession sqlSession;

	public MemberDAOimpl() {
		log.info("MemberDAOimpl().....");
	}

	@Override
	public List<MemberVO> selectAll() {
		log.info("Member_selectAll().....");

		return sqlSession.selectList("M_SELECT_ALL");
	}

	@Override
	public List<MemberVO> searchList(String searchKey, String searchWord) {
		log.info("Member_searchList()...searchKey:{}", searchKey);
		log.info("Member_searchList()...searchWord:{}", searchWord);

		String key = "";
		if (searchKey.equals("name")) {
			key = "M_SEARCH_LIST_NAME";
//		}else {
//			key = "M_SEARCH_LIST_TEL";
		}

		return sqlSession.selectList(key, "%" + searchWord + "%");
	}

	@Override
	public MemberVO selectOne(MemberVO vo) {
		log.info("Member_selectOne()...{}", vo);

		return sqlSession.selectOne("M_SELECT_ONE", vo);
	}

	@Override
	public int insert(MemberVO vo) {
		log.info("Member_insert()...{}", vo);
		return sqlSession.insert("M_INSERT", vo);
	}

	@Override
	public int update(MemberVO vo) {
		log.info("Member_update()...{}", vo);
		return sqlSession.update("M_UPDATE", vo);
	}

	@Override
	public int delete(MemberVO vo) {
		log.info("delete()...{}", vo);

		return sqlSession.delete("M_DELETE", vo);
	}

	@Override
	public MemberVO login(MemberVO vo) {
		log.info("Member_login()...{}", vo);
		return sqlSession.selectOne("LOGIN", vo);
	}

	@Override
	public MemberVO idCheck(MemberVO vo) {
		log.info("Member_idCheck()...{}", vo);
		return sqlSession.selectOne("M_ID_CHECK", vo);
	}

}
