package org.diary.moon.dto;

import org.apache.ibatis.type.Alias;


@Alias("board")
public class BoardDTO {
	
	private int bno;
	private String title;
	private String content;
	private String b_kind;
	private String b_secret;
	private String book_name;
	private String regist_day;
	private int b_count;
	private String b_writer;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getB_kind() {
		return b_kind;
	}
	public void setB_kind(String b_kind) {
		this.b_kind = b_kind;
	}
	public String getB_secret() {
		return b_secret;
	}
	public void setB_secret(String b_secret) {
		this.b_secret = b_secret;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public String getRegist_day() {
		return regist_day;
	}
	public void setRegist_day(String regist_day) {
		this.regist_day = regist_day;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public BoardDTO(String title, String content, String b_kind, String b_secret, String book_name, String b_writer) {
		super();
		this.title = title;
		this.content = content;
		this.b_kind = b_kind;
		this.b_secret = b_secret;
		this.book_name = book_name;
		this.b_writer = b_writer;
	}
	
	
	
	
	
	
}
