package xyz.dreams.dao;

import java.util.List;

import xyz.dreams.dto.CommunityDTO;

public interface CommunityDAO {
	/*게시판 등록*/
	int enrollCommunity(CommunityDTO community);
	
	/*게시판 목록*/
	List<CommunityDTO> getList();
	
	/*게시판 글 하나 보기(조회)*/
	CommunityDTO getPage(int communityNo);
	
	/*게시판 글 수정*/
	int modifyCommunity(CommunityDTO community);
	
	/*게시판 삭제*/
	int deleteCommunity(CommunityDTO community);

	
}
