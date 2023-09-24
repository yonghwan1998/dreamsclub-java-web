package xyz.dreams.service;


import xyz.dreams.dto.CommunityDTO;
import xyz.dreams.dto.CommunityLikeDTO;


public interface CommunityLikeService {
	
	/*좋아요 추가 - 김예지(2023.09.23)*/
	CommunityDTO saveLike(CommunityLikeDTO to);
	
	/*좋아요 삭제 - 김예지(2023.09.23)*/
	CommunityDTO removeLike(CommunityLikeDTO to);
}
