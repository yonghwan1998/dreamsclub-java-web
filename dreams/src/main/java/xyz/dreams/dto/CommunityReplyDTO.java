package xyz.dreams.dto;

import lombok.Data;

/*
이름           널?       유형             
------------ -------- -------------- 
COMM_RE_NO   NOT NULL NUMBER         
COMM_NO      NOT NULL NUMBER         
COMM_RE_CONT NOT NULL VARCHAR2(4000) 
COMM_RE_DATE          DATE           
MEMBER_ID    NOT NULL VARCHAR2(30)   
COMM_RE_DEL  NOT NULL VARCHAR2(1)  
 */

@Data
public class CommunityReplyDTO {
	private int commReNo;	//댓글 번호
	private int commNo;		//게시글 번호
	private String commReCont;	//댓글 내용
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String commReDate;	//댓글 작성 날짜
	private String memberId;	//댓글 작성 회원 아이디
	private String commReDel;	//댓글 삭제 여부
}
