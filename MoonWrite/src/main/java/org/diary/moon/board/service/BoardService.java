package org.diary.moon.board.service;

import java.util.List;

import org.diary.moon.board.mapper.BoardMapper;
import org.diary.moon.dto.BoardDTO;
import org.diary.moon.dto.CommentDTO;
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

	public int selectAllCount(String b_writer) {
		return mapper.selectAllCount(b_writer);
	}

	public List<BoardDTO> selectList(String b_writer) {
		return mapper.selectList(b_writer);
	}

	
}
