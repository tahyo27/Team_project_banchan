package com.banchan.member.model;

import java.util.List;


public interface MemberDAO {
	
	List<MemberVO> selectAll();

	List<MemberVO> searchList(String searchKey, String searchWord);
	
	MemberVO selectOne(MemberVO vo);

	int insert(MemberVO vo);
	
	int sns_insert(MemberVO vo);

	int update(MemberVO vo);

	int delete(MemberVO vo);

	MemberVO login(MemberVO vo);
	
	int admin_check(MemberVO vo);

	MemberVO idCheck(MemberVO vo);
	
	int findPwCheck(MemberVO vo);
	
	int findPw(String member_pw, String member_email, String member_id);
}
