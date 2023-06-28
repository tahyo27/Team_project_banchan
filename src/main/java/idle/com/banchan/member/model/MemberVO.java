package idle.com.banchan.member.model;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberVO {
	
	private int num;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_email;
	private String member_zipcode;
	private String member_address1;
	private String member_address2;
	private String member_tel;
	private String member_nickname;
	private String member_profile;
	private MultipartFile file;
	
	
//	NUM
//	MEMBER_ID
//	MEMBER_PW
//	MEMBER_NAME
//	MEMBER_EMAIL
//	MEMBER_ZIPCODE
//	MEMBER_ADDRESS1
//	MEMBER_ADDRESS2
//	MEMBER_TEL
//	MEMBER_NICKNAME
//	MEMBER_PROFILE
}
