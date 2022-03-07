package org.diary.moon.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.diary.moon.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	List<MemberDTO> selectOne();

}
