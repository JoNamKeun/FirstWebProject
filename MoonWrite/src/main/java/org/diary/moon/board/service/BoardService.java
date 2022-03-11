package org.diary.moon.board.service;

import java.util.List;
import java.util.Map;

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

	public BoardDTO selectBoard(int bno) {
		return mapper.selectBoard(bno);
	}

	public int selectBoardLikeCount(int bno) {
		return mapper.selectBoardLikeCount(bno);
	}

	public int selectUserLikeTrue(Map<String, Object> map) {
		return mapper.selectUserLikeTrue(map);
	}

	public int insertBoardLike(Map<String, Object> map) {
		return mapper.insertBoardLike(map);
	}

	public void deleteBoardLike(Map<String, Object> map) {
		mapper.deleteBoardLike(map);
	}

	public void insertBoard(BoardDTO boardDTO) {
		mapper.insertBoard(boardDTO);
	}

	public void addCount(int bno) {
		mapper.addCount(bno);
	}

	public void updateBoard(BoardDTO boardDTO) {
		mapper.updateBoard(boardDTO);
	}

	public void deleteBoard(int bno) {
		mapper.deleteBoard(bno);
	}

	public int selectBoardCount() {
		return mapper.selectBoardCount();
	}

	public List<BoardDTO> selectPageBoard(int pageNo) {
		return mapper.selectPageBoard(pageNo);
	}

	public int selectKindBoardCount(String kind) {
		return selectKindBoardCount(kind);
	}

	public List<BoardDTO> selectKind(Map<String, Object> map) {
		return selectKind(map);
	}

	
}
