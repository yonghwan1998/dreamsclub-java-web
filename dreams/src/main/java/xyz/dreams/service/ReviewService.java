package xyz.dreams.service;

import java.util.List;
import java.util.Map;

import xyz.dreams.dto.OrderDTO;
import xyz.dreams.dto.ReviewDTO;

public interface ReviewService {
	
	//강민경: 리뷰 등록
	void enrollReview(ReviewDTO review);
	
	//강민경: 리뷰 글 수정
	void modifyReview(ReviewDTO review);
	
	//강민경: 리뷰 삭제
	void deleteReview(int revNo);
	
	//강민경: 페이징 처리
	Map<String, Object> getReviewList(int reviewPageNum, String goodsName);
	
	//강민경: 주문 완료 후 상품 리스트 출력
	List<OrderDTO> selectOrderStatus();
	
	//강민경(2023/09/23): 굿즈 상세페이지에서 리뷰 갯수 출력 
	int selectReviewCount(String goodsName);
	
	//이소영(추가) : 2023-09-25
	List<ReviewDTO> findByMemberId(String memeberId);
}