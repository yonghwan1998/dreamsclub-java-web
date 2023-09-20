package xyz.dreams.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.QnaDTO;
import xyz.dreams.mapper.CommunityMapper;
import xyz.dreams.mapper.QnaMapper;

@Repository // 스프링에서 지원하지 않는 Exception을 Spring Exception으로 전환하기 위해 씀
@RequiredArgsConstructor //생성자 주입
public class QnaDAOImpl implements QnaDAO {
	private final SqlSession sqlSession;
	
	
	
	/*게시판 글 등록하기*/
	@Override
	public int enrollQna(QnaDTO qna) {
		return sqlSession.getMapper(QnaMapper.class).enrollQna(qna);
	}
	// sqlSession.getMapper(QnaMapper.class)를 사용하여
	// DB 작업을 위한 QnaMapper 매퍼 인터페이스를 얻고, 이 인터페이스의 enrollQna 메서드를 호출하여 글을 등록

	
	/*게시판 수정*/	
	@Override
	public int modifyQna(QnaDTO qna) {
		return sqlSession.getMapper(QnaMapper.class).modifyQna(qna);
	}

	
	/*페이지 삭제*/
	@Override
	public int deleteQna(int qnaNo) {
		return sqlSession.getMapper(QnaMapper.class).deleteQna(qnaNo);
	}	
	
	
	/*페이징 처리*/
	// Q&A  목록을 반환
	/*
	 * @Override public List<QnaDTO> selectQnaList(Map<String, Object> map) {
	 * //return sqlSession.getMapper(QnaMapper.class).selectQnaList(map); // 원본
	 * return sqlSession.getMapper.selectQnaList(map); // 9/20 - 인자 제거1 잘못제거했나봐요
	 * //return sqlSession.getMapper(QnaMapper.class).selectQnaList(); // 9/20 - 인자
	 * 제거 2 } //selectQnaList 는 Map<String, Object>의 map 을 받아와 Q&A 목록을 반환 //
	 * sqlSession 을 통해 QnaMapper 라는 매퍼인터페이스의 selectQnaList 호출해 Q&A 목록을 가져옴
	 */
	
	@Override
	public int selectQnaCount() { // Q&A  총갯수를 반환
		return sqlSession.getMapper(QnaMapper.class).selectQnaCount();
	}


	@Override
	public List<QnaDTO> selectQnaList() {
		return sqlSession.getMapper(QnaMapper.class).selectQnaList();
	}
 
	

	
	
	
	
	

}
