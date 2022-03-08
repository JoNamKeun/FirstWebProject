package org.diary.moon.board.service;

import java.util.List;
import java.util.Map;

import org.diary.moon.board.mapper.MemberMapper;
import org.diary.moon.dto.MemberDTO;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	MemberMapper mapper;

	public MemberService(MemberMapper mapper) {
		this.mapper = mapper;
	}

	public List<MemberDTO> selectOne() {
		return mapper.selectOne();
	}

	public MemberDTO login(Map<String, String> map) {
		return mapper.login(map);
	}
	
	
}
