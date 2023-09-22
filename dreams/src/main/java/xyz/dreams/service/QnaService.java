package xyz.dreams.service;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.CommunityReplyDTO;
import xyz.dreams.dto.QnaDTO;

public interface QnaService {
	
	/* QnA  등록*/
	String enrollQna(QnaDTO qna);
	
	/* QnA 삭제*/
	void deleteQna(int qnaNo);
	
	/* QnA 답변등록 */
	String addQnaReply(QnaDTO qna);
	
	
	
	
	/*  오진서 (2023.09.19) 수정 // 목록 + 페이징 처리*/
//	Map<String, Object> getQnaList(Map <String, Object>map);
	
	List<QnaDTO> getQnaList(String goodsName);
	
	//이소영(추가) : 2023-09-21
	List<QnaDTO> findByMemberId(String memberId);
}
