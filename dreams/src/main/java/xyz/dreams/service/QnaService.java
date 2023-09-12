package xyz.dreams.service;

import java.util.Map;

import xyz.dreams.dto.QnaDTO;

public interface QnaService {
	
	/* QnA  등록*/
	void enrollQna(QnaDTO qna);
	
	/* QnA 수정*/
	void modifyQna(QnaDTO qna);
	
	/* QnA 삭제*/
	void deleteQna(int qnaNo);
	

	
	/*페이징 처리*/
	Map<String, Object> getQnaList(int pageNum);
	

}
