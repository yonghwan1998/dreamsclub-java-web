package xyz.dreams.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.mapper.CommunityLikeMapper;

@Repository
@RequiredArgsConstructor
public class CommunityLikeDAOImpl implements CommunityLikeDAO{
	private final SqlSession sqlSession;

	@Override
	public int insert_like_save(Map<String, Object> map) {
		return sqlSession.getMapper(CommunityLikeMapper.class).insert_like_save(map);
	}

	@Override
	public int insert_like_up(Map<String, Object> map) {
		return sqlSession.getMapper(CommunityLikeMapper.class).insert_like_up(map);

	}

	@Override
	public int delete_like_remove(Map<String, Object> map) {
		return sqlSession.getMapper(CommunityLikeMapper.class).delete_like_remove(map);
	}

	@Override
	public int delete_like_down(Map<String, Object> map) {
		return sqlSession.getMapper(CommunityLikeMapper.class).delete_like_down(map);
	}

	@Override
	public int LikeCnt(int commNo) {
		return sqlSession.getMapper(CommunityLikeMapper.class).LikeCnt(commNo);
	}

	@Override
	public int deletebyCommNo(int commNo) {
		return sqlSession.getMapper(CommunityLikeMapper.class).deletebyCommNo(commNo);
	}

	@Override
	public int deletebyMemberId(int memberId) {
		return sqlSession.getMapper(CommunityLikeMapper.class).deletebyMemberId(memberId);
	}


}
