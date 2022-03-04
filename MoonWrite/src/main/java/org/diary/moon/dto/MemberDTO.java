package org.diary.moon.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Alias("member")
public class MemberDTO {
	private String m_id;
	private String m_pw;
	private String email;
	private String m_name;
	private String m_level;
}
