package xyz.dreams.dao;

import java.util.Map;


public interface CommunityLikeDAO {
	/*좋아요 추가 - 김예지(2023.09.23)*/
	int insert_like_save(Map<String, Object> map);
	int insert_like_up(Map<String, Object> map);
	
	/*좋아요 삭제 - 김예지(2023.09.23)*/
	int delete_like_remove(Map<String, Object> map);
	int delete_like_down(Map<String, Object> map);
	
	/*좋아요 count(게시판의 좋아요 개수 카운트) - 김예지(2023.09.23)*/
	int LikeCnt(int commNo);

	/*게시판 삭제시 좋아요 삭제 - 김예지(2023.09.21)*/
	int deletebyCommNo(int commNo);
	
	/*멤버아이디 삭제시 좋아요 삭제 - 김예지(2023.09.21)*/
	int deletebyMemberId(int memberId);
}
