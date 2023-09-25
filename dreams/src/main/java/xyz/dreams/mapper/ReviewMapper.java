package xyz.dreams.mapper;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.ReviewDTO;

public interface ReviewMapper {
	
	//강민경: 리뷰 등록
	int enrollReview(ReviewDTO review);
	
	//강민경: 리뷰 글 수정
	int modifyReview(ReviewDTO review);
	
	//강민경: 리뷰 글 삭제 
	int deleteReview(int revNo);
	
	//강민경: 페이징 처리
	List<ReviewDTO> selectReviewList(Map<String, Object>map);
	int selectReviewCount(String goodsName);
	
	//이소영(추가) : 2023-09-25
	List<ReviewDTO> selectReviewByMember(String memberId);
}