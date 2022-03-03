package org.diary.moon.board.service;

import org.diary.moon.board.mapper.BoardMapper;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	BoardMapper mapper;

	public BoardService(BoardMapper mapper) {
		super();
		this.mapper = mapper;
	}
	
}
