package idle.com.banchan.sns;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.JsonObject;

import idle.com.banchan.member.model.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SNSLogin {

	private OAuth20Service oauthService;
	private SnsValue sns;

	public SNSLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId()).apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl()).scope("profile").build(sns.getApi20Instance());

		this.sns = sns;
	}

	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}

	public MemberVO getUserProfie(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);

		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		Response response = oauthService.execute(request);
		return parseJson(response.getBody());
	}

	private MemberVO parseJson(String body) throws Exception {
		log.info("=============================\n" + body + "==========================\n");
		MemberVO vo = new MemberVO();

		String id = "";
		String name = "";
		String email = "";
		JSONParser parser = new JSONParser();
		JSONObject jsonObject = (JSONObject) parser.parse(body);
		

		if (this.sns.isGoogle()) {
			id = (String) jsonObject.get("id");
			name = (String) jsonObject.get("name");
			email = (String) jsonObject.get("email");
			log.info("parse google_id:" + id);
			log.info("parse google_name:" + name);
			log.info("parse google_email:" + email);
			vo.setMember_id(id);
			vo.setMember_pw(id);
			vo.setMember_name(name);
			vo.setMember_email(email);

		} else if (this.sns.isNaver()) {
			JSONObject response = (JSONObject) jsonObject.get("response");
			id = (String) response.get("id");
			name = (String) response.get("name");
			email = (String) response.get("email");
			log.info("parse naver_id:" + id);
			log.info("parse naver_name:" + name);
			log.info("parse naver_email:" + email);
			
			vo.setMember_id(id);
			vo.setMember_pw(id);
			vo.setMember_name(name);
			vo.setMember_email(email);
		}
			
		return vo;
	}

}// end class
