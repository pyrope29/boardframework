package com.bit.board.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.board.dao.MemberDao;
import com.bit.member.model.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private SqlSession sqlSession; 

	@Override
	public int insertMember(MemberDto memberDto) {
		return sqlSession.getMapper(MemberDao.class).insertMember(memberDto);
	}

	@Override
	public int updateMember(MemberDto memberDto) {
		return sqlSession.getMapper(MemberDao.class).updateMember(memberDto);
	}

	@Override
	public MemberDto selectMember(String id) {
		return sqlSession.getMapper(MemberDao.class).selectMember(id);
	}

	@Override
	public List<MemberDto> selectAllMember() {
		return sqlSession.getMapper(MemberDao.class).selectAllMember();
	}

	@Override
	public int deleteMember(String id) {
		return sqlSession.getMapper(MemberDao.class).deleteMember(id);
	}

}
