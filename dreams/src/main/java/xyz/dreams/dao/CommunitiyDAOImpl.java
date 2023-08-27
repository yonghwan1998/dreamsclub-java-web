package xyz.dreams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CommunityDTO;
import xyz.dreams.mapper.CommunityMapper;

@Repository
@RequiredArgsConstructor
public class CommunitiyDAOImpl implements CommunityDAO{
	private final SqlSession sqlSession;

	@Override
	public int enrollCommunity(CommunityDTO community) {
		return sqlSession.getMapper(CommunityMapper.class).enrollCommunity(community);
	}

	@Override
	public List<CommunityDTO> getList() {
		return sqlSession.getMapper(CommunityMapper.class).getList();
	}

	@Override
	public CommunityDTO getPage(int communityNo) {
		return sqlSession.getMapper(CommunityMapper.class).getPage(communityNo);
	}

	@Override
	public int modifyCommunity(CommunityDTO community) {
		return sqlSession.getMapper(CommunityMapper.class).modifyCommunity(community);
	}

	@Override
	public int deleteCommunity(CommunityDTO community) {
		return sqlSession.getMapper(CommunityMapper.class).deleteCommunity(community);
	}


}
