package com.banchan.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.banchan.MailSend.MailSendService;
import com.banchan.member.model.MemberDAO;
import com.banchan.member.model.MemberVO;
import com.banchan.member.model.Paging;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberService {

	@Autowired
	private MailSendService mailService;
	
	@Autowired
	MemberDAO dao;

	public MemberService() {
		log.info("MemberService()...");
	}

	public List<MemberVO> selectAll(Paging paging) {
		return dao.selectAll(paging);
	}

	public MemberVO selectOne(MemberVO vo) {
		return dao.selectOne(vo);
	}

	public int insert(MemberVO vo) {
		return dao.insert(vo);
	}

	public int update(MemberVO vo) {
		return dao.update(vo);
	}

	public int delete(MemberVO vo) {
		return dao.delete(vo);
	}

	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}
	
	public int admin_check(MemberVO vo) {
		return dao.admin_check(vo);
	}

	public MemberVO idCheck(MemberVO vo) {
		return dao.idCheck(vo);
	}

	public int findPwCheck(MemberVO vo) {
		return dao.findPwCheck(vo);
	}

	public int findPw(String member_email, String member_id) {
		log.info("member_email:" + member_email + "member_id:" + member_id);
		String member_pw = mailService.makeRandomPw();
		log.info("member_pw:" + member_pw);
		mailService.joinEmailPw(member_email, member_pw);
		
		return dao.findPw(member_pw, member_email, member_id);
	
	}
	
	public int sns_insert(MemberVO vo) {
		return dao.sns_insert(vo);
	}
	
	public int getMemberListCnt() throws Exception {
		return dao.getMemberListCnt();
	}

	public List<MemberVO> searchList(String searchKey, String searchWord) {
		return dao.selectList(searchKey, searchWord);
	}
}
