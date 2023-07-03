package idle.com.banchan.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public int findPwCheck(MemberVO vo) {
		log.info("findPwCheck()...{}", vo);
		return sqlSession.selectOne("FIND_PW_CHECK", vo);
	}
//
	@Override
	public int findPw(String member_pw, String member_email, String member_id) {
		log.info("findPw()..." + "pw:"+member_pw +"email:" + member_email+"id:"+member_id);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("member_email", member_email);
		map.put("member_id", member_id);
		map.put("member_pw", member_pw);
		return sqlSession.update("FIND_PW", map);
	}

}
