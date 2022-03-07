package org.diary.moon.board.service;

import java.util.List;

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
	
	
}
