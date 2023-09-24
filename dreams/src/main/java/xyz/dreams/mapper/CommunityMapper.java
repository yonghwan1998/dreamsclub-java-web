package xyz.dreams.mapper;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.CommunityDTO;

public interface CommunityMapper {
	/*김예지(2023.08.28) - 게시판 글 등록하기*/
	int enrollCommunity(CommunityDTO community);

	/*김예지(2023.09.07) - 게시글 수정*/
	int modifyCommunity(CommunityDTO community);
	
	/*김예지(2023.08.30) - 게시글 삭제*/
	int deleteCommunity(int commNo);
	
	/*김예지(2023.08.29) - 게시판 글 하나 보는 페이지 (조회)*/
	CommunityDTO getPage(int communityNo);
	
	/*김예지(2023.09.08) - 조회수 증가*/
	void upCountCommunity(int commNo);
	
	/*김예지(2023.08.27) - 게시판 목록 페이지 접속
	  김예지(2023.08.30) - 게시판 목록 페이징
	  김예지(2023.09.12) - 제목, 내용, 아이디 검색 추가	*/
	List<CommunityDTO> selectCommunityList(Map<String, Object> map);
	int selectCommunityCount(Map<String, Object> map); 

	/*김예지(2023.09.14) - 게시글 넘버 => 댓글이용시사용*/
	CommunityDTO selectCommunityByCommNo(int commNo);
	
	/*김예지(2023.09.17) - 댓글 수 카운팅*/
	int updateReplyCount(int commNo);
	
	/*김예지(2023.09.24) - 좋아요 수 카운트*/
	int likeCount(int commNo);
}