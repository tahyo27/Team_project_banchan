package idle.com.banchan.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import idle.com.banchan.member.model.MemberDAO;
import idle.com.banchan.member.model.MemberVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class MemberService {
	
	@Autowired
	MemberDAO dao;
	
	public MemberService() {
		log.info("MemberService()...");
	}
	public List<MemberVO> selectAll() {
		return dao.selectAll();
	}

	public List<MemberVO> searchList(String searchKey, String searchWord) {
		return dao.searchList(searchKey, searchWord);
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
	
	public MemberVO idCheck(MemberVO vo) {
		return dao.idCheck(vo);
	}

}
