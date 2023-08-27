package xyz.dreams.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.mapper.MypageMapper;

@Repository
@RequiredArgsConstructor
public class MypageDAOImpl implements MypageDAO{
	private final SqlSession sqlSession;
	
	@Override
	public int updateMember(MemberDTO member) {
		return sqlSession.getMapper(MypageMapper.class).updateMember(member);
	}
}
