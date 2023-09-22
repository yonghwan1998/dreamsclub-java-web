package xyz.dreams.dao;

import java.util.List;

import xyz.dreams.dto.CommunityReplyDTO;

public interface CommunityReplyDAO {
	/*김예지(2023.09.14) - 댓글 등록*/
	int insertCommunityReply(CommunityReplyDTO reply);
	
	/*김예지(2023.09.13) - 댓글 목록 : 게시판 번호를 가져와서 댓글을 나열한다.*/
	List<CommunityReplyDTO> selectCommunityReply(int commNo);
	
	/*김예지(2023.09.15) - 댓글 삭제*/
	int deleteCommunityReply(int commReNo);
	
	/*김예지(2023.09.18) - 댓글 수정*/
	void updateCommunityReply(CommunityReplyDTO reply);
}
