package com.banchan.member.model;

import java.util.List;


public interface MemberDAO {
	
	List<MemberVO> selectAll(Paging paging);
	
	MemberVO selectOne(MemberVO vo);

	MemberVO sns_selectOne(MemberVO vo);
	
	int insert(MemberVO vo);
	
	int sns_insert(MemberVO vo);

	int update(MemberVO vo, String check);
	
	int delete(MemberVO vo);
	
	int user_delete(MemberVO vo);

	MemberVO login(MemberVO vo);
	
	int admin_check(MemberVO vo);

	MemberVO idCheck(MemberVO vo);
	
	int findPwCheck(MemberVO vo);
	
	int findPw(String member_pw, String member_email, String member_id);
	
	//총 게시글 개수 확인
	public int getMemberListCnt() throws Exception;

	public int getListCnt(String searchKey, String searchWord) throws Exception;
	
	List<MemberVO> selectList(Paging paging);
}
