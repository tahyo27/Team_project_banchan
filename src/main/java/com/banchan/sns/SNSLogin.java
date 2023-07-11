package com.banchan.sns;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.banchan.member.model.MemberVO;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SNSLogin {

	private OAuth20Service oauthService;
	private SnsValue sns;

	public SNSLogin(SnsValue sns) {

		if (sns.getApi20Instance().getClass().getName().equals("com.banchan.sns.KakaoAPI20")) {
			this.oauthService = new ServiceBuilder(sns.getClientId()).apiSecret(sns.getClientSecret())
					.scope("profile_nickname").callback(sns.getRedirectUrl())
					// 카카오 로그인인 경우에만 스코프를 제거
					.build(sns.getApi20Instance());
		} else {
			this.oauthService = new ServiceBuilder(sns.getClientId()).apiSecret(sns.getClientSecret())
					.callback(sns.getRedirectUrl()).scope("profile").build(sns.getApi20Instance());
		}

		this.sns = sns;
	}// end SNSLogin

	public String getSNSAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
	
//구글, 네이버 프로필 겸 엑세스 토큰 함수
	public MemberVO getUserProfie(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		Response response = oauthService.execute(request);
		return parseJson(response.getBody());
	}
	
//카카오는 scribe로 엑세스 토큰 받아오는거 에러나서 따로 엑세스 토큰 받음
	public String getkakaoAccessToken(String code) throws Exception {
		log.info("kakao호출");
		 try {
	            String baseUrl = KakaoAPI20.KAKAO_ACCESS_TOKEN;
	            String grantType = "authorization_code";
	            String clientId = sns.getClientId();
	            String redirectUri = sns.getRedirectUrl();
	            String clientSecret = sns.getClientSecret();
	            
	            String urlParameters = String.format("grant_type=%s&client_id=%s&redirect_uri=%s&code=%s&client_secret=%s",
	                    URLEncoder.encode(grantType, "UTF-8"),
	                    URLEncoder.encode(clientId, "UTF-8"),
	                    URLEncoder.encode(redirectUri, "UTF-8"),
	                    URLEncoder.encode(code, "UTF-8"),
	                    URLEncoder.encode(clientSecret, "UTF-8"));
	            
	            URL url = new URL(baseUrl + "?" + urlParameters);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("POST");
	            
	            int responseCode = conn.getResponseCode();
	            
	            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line;
	            StringBuilder response = new StringBuilder();
	            while ((line = reader.readLine()) != null) {
	                response.append(line);
	            }
	            reader.close();
	            
	            log.info("Response code: " + responseCode);
	            log.info("Response body: " + response.toString());
	            
	            return parseAccessToken(response.toString());
	        } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	        }
	}
	
// 받아온 정보에서 엑세스 토큰 파싱 함수
	private String parseAccessToken(String response) {
		JSONParser parser = new JSONParser();
        try {
            JSONObject jsonObject = (JSONObject) parser.parse(response);
            return (String) jsonObject.get("access_token");
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
	}//end parseAccessToken

// 카카오 유저정보 얻어오는 함수
	public MemberVO getKakaoUserProfile(String accessToken) throws Exception {
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		Response response = oauthService.execute(request);
		return parseJson(response.getBody());
	}

//얻어온 유저정보 파싱 후 memberVO 반환 함수
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
		} else if (this.sns.isKakao()) {
			id = String.valueOf(jsonObject.get("id"));
			JSONObject kakaoproperties = (JSONObject) jsonObject.get("properties");
			name = (String) kakaoproperties.get("nickname");
			JSONObject kakaoAccount = (JSONObject) jsonObject.get("kakao_account");
			email = (String) kakaoAccount.get("email");
			log.info("parse kakao_id:" + id);
			log.info("parse kakao_name:" + name);
			log.info("parse kakao_email:" + email);
			vo.setMember_id(id);
			vo.setMember_pw(id);
			vo.setMember_name(name);
			vo.setMember_email(email);
			
		}

		return vo;
	}

}// end class
