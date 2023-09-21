package xyz.dreams.mapper;

import xyz.dreams.dto.CommunityLikeDTO;

public interface CommunityLikeMapper {

	/*게시판 좋아요 클릭 - 김예지(2023.09.20)*/
	int likeCheck(CommunityLikeDTO like);
	
	/*게시판 좋아요 취소 - 김예지(2023.09.20)*/
	int likeCheck_cancle(CommunityLikeDTO like);
	
	/*좋아요 눌렀는지 안눌렀는지 확인 - 김예지(2023.09.20)*/
	int findLike(CommunityLikeDTO like);

}
