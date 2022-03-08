package org.diary.moon.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.diary.moon.dto.BoardDTO;

@Mapper
public interface BoardMapper {

	List<BoardDTO> selectBoardList(int page);

	int selectAllCount(String b_writer);

	List<BoardDTO> selectList(String b_writer);

	BoardDTO selectBoard(int bno);

	int selectBoardLikeCount(int bno);

	int selectUserLikeTrue(Map<String, Object> map);

	int insertBoardLike(Map<String, Object> map);

	void deleteBoardLike(Map<String, Object> map);

	void insertBoard(BoardDTO boardDTO);

}
