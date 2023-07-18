package com.banchan.answer.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AnswerVO {
	private int anum;
	private int qnum;
	private String content;
	private String writer;
	private Timestamp wdate;
}
