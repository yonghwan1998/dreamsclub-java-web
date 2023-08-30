package xyz.dreams.service;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.CommunityDTO;

public interface CommunityService {

	/*게시판 등록*/
	void enrollCommunity(CommunityDTO community);
	
	/*게시판 목록*/
	//List<CommunityDTO> getList();
	
	/*게시판 글 하나 보기(조회)*/
	CommunityDTO getPage(int communityNo);
	
	/*게시판 글 수정*/
	void modifyCommunity(CommunityDTO community);
	
	/*게시판 삭제*/
	void deleteCommunity(int commNo);

	/*게시글 조회수 증가*/
	void upCountCommunity(int commNo);
	
	/*페이징 처리*/
	Map<String, Object> getCommunityList(int pageNum);
}
