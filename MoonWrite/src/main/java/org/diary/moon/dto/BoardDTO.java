package org.diary.moon.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
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
	
	
}
