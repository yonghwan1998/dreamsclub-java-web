package xyz.dreams.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.QnaDAO;
import xyz.dreams.dto.QnaDTO;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService {
	private final QnaDAO qnaDAO;
	private final SqlSession sqlsession;
	
	/* 문의 등록하기*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void enrollQna(QnaDTO qna) {
		qna.setQnaTitle(qna.getQnaTitle());
		qna.setQnaCont(qna.getQnaCont());
		qnaDAO.enrollQna(qna);
	}
	
	/* 수정하기 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void modifyQna(QnaDTO qna) {
		
		qna.setQnaTitle(qna.getQnaTitle());
		qna.setQnaCont(qna.getQnaCont());
		qnaDAO.modifyQna(qna);
	}
	
	/* 삭제하기 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteQna(int qnaNo) {
		
		qnaDAO.deleteQna(qnaNo);
	}

	@Override
	public Map<String, Object> getQnaList(int pageNum) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
