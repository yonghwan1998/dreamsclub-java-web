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

	/*QnA  등록하기*/
	@Override
	public int enrollQna(QnaDTO qna) {
		return sqlSession.getMapper(QnaMapper.class).enrollQna(qna);
	}
	// sqlSession.getMapper(QnaMapper.class)를 사용하여
	// DB 작업을 위한 QnaMapper 매퍼 인터페이스를 얻고, 이 인터페이스의 enrollQna 메서드를 호출하여 글을 등록

	
	/* 수정 */	
	@Override
	public int modifyQna(QnaDTO qna) {
		return sqlSession.getMapper(QnaMapper.class).modifyQna(qna);
	}

	
	/* 삭제 */
	@Override
	public int deleteQna(int qnaNo) {
		return sqlSession.getMapper(QnaMapper.class).deleteQna(qnaNo);
	}	
	
	/* 9/22 - 오진서 / 답변달기 */
	@Override
	public int addQnaReply(QnaDTO qna) {
		return sqlSession.getMapper(QnaMapper.class).addQnaReply(qna);
	}
	
	@Override
	public int selectQnaCount(String goodsName) { // Q&A  총갯수를 반환
		return sqlSession.getMapper(QnaMapper.class).selectQnaCount(goodsName);
	}

	@Override
	public List<QnaDTO> selectQnaList(Map<String, Object> map) {
		return sqlSession.getMapper(QnaMapper.class).selectQnaList(map);
	}

	//이소영(추가) : 2023-09-21
	@Override
	public List<QnaDTO> findByMemberId(String memberId) {
		return sqlSession.getMapper(QnaMapper.class).selectQnaByMember(memberId);
	}

}
