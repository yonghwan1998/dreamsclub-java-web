package xyz.dreams.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.ReviewDTO;
import xyz.dreams.mapper.ReviewMapper;

@Repository
@RequiredArgsConstructor
public class ReviewDAOImpl implements ReviewDAO {
	private final SqlSession sqlSession;

	// 강민경: 리뷰 등록
	@Override
	public int enrollReview(ReviewDTO review) {
		System.out.println("*****************");
		System.out.println("DAO = "+review);
		System.out.println("*****************");
		return sqlSession.getMapper(ReviewMapper.class).enrollReview(review);
	}

	// 강민경: 리뷰 수정
	@Override
	public int modifyReview(ReviewDTO review) {
		return sqlSession.getMapper(ReviewMapper.class).modifyReview(review);
	}

	// 강민경: 리뷰 삭제
	@Override
	public int deleteReview(int revNo) {
		return sqlSession.getMapper(ReviewMapper.class).deleteReview(revNo);
	}

	// 강민경: 페이징 처리
	@Override
	public List<ReviewDTO> selectReviewList(Map<String, Object> map) {
		return sqlSession.getMapper(ReviewMapper.class).selectReviewList(map);
	}

	// 강민경(2023/09/20): 마이페이지에서 리뷰 list 출력
	@Override
	public int selectReviewCount(String goodsName) {
		return sqlSession.getMapper(ReviewMapper.class).selectReviewCount(goodsName);
	}

	// 이소영(추가) : 2023-09-25
	@Override
	public List<ReviewDTO> findByMemberId(String memberId) {
		return sqlSession.getMapper(ReviewMapper.class).selectReviewByMember(memberId);
	}
}