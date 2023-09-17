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

	/*게시판 글 등록하기*/
	@Override
	public int enrollCommunity(CommunityDTO community) {
		return sqlSession.getMapper(CommunityMapper.class).enrollCommunity(community);
	}

	
	/*게시판 수정*/	
	@Override
	public int modifyCommunity(CommunityDTO community) {
		return sqlSession.getMapper(CommunityMapper.class).modifyCommunity(community);
	}

	
	/*페이지 삭제*/
	@Override
	public int deleteCommunity(int commNo) {
		return sqlSession.getMapper(CommunityMapper.class).deleteCommunity(commNo);
	}
	
	
	/*게시판 글 하나 보는 페이지 (조회)*/	
	@Override
	public CommunityDTO getPage(int communityNo) {
		return sqlSession.getMapper(CommunityMapper.class).getPage(communityNo);
	}

	/*조회수 증가*/
	@Override
	public void upCountCommunity(int commNo) {
		sqlSession.getMapper(CommunityMapper.class).upCountCommunity(commNo);
	}
	
	
	/*페이징 처리+목록보기+검색*/
	@Override
	public List<CommunityDTO> selectCommunityList(Map<String, Object> map) {
		return sqlSession.getMapper(CommunityMapper.class).selectCommunityList(map);
	}

	/*게시글 전체수 카운팅*/
	@Override
	public int selectCommunityCount(Map<String, Object> map) {
		return sqlSession.getMapper(CommunityMapper.class).selectCommunityCount(map);
	}

	@Override
	public CommunityDTO selectCommunityByCommNo(int commNo) {
		return sqlSession.getMapper(CommunityMapper.class).selectCommunityByCommNo(commNo);
	}


	@Override
	public int updateReplyCount(int commNo) {
		return sqlSession.getMapper(CommunityMapper.class).updateReplyCount(commNo);
	}





}
