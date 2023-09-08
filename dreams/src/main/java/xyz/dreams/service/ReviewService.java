package xyz.dreams.service;

import xyz.dreams.dto.ReviewDTO;

public interface ReviewService {
	
	//강민경: 댓글 등록
	int enrollReply(ReviewDTO review);
}
