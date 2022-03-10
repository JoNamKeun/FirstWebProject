package org.diary.moon.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Alias("comment")
public class CommentDTO {
	private int cno;
	private int bno;
	private String c_writer;
	private String content;
	private String m_name;
	
	
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getC_writer() {
		return c_writer;
	}
	public void setC_writer(String c_writer) {
		this.c_writer = c_writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public CommentDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public CommentDTO(int cno, int bno, String c_writer, String content) {
		super();
		this.cno = cno;
		this.bno = bno;
		this.c_writer = c_writer;
		this.content = content;
	}
	
	
	@Override
	public String toString() {
		return "CommentDTO [cno=" + cno + ", bno=" + bno + ", c_writer=" + c_writer + ", content=" + content
				+ ", m_name=" + m_name + "]";
	}
	
	public CommentDTO(int bno, String c_writer, String content) {
		this.bno = bno;
		this.c_writer = c_writer;
		this.content = content;
	}
	
	public CommentDTO(int cno, int bno, String c_writer, String content, String m_name) {
		super();
		this.cno = cno;
		this.bno = bno;
		this.c_writer = c_writer;
		this.content = content;
		this.m_name = m_name;
	}
	
	
	
	
	
	
}
