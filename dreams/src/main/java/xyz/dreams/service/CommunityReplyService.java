package xyz.dreams.service;

import java.util.List;

import xyz.dreams.dto.CommunityReplyDTO;

public interface CommunityReplyService {
	/*댓글 추가*/
	void addCommunityReply(CommunityReplyDTO reply);
	
	/*댓글 목록 보기*/
	List<CommunityReplyDTO> getCommunityReplyList(int commNo);
	
	/*댓글 삭제 - 김예지(2023.09.15)*/
	int deleteCommunityReply(int commReNo);
	
	/*댓글 수정 - 김예지(2023.09.17)*/
	void modifyCommunityReply(CommunityReplyDTO reply);
}
