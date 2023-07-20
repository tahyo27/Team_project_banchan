package com.banchan.member.model;

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
	public List<MemberVO> selectAll(Paging paging) {
		log.info("Member_selectAll().....");

		return sqlSession.selectList("M_SELECT_ALL", paging);
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
	public int update(MemberVO vo, String check) {
		log.info("Member_update()...{}", vo);
		log.info("Member_update()...check:"+ check);
		if(check.equals("admin_update")) {
			return sqlSession.update("M_UPDATE", vo);
		}else if(check.equals("user_update")) {
			return sqlSession.update("M_USER_UPDATE", vo);
		} else {
			return 0;
		}
		
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
		log.info("findPw()..." + "pw:" + member_pw + "email:" + member_email + "id:" + member_id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_email", member_email);
		map.put("member_id", member_id);
		map.put("member_pw", member_pw);
		return sqlSession.update("FIND_PW", map);
	}

	@Override
	public int sns_insert(MemberVO vo) {
		log.info("Member_sns_insert()...{}", vo);
		return sqlSession.insert("SNS_INSERT", vo);
	}

	@Override
	public int admin_check(MemberVO vo) {
		log.info("admin_check()...vo:{}", vo);
		Map<String, Object> admin = new HashMap<String, Object>();
		admin.put("admin_id", vo.getMember_id());
		admin.put("admin_pw", vo.getMember_pw());
		return sqlSession.selectOne("ADMIN_CHECK", admin);
	}

	@Override
	public int getMemberListCnt() throws Exception {
		log.info("getMemberListCnt()...");
		return sqlSession.selectOne("getMemberListCnt");
	}

	@Override
	public List<MemberVO> selectList(Paging paging) {
		log.info("Member_searchList()...");

		String key = "";
		if (paging.getSearchKey().equals("name")) {
			key = "M_SEARCH_LIST_NAME";
		} else if (paging.getSearchKey().equals("email")) {
			key = "M_SEARCH_LIST_EMAIL";
		} else if (paging.getSearchKey().equals("address1")) {
			key = "M_SEARCH_LIST_ADDRESS1";
		}

		return sqlSession.selectList(key, paging);
	}

	@Override
	public int getListCnt(String searchKey, String searchWord) throws Exception {
		log.info("getListCnt...key:"+ searchKey  +"word:" + searchWord);
		String key="";
		if (searchKey.equals("name")) {
			key = "getListCntName";
		} else if (searchKey.equals("email")) {
			key = "getListCntEmail";
			log.info("getListCnt key:" + key);
		} else if (searchKey.equals("address1")) {
			key = "getListCntAddress1";
		}
		
		
		return sqlSession.selectOne(key, "%" + searchWord + "%");
	}

	@Override
	public int user_delete(MemberVO vo) {
		log.info("user_delete()...vo:{}", vo);
		return sqlSession.update("M_USER_DELETE", vo);
	}

}
