package xyz.dreams.dto;

import lombok.Data;

/*
 이름         널?       유형           
---------- -------- ------------ 
LIKE_NO    NOT NULL NUMBER       	//좋아요 번호
MEMBER_ID  NOT NULL VARCHAR2(50) 	//유저 아이디
COMM_NO             NUMBER       	//게시판 번호
LIKE_CHECK          NUMBER      	//좋아요 상태 확인(클릭 or 취소)
 */

@Data
public class CommunityLikeDTO {
	private int likeNo;
	private String memberId;
	private int commNo;
	private int likeCheck;
	

	


}
