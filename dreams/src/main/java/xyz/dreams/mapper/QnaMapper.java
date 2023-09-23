package xyz.dreams.mapper;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.QnaDTO;

public interface QnaMapper {
	/* QnA  등록*/
	int enrollQna(QnaDTO qna);
	
	/* QnA 수정*/
	int modifyQna(QnaDTO qna);
	
	/* QnA 삭제*/
	int deleteQna(int qnaNo);
	
	/* QnA 답변등록 */
	int addQnaReply(QnaDTO qna);

	
	/* QnA 페이징 처리*/
	List<QnaDTO> selectQnaList(Map<String, Object> map);
	int selectQnaCount(String goodsName);
	
	//이소영(추가) : 2023-09-21 
	List<QnaDTO> selectQnaByMember(String memberId);
	
	

}
