package com.banchan.member.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.banchan.member.model.MemberVO;
import com.banchan.member.model.Paging;
import com.banchan.member.service.MemberService;
import com.banchan.sns.SNSLogin;
import com.banchan.sns.SnsValue;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	@Autowired
	HttpSession session;

	@Autowired
	MemberService service;

	@Autowired
	ServletContext sContext;

	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

	@Autowired
	private SnsValue naverSns;

	@Autowired
	private SnsValue googleSns;

	@Autowired
	private SnsValue kakaoSns;
	
	@RequestMapping(value = { "/m_selectAll.do", "/m_searchList.do" }, method = RequestMethod.GET)
	public String m_selectAll(Model model, @RequestParam(required = false, defaultValue = "1") int page,
	        @RequestParam(required = false, defaultValue = "1") int range,
	        @RequestParam(required = false, defaultValue = "name") String searchKey,
	        @RequestParam(required = false) String searchWord) throws Exception {
	    log.info("/m_selectAll.do.....");
	    log.info("/m_searchList.do...searchKey:{}", searchKey);
	    log.info("/m_searchList.do...searchWord:{}", searchWord);
	    log.info("page:{}  range:{}", page, range);

	    Paging pagination = new Paging();
	    pagination.setSearchKey(searchKey);
	    if (searchWord != null && !searchWord.isEmpty()) {
	        String wordCheck = searchWord.replaceAll("%", ""); // % 기호 제거
	        pagination.setSearchWord("%" + wordCheck + "%");
	        log.info("/m_searchList.do  wordCheck:{}", wordCheck);
	        int listCnt = service.getListCnt(searchKey, pagination.getSearchWord());
	        log.info("searchlist listCnt: {}", listCnt);
	        pagination.pageInfo(page, range, listCnt);

	        List<MemberVO> vos = service.searchList(pagination);
	        log.info("vos:{}", vos);
	        model.addAttribute("pagination", pagination);
	        model.addAttribute("vos", vos);
	    } else {
	        int listCnt = service.getMemberListCnt();
	        log.info("selectAll listCnt:{}", listCnt);
	        pagination.pageInfo(page, range, listCnt);
	        log.info("paging pageCnt {}", pagination.getPageCnt());
	        List<MemberVO> vos = service.selectAll(pagination);
	        log.info("vos:{}", vos);
	        model.addAttribute("pagination", pagination);
	        model.addAttribute("vos", vos);
	    }

	    return ".admin/member/selectAll";
	}


	@RequestMapping(value = "/m_selectOne.do", method = RequestMethod.GET)
	public String m_selectOne(MemberVO vo, Model model) {
		log.info("/m_selectOne.do...{}", vo);

		MemberVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);

		return ".member/selectOne";
	}

	@RequestMapping(value = "/m_update.do", method = RequestMethod.GET)
	public String m_update(MemberVO vo, Model model) {
		log.info("/m_update.do...{}", vo);

		MemberVO vo2 = service.selectOne(vo);

		model.addAttribute("vo2", vo2);

		return ".member/update";
	}

	@RequestMapping(value = "/m_updateOK.do", method = RequestMethod.POST)
	public String m_updateOK(MemberVO vo, String check) throws IllegalStateException, IOException {
		log.info("/m_updateOK.do...{}", vo);
		log.info("/m_updateOK.do...check" + check);

		String getOriginalFilename = vo.getFile().getOriginalFilename();
		int fileNameLength = vo.getFile().getOriginalFilename().length();
		log.info("getOriginalFilename:{}", getOriginalFilename);
		log.info("fileNameLength:{}", fileNameLength);

		if (getOriginalFilename.length() != 0) {

			vo.setMember_profile(getOriginalFilename);
			// 웹 어플리케이션이 갖는 실제 경로: 이미지를 업로드할 대상 경로를 찾아서 파일저장.
			String realPath = sContext.getRealPath("resources/uploadimg");
			log.info("realPath : {}", realPath);

			File f = new File(realPath + "\\" + vo.getMember_profile());
			vo.getFile().transferTo(f);

			//// create thumbnail image/////////
			BufferedImage original_buffer_img = ImageIO.read(f);
			BufferedImage thumb_buffer_img = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = thumb_buffer_img.createGraphics();
			graphic.drawImage(original_buffer_img, 0, 0, 50, 50, null);

			File thumb_file = new File(realPath + "/thumb_" + vo.getMember_profile());
			String formatName = vo.getMember_profile().substring(vo.getMember_profile().lastIndexOf(".") + 1);
			log.info("formatName : {}", formatName);
			ImageIO.write(thumb_buffer_img, formatName, thumb_file);

		} // end else
		log.info("Member_updateOK..vo:{}", vo);

		int result = service.update(vo, check);
		
		log.info("Member_updateOK result:{}", result);
		if (result == 1 && check.equals("user_update")) {
			return "redirect:m_user_udpate.do";
		} else if(result == 1 && check.equals("admin_update")) {
			return "redirect:m_selectOne.do?num=" + vo.getNum();
		} else {
			return "redirect:.home";
		}
	}

	@RequestMapping(value = "/m_insert.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String m_insert(Model model, HttpSession session) {
		log.info("/m_insert.do.....");

		// naver 코드 발급받는 url
		SNSLogin snsLogin = new SNSLogin(naverSns);
		log.info("네이버: {}", snsLogin.getSNSAuthURL());

		model.addAttribute("naver_url", snsLogin.getSNSAuthURL());

		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		log.info("구글:" + url);

		model.addAttribute("google_url", url); // google_url에 로그인 url 넣음

		// 카카오 code url
		SNSLogin kakao = new SNSLogin(kakaoSns);
		log.info("kakao: {}", kakao.getSNSAuthURL());
		model.addAttribute("kakao_url", kakao.getSNSAuthURL());

		return "member/insert";
	}

	@RequestMapping(value = "/m_insertOK.do", method = RequestMethod.POST)
	public String m_insertOK(MemberVO vo) throws IllegalStateException, IOException {
		log.info("/m_insertOK.do...{}", vo);

		String getOriginalFilename = vo.getFile().getOriginalFilename();
		int fileNameLength = vo.getFile().getOriginalFilename().length();
		log.info("getOriginalFilename:{}", getOriginalFilename);
		log.info("fileNameLength:{}", fileNameLength);

		if (getOriginalFilename.length() == 0) {
			vo.setMember_profile("default.png");
		} else {
			vo.setMember_profile(getOriginalFilename);
			// 웹 어플리케이션이 갖는 실제 경로: 이미지를 업로드할 대상 경로를 찾아서 파일저장.
			String realPath = sContext.getRealPath("resources/uploadimg");
			log.info("realPath : {}", realPath);

			File f = new File(realPath + "\\" + vo.getMember_profile());
			vo.getFile().transferTo(f);

			//// create thumbnail image/////////
			BufferedImage original_buffer_img = ImageIO.read(f);
			BufferedImage thumb_buffer_img = new BufferedImage(50, 50, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = thumb_buffer_img.createGraphics();
			graphic.drawImage(original_buffer_img, 0, 0, 50, 50, null);

			File thumb_file = new File(realPath + "/thumb_" + vo.getMember_profile());
			String formatName = vo.getMember_profile().substring(vo.getMember_profile().lastIndexOf(".") + 1);
			log.info("formatName : {}", formatName);
			ImageIO.write(thumb_buffer_img, formatName, thumb_file);

		} // end else
		log.info("Member_insertOK..vo:{}", vo);

		int result = service.insert(vo);

		log.info("Member_insertOK result", result);
		if (result == 1) {
			return "redirect:m_selectAll.do";
		} else {
			return "redirect:m_insert.do";
		}
	}

	@RequestMapping(value = "/m_deleteOK.do", method = RequestMethod.GET)
	public String m_deleteOK(MemberVO vo) {
		log.info("/m_deleteOK.do");

		int result = service.delete(vo);

		if (result == 1) {
			return "redirect:m_selectAll.do";
		} else {
			return "redirect:m_selectOne.do?num=" + vo.getNum();
		}

	}

	@RequestMapping(value = "/findPwView.do", method = RequestMethod.GET)
	public String findPwView() {
		log.info("findPwView.do....");

		return "findPw/findPwView";
	}

	@RequestMapping(value = "/findPw.do", method = RequestMethod.POST)
	public String findPw(MemberVO vo, Model model) {
		log.info("findPw.do....vo:{}", vo);

		if (service.findPwCheck(vo) == 0) { // 아이디 이메일 일치하지 않는경우
			log.info("Member FindPWCheck");
			model.addAttribute("msg", "아이디와 이메일를 확인해주세요");

			return "findPw/findPwView";
		} else { // 아이디 이메일 일치하는 않는경우
			service.findPw(vo.getMember_email(), vo.getMember_id());
			model.addAttribute("member_email", vo.getMember_email());
			return "findPw/findPwResult";
		}
	}

//	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
//	public String login(String message,Model model) {
//		log.info("/login.do....{}",message);
//		
//		return "member/login";
//	}
//	
	@RequestMapping(value = "/loginOK.do", method = RequestMethod.POST)
	public String loginOK(MemberVO vo) {
		log.info("/loginOK.do...{}", vo);

		int result = service.admin_check(vo);
		log.info("admin_check result...{}", result);

		if (result == 0) {
			MemberVO vo2 = service.login(vo);
			log.info("Member login vo2...{}", vo2);

			if (vo2 == null) {
				return "redirect:SNS_Login.do?message=fail"; // 아이디 비번 다르면 메세지에 실패 넣음
			} else if (vo2.getMember_useryn() != null) {
				 Timestamp timestamp = vo2.getMember_useryn();
				 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				 String dateString = sdf.format(timestamp);
				 log.info("변환된 useryn() String:" + dateString);
				return "redirect:SNS_Login.do?message=" + dateString;
			}
			else {
				session.setAttribute("user_id", vo2.getMember_id());
				session.setAttribute("sns_check", 0);
				session.setAttribute("user_num", vo2.getNum());
				return "redirect:.home";
			} //user login check
		} 
		else {
			log.info("관리자 계정으로 로그인헀습니다.");
			session.setAttribute("user_id", vo.getMember_id());
			session.setAttribute("isAdmin", true);
			return "redirect:adminpage.do";
		}//admin check

	}// end loginOK

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout() {
		log.info("/logout.do");

		session.invalidate(); // 로그인 세션 제거

		return "redirect:.home";
	}

	@RequestMapping(value = "/m_user_udpate.do", method = RequestMethod.GET)
	public String m_user_udpate() {
		log.info("/m_user_udpate.do");

		return ".my/member/user_update";
	}
	
	
	

}// end class
