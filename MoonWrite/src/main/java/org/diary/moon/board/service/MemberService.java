package org.diary.moon.board.service;

import org.diary.moon.board.mapper.MemberMapper;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	MemberMapper mapper;

	public MemberService(MemberMapper mapper) {
		this.mapper = mapper;
	}
	
	
}
