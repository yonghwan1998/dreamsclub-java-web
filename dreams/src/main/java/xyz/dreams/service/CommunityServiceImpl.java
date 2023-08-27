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

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int enrollCommunity(CommunityDTO community) {
		return communityDAO.enrollCommunity(community);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<CommunityDTO> getList() {
		List<CommunityDTO> communityList = communityDAO.getList();
		
		return communityDAO.getList();
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public CommunityDTO getPage(int communityNo) {
		
		return communityDAO.getPage(communityNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int modifyCommunity(CommunityDTO community) {
		return 0;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteCommunity(CommunityDTO community) {
		return 0;
	}
}