package xyz.dreams.service;

import java.util.Map;

import xyz.dreams.dto.CommunityDTO;

public interface CommunityService {

	/*김예지(2023.08.28) - 게시판 글 등록하기*/
	void enrollCommunity(CommunityDTO community);
	
	/*김예지(2023.09.07) - 게시글 수정*/
	void modifyCommunity(CommunityDTO community);
	
	/*김예지(2023.08.30) - 게시글 삭제*/
	void deleteCommunity(int commNo);
	
	/*김예지(2023.08.29) - 게시판 글 하나 보는 페이지 (조회)*/
	CommunityDTO getPage(int communityNo);

	/*김예지(2023.09.08) - 조회수 증가*/
	void upCountCommunity(int commNo);
	
	/*김예지(2023.08.27) - 게시판 목록 페이지 접속
	  김예지(2023.08.30) - 게시판 목록 페이징
	  김예지(2023.09.12) - 제목, 내용, 아이디 검색 추가	*/
	Map<String, Object> getCommunityList(Map<String, Object> map);
	
	/*김예지(2023.09.17) - 댓글 수 카운팅*/
	void updateReplyCount(int commNo);
}
