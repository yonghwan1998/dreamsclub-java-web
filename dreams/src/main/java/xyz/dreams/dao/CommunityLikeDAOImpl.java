package xyz.dreams.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CommunityLikeDTO;
import xyz.dreams.mapper.CommunityLikeMapper;

@Repository
@RequiredArgsConstructor
public class CommunityLikeDAOImpl implements CommunityLikeDAO{
	private final SqlSession sqlSession;
	
	@Override
	public int likeCheck(CommunityLikeDTO like) {
		return sqlSession.getMapper(CommunityLikeMapper.class).likeCheck(like);
	}

	@Override
	public int likeCheck_cancle(CommunityLikeDTO like) {
		return sqlSession.getMapper(CommunityLikeMapper.class).likeCheck_cancle(like);

	}

}
