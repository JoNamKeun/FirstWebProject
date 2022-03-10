package org.diary.moon.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.diary.moon.dto.CommentDTO;

@Mapper
public interface CommentMapper {

	List<CommentDTO> selectCommentList(String b_writer);

	List<CommentDTO> selectAllCommentList(int bno);

	int addComment(CommentDTO commentDTO);

	List<CommentDTO> selectComment(int c_bno);

}
