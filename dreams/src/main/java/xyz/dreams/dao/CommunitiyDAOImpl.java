package xyz.dreams.dao;

import java.util.List;
import java.util.Map;

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

	/*
	@Override
	public List<CommunityDTO> getList() {
		return sqlSession.getMapper(CommunityMapper.class).getList();
	}
	*/

	@Override
	public CommunityDTO getPage(int communityNo) {
		return sqlSession.getMapper(CommunityMapper.class).getPage(communityNo);
	}

	@Override
	public int modifyCommunity(CommunityDTO community) {
		return sqlSession.getMapper(CommunityMapper.class).modifyCommunity(community);
	}

	@Override
	public int deleteCommunity(int commNo) {
		return sqlSession.getMapper(CommunityMapper.class).deleteCommunity(commNo);
	}

	/*조회수 증가*/
	@Override
	public void upCountCommunity(int commNo) {
		sqlSession.getMapper(CommunityMapper.class).upCountCommunity(commNo);
	}

	/*페이징 처리*/
	@Override
	public List<CommunityDTO> selectCommunityList(Map<String, Object> map) {
		return sqlSession.getMapper(CommunityMapper.class).selectCommunityList(map);
	}

	@Override
	public int selectCommunityCount() {
		return sqlSession.getMapper(CommunityMapper.class).selectCommunityCount();
	}


}
