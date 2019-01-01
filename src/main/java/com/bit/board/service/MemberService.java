package com.bit.board.service;

import java.util.List;

import com.bit.member.model.MemberDto;

public interface MemberService {
	
	int insertMember(MemberDto memberDto);

	int updateMember(MemberDto memberDto);
	
	int deleteMember(String id);

	MemberDto selectMemberById(String id);

	List<MemberDto> selectAllMember();

}
