package org.diary.moon.board.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.diary.moon.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	List<MemberDTO> selectOne();

	MemberDTO login(Map<String, String> map);

}
