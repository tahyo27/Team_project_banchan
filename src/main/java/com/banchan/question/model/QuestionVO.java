package com.banchan.question.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QuestionVO {

	private int qnum; 
	private String title; //글제목
	private String content; //글내용
	private String writer; //작성자
	private Timestamp wdate; //작성날짜
	private int vcount; //조회수
	
}
