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

	/*김예지(2023.08.28) - 게시판 글 등록하기*/
	@Override
	public int enrollCommunity(CommunityDTO community) {
		return sqlSession.getMapper(CommunityMapper.class).enrollCommunity(community);
	}

	
	/*김예지(2023.09.07) - 게시글 수정*/	
	@Override
	public int modifyCommunity(CommunityDTO community) {
		return sqlSession.getMapper(CommunityMapper.class).modifyCommunity(community);
	}

	
	/*김예지(2023.08.30) - 게시글 삭제*/
	@Override
	public int deleteCommunity(int commNo) {
		return sqlSession.getMapper(CommunityMapper.class).deleteCommunity(commNo);
	}
	
	
	/*김예지(2023.08.29) - 게시판 글 하나 보는 페이지 (조회)*/	
	@Override
	public CommunityDTO getPage(int communityNo) {
		return sqlSession.getMapper(CommunityMapper.class).getPage(communityNo);
	}

	/*김예지(2023.09.08) - 조회수 증가*/
	@Override
	public void upCountCommunity(int commNo) {
		sqlSession.getMapper(CommunityMapper.class).upCountCommunity(commNo);
	}
	
	
	/*김예지(2023.08.27) - 게시판 목록 페이지 접속
	  김예지(2023.08.30) - 게시판 목록 페이징
	  김예지(2023.09.12) - 제목, 내용, 아이디 검색 추가	*/
	@Override
	public List<CommunityDTO> selectCommunityList(Map<String, Object> map) {
		return sqlSession.getMapper(CommunityMapper.class).selectCommunityList(map);
	}

	/*김예지(2023.09.17) - 게시글 전체수 카운팅*/
	@Override
	public int selectCommunityCount(Map<String, Object> map) {
		return sqlSession.getMapper(CommunityMapper.class).selectCommunityCount(map);
	}

	/*김예지(2023.09.14) - 댓글 목록 구현시 필요한 정보를 얻기위해 해당 게시글 선택*/
	@Override
	public CommunityDTO selectCommunityByCommNo(int commNo) {
		return sqlSession.getMapper(CommunityMapper.class).selectCommunityByCommNo(commNo);
	}

	/*김예지(2023.09.17) - 댓글 수 카운팅*/
	@Override
	public int updateReplyCount(int commNo) {
		return sqlSession.getMapper(CommunityMapper.class).updateReplyCount(commNo);
	}

	/*김예지(2023.09.24) - 좋아요 수 카운트*/
	@Override
	public int likeCount(int commNo) {
		return sqlSession.getMapper(CommunityMapper.class).likeCount(commNo);
	}


}
