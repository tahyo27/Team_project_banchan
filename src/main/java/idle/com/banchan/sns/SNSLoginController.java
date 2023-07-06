package idle.com.banchan.sns;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonSyntaxException;

import idle.com.banchan.member.model.MemberVO;
import idle.com.banchan.member.service.MemberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SNSLoginController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	MemberService service;
	
	@Autowired
	HttpSession session;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		log.info("setNaverLoginBO()..... naverLoginBO:{}", naverLoginBO);
		this.naverLoginBO = naverLoginBO;
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/SNSlogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		log.info("네이버:" + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "SNS/login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		log.info("Naver 로그인 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		log.info("apiResult:{}", apiResult);

		MemberVO vo = new MemberVO();
		String member_id = null;
		String member_name = null;
		String member_email = null; // id로 사용할 apiResult에서 가져올 이메일

		try {
			// JSON 파싱을 위한 라이브러리를 사용하여 apiResult에서 email 값을 추출
			// Gson 라이브러리를 사용
			JsonObject jsonObject = new Gson().fromJson(apiResult, JsonObject.class);
			JsonObject response = jsonObject.getAsJsonObject("response");
			member_id = response.get("id").getAsString();
			member_name = response.get("name").getAsString();
			member_email = response.get("email").getAsString();
		} catch (JsonSyntaxException e) {
			e.printStackTrace();
		}
		vo.setMember_id(member_id);
		vo.setMember_pw(member_id);
		vo.setMember_name(member_name);
		vo.setMember_email(member_email);

		log.info("naver member vo:{}", vo);
		
		MemberVO vo2 = service.login(vo);
		
		if(vo2 == null) { //널이면 새로 DB에 저장
			int result = service.sns_insert(vo); //vo에 값을 넣어놓음
			log.info("sns insert result:", result);
		}
		
		session.setAttribute("user_id", member_email);

		model.addAttribute("result", apiResult);

		/* 네이버 로그인 성공 페이지 View 호출 */
		return "SNS/NaverSuccess";
	}

}// end class
