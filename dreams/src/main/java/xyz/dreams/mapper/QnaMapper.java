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
	

	
	/* QnA 페이징 처리*/
//	List<QnaDTO> selectQnaList(Map<String, Object> map);
	int selectQnaCount();
	
	List<QnaDTO> selectQnaList();
	
	
	
	
	

}
