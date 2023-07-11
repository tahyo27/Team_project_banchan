package com.banchan.MailSend;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MailSendService {
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	private int authNumber;
	
//난수 발생
	public void makeRandomNumber() {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		log.info("인증번호 : " + checkNum);
		authNumber = checkNum;
	}
	public String makeRandomPw() { //8자리의 랜덤 
	    String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
	    StringBuilder sb = new StringBuilder();

	    Random random = new Random();
	    int length = 8; //비밀번호 자리수

	    for (int i = 0; i < length; i++) {
	        int index = random.nextInt(chars.length()); //chars에서 랜덤한 숫자 index 가져옴
	        char randomChar = chars.charAt(index); // 가져온 index의 문자를 randomChar에 넣음
	        sb.append(randomChar); // sb에 randomChar에 저장된 문자 추가
	    }
	    log.info("비밀번호 : " + sb.toString());
	    return sb.toString();
	}
	
	// 이메일 보내는 양식
	public String joinEmail(String email) { //인증번호 이메일
		makeRandomNumber();
		String setFrom = "testbanchan7@gmail.com"; // 자신의 이메일 주소를 입력
		String toMail = email;
		String title = "BANCHAN 회원 가입 인증 이메일 입니다."; // 보낼 이메일 제목
		String content = "홈페이지를 방문해주셔서 감사합니다." + // html 형식으로 작성 !
				"<br><br>" + "인증 번호는 " + authNumber + "입니다." + "<br>" + "해당 인증번호를 인증번호 확인란에 기입하여 주세요."; // 보낼 이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	
	public void joinEmailPw(String member_email, String member_pw) { // 비밀번호 찾기 이메일
		String setFrom = "testbanchan7@gmail.com"; // 자신의 이메일 주소를 입력
		String toMail = member_email;
		String title = "BANCHAN 비밀번호 찾기 메일입니다."; // 보낼 이메일 제목
		String content = // html 형식으로 작성 !
				"<br><br>" + "초기화된 비밀번호는 " + member_pw + "입니다." + "<br>" + "해당 비밀번호로 로그인후 비밀번호를 변경해주세요."; // 보낼 이메일 내용 삽입
		mailSend(setFrom, toMail, title, content);
	}
	
	

	// 이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		// true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
			helper.setText(content, true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}	

}//end class
