package xyz.dreams.mapper;

import java.util.List;

import xyz.dreams.dto.CommunityReplyDTO;

public interface CommunityReplyMapper {
	/*댓글 등록*/
	int insertCommunityReply(CommunityReplyDTO reply);
	
	/*댓글 목록보기 - 게시판 번호를 가져와서 댓글을 나열한다.*/
	List<CommunityReplyDTO> selectCommunityReply(int commNo);
	
	/*댓글 삭제*/
	int deleteCommunityReply(int commReNo);
	
	/*댓글 수정*/
	void updateCommunityReply(CommunityReplyDTO reply);
}
