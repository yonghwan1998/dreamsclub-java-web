package xyz.dreams.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.CommunityDAO;
import xyz.dreams.dto.CommunityDTO;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService{
	private final CommunityDAO communityDAO;
	private final SqlSession sqlsession;

	/*게시판 등록*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void enrollCommunity(CommunityDTO community) {
		
		communityDAO.enrollCommunity(community);
	}

	/*게시판 목록 보기*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<CommunityDTO> getList() {
		List<CommunityDTO> communityList = communityDAO.getList();
		
		return communityDAO.getList();
	}

	/*게시판 글 조회*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public CommunityDTO getPage(int communityNo) {
		
		return communityDAO.getPage(communityNo);
	}

	/*게시판 글 수정*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void modifyCommunity(CommunityDTO community) {
	}

	/*게시판 글 삭제*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteCommunity(int commNo) {
		communityDAO.deleteCommunity(commNo);
	}

	/*게시글 조회수 증가*/
	@Override
	public void upCountCommunity(int commNo) {
		communityDAO.upCountCommunity(commNo);
	}
}