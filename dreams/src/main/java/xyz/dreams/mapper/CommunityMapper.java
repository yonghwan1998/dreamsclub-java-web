package xyz.dreams.mapper;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.CommunityDTO;

public interface CommunityMapper {
	/*게시판 등록*/
	int enrollCommunity(CommunityDTO community);
	
	/*게시판 목록*/
	//List<CommunityDTO> getList();
	
	/*게시판 글 하나 보기(조회)*/
	CommunityDTO getPage(int communityNo);
	
	/*게시판 글 수정*/
	int modifyCommunity(CommunityDTO community);
	
	/*게시판 삭제*/
	int deleteCommunity(int commNo);
	
	/*게시글 조회수 증가*/
	void upCountCommunity(int commNo);
	
	/*페이징 처리*/
	List<CommunityDTO> selectCommunityList(Map<String, Object> map);
	int selectCommunityCount(); 

}
