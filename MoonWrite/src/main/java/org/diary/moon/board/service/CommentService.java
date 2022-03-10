package org.diary.moon.board.service;

import java.util.List;

import org.diary.moon.board.mapper.CommentMapper;
import org.diary.moon.dto.CommentDTO;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
	CommentMapper mapper;

	public CommentService(CommentMapper mapper) {
		this.mapper = mapper;
	}

	public List<CommentDTO> selectCommentList(String b_writer) {
		return mapper.selectCommentList(b_writer);
	}

	public List<CommentDTO> selectAllCommentList(int bno) {
		return mapper.selectAllCommentList(bno);
	}

	public int addComment(CommentDTO commentDTO) {
		return mapper.addComment(commentDTO);
	}

	public List<CommentDTO> selectComment(int c_bno) {
		return mapper.selectComment(c_bno);
	}

	
	
}
