package xyz.dreams.service;

import java.util.Map;

import xyz.dreams.dto.ReviewDTO;

public interface ReviewService {
	
	//강민경: 리뷰 등록
	void enrollReview(ReviewDTO review);
	
	//강민경: 리뷰 글 수정
	void modifyReview(ReviewDTO review);
	
	//강민경: 리뷰 삭제
	void deleteReview(int revNo);
	
	//강민경: 페이징 처리
	Map<String, Object> getReviewList(int pageNum);
	
	
}