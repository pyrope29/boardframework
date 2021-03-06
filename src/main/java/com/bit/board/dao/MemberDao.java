package com.bit.board.dao;

import java.util.List;

import com.bit.member.model.MemberDto;

public interface MemberDao {

	int insertMember(MemberDto memberDto);

	int updateMember(MemberDto memberDto);

	MemberDto selectMemberById(String id);

	List<MemberDto> selectAllMember();

	int deleteMember(String id);

}
