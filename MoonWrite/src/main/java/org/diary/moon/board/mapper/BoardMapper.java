package org.diary.moon.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.diary.moon.dto.BoardDTO;

@Mapper
public interface BoardMapper {

	List<BoardDTO> selectBoardList(int page);

	int selectAllCount();

}
