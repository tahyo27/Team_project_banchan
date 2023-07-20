package com.banchan.member.model;

import java.sql.Timestamp;

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
	private Timestamp member_useryn;
	private Timestamp member_regdate;
	private String member_profile;
	private MultipartFile file;
	
	
}
