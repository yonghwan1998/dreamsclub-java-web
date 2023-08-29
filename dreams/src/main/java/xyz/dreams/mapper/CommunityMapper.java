package xyz.dreams.mapper;

import java.util.List;

import xyz.dreams.dto.CommunityDTO;

public interface CommunityMapper {
	/*게시판 등록*/
	int enrollCommunity(CommunityDTO community);
	
	/*게시판 목록*/
	List<CommunityDTO> getList();
	
	/*게시판 글 하나 보기(조회)*/
	CommunityDTO getPage(int communityNo);
	
	/*게시판 글 수정*/
	int modifyCommunity(CommunityDTO community);
	
	/*게시판 삭제 - 삭제 성공시 1반환, 실패시 0반환*/
	int deleteCommunity(int commNo);

}
