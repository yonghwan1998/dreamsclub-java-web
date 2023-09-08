package xyz.dreams.mapper;

import xyz.dreams.dto.ReviewDTO;

public interface ReviewMapper {
	
	//강민경: 댓글 등록
	int  enrollReply(ReviewDTO review);
}
