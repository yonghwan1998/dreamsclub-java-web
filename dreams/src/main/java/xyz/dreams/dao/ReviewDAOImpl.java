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
public class ReviewDAOImpl implements ReviewDAO{
	private final SqlSession sqlSession;
	
	//강민경: 리뷰 등록
	@Override
	public int enrollReview(ReviewDTO review) {
		return sqlSession.getMapper(ReviewMapper.class).enrollReview(review);
	}

	//강민경: 리뷰 수정 
	@Override
	public int modifyReview(ReviewDTO review) {
		return sqlSession.getMapper(ReviewMapper.class).modifyReview(review);
	}

	//강민경: 리뷰 삭제 
	@Override
	public int deleteReview(int revNo) {
		return sqlSession.getMapper(ReviewMapper.class).deleteReviwe(revNo);
	}
	
	
	//강민경: 페이징 처리 
	@Override
	public List<ReviewDTO> selectReviewList(Map<String, Object> map) {
		return sqlSession.getMapper(ReviewMapper.class).selectReviewList(map);
	}

	@Override
	public int selectReviewCount(String goodsName) {
		return sqlSession.getMapper(ReviewMapper.class).selectReviewCount(goodsName);
	}
}