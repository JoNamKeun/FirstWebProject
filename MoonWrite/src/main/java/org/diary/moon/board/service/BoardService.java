package org.diary.moon.board.service;

import java.util.List;

import org.diary.moon.board.mapper.BoardMapper;
import org.diary.moon.dto.BoardDTO;
import org.springframework.stereotype.Service;

@Service
public class BoardService {
	BoardMapper mapper;

	public BoardService(BoardMapper mapper) {
		this.mapper = mapper;
	}

	public List<BoardDTO> selectBoardList(int page) {
		System.out.println(page);
		return mapper.selectBoardList(page);
	}

	public int selectAllCount() {
		return mapper.selectAllCount();
	}
	
}
