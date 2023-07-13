package com.banchan.sns;

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
import com.banchan.member.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SNSLoginController {

	/* GoogleLogin */
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

	@Autowired
	MemberService service;

	@Autowired
	HttpSession session;

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/SNS_Login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String SNS_login(String message, Model model, HttpSession session) {
		
		//아이디/비밀번호 로그인시 실패하면 뜨는 메세지
		if(message!=null) message = "아이디/비밀번호를 확인하세요";
		model.addAttribute("msg", message);

		// naver 코드 발급받는 url
		SNSLogin snsLogin = new SNSLogin(naverSns);
		log.info("네이버: {}",snsLogin.getSNSAuthURL());

		model.addAttribute("naver_url", snsLogin.getSNSAuthURL());

		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		log.info("구글:" + url);

		model.addAttribute("google_url", url); // google_url에 로그인 url 넣음
		
		//카카오 code url
		SNSLogin kakao = new SNSLogin(kakaoSns);
		log.info("kakao: {}",kakao.getSNSAuthURL());
		model.addAttribute("kakao_url", kakao.getSNSAuthURL());

		return "SNS/login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/naver_callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String NaverCallback(Model model, @RequestParam String code, HttpSession session) throws Exception {
		log.info("Naver 로그인 callback");
		log.info("받은 code:" + code);
		SNSLogin snsLogin = new SNSLogin(naverSns);
		MemberVO vo = snsLogin.getUserProfie(code);

		log.info("naver profile:" + vo);

		MemberVO vo2 = service.login(vo);
		
		if (vo2 == null) {
			log.info("naver로그인 회원가입 안되어있음");
			int result = service.sns_insert(vo);
			log.info("naverSNS 회원가입 result:{}", result);
			if (result == 1) {
				session.setAttribute("user_id", vo.getMember_name());
			} else {
				return "redirect:SNS_Login.do";
			}
		} else {
			log.info("naver로그인 회원가입 되어있음");
			session.setAttribute("user_id", vo.getMember_name());
		}
		return "SNS/NaverSuccess";
	}

	// 구글 Callback호출 메소드
	@RequestMapping(value = "/google_callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(Model model, @RequestParam String code) throws Exception {
		// 1.code를 이용해 access token 받기
		// 2.access token으로 사용자 정보 받기
		// 3.db에 해당 이용자 존재하는지 체크
		// 4.존재하면 로그인 아니면 가입
		log.info("googleCallback 호출");
		log.info("받은 code:" + code);
		SNSLogin snsLogin = new SNSLogin(googleSns);
		MemberVO vo = snsLogin.getUserProfie(code);
		log.info("google profile:" + vo);

		MemberVO vo2 = service.login(vo);

		if (vo2 == null) {
			log.info("google로그인 회원가입 안되어있음");
			int result = service.sns_insert(vo);
			log.info("googleSNS 회원가입 result:{}", result);
			if (result == 1) {
				session.setAttribute("user_id", vo.getMember_name());
			} else {
				return "redirect:SNS_Login.do";
			}
		} else {
			log.info("google로그인 회원가입 되어있음");
			session.setAttribute("user_id", vo.getMember_name());
		}

//		model.addAttribute("result", vo);

		return "SNS/GoogleSuccess";

	}
	@RequestMapping(value = "/kakao_callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String KakaoCallback(Model model, @RequestParam String code, HttpSession session) throws Exception {
		log.info("KakaoCallback 호출");
		log.info("받은 code:" + code);
		SNSLogin snsLogin = new SNSLogin(kakaoSns);
//		String act = snsLogin.getkakaoProfie(code);
		String act = snsLogin.getkakaoAccessToken(code);
		log.info("kakao 엑세스토큰:" + act);
		MemberVO vo = snsLogin.getKakaoUserProfile(act);
		log.info("kakao profile:{}", vo);
		
		MemberVO vo2 = service.login(vo);
		
		if (vo2 == null) {
			log.info("kakao로그인 회원가입 안되어있음");
			int result = service.sns_insert(vo);
			log.info("kakaoSNS 회원가입 result:{}", result);
			if (result == 1) {
				session.setAttribute("user_id", vo.getMember_name());
			} else {
				return "redirect:SNS_Login.do";
			}
		} else {
			log.info("kakao로그인 회원가입 되어있음");
			session.setAttribute("user_id", vo.getMember_name());
		}
		
		return "SNS/KakaoSuccess";
	}

}// end class
