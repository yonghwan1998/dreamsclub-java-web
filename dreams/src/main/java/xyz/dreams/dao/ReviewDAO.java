package xyz.dreams.dao;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.OrderDTO;
import xyz.dreams.dto.ReviewDTO;

public interface ReviewDAO{
	//강민경: 리뷰 등록
	int enrollReview(ReviewDTO review);
	
	//강민경: 리뷰 수정
	int modifyReview(ReviewDTO review);
	
	//강민경: 리뷰 삭제
	int deleteReview(int revNo);
	
	//강민경: 페이징 처리
	List<ReviewDTO> selectReviewList(Map<String, Object>map);
	int selectReviewCount(String goodsName); //게시글 총 개수 
	
	//강민경: 상품 list 출력 
	List<OrderDTO> selectOrderStatus();
	
	
}