package xyz.dreams.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/*
이름         널?       유형             
---------- -------- -------------- 
COMM_NO    NOT NULL NUMBER         
MEMBER_ID  NOT NULL VARCHAR2(50)   
COMM_TITLE NOT NULL VARCHAR2(50)   
COMM_CONT  NOT NULL VARCHAR2(4000) 
COMM_DATE           DATE           
COMM_IMG            VARCHAR2(1000) 
COMM_DEL   NOT NULL VARCHAR2(1)    
COMM_HIT            VARCHAR2(10)   
 */

@Data
public class CommunityDTO {
	private int commNo; //게시판 번호
	private String memberId; //글쓴이
	private String commTitle; //게시판 제목
	private String commCont; //게시판 내용
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date commDate; //작성날짜
	private String commImg; //첨가 이미지
	private String commDel; //삭제유무
	private int commHit; //조회수
	
	//[김예지 2023.09.17 추가]댓글 수 카운팅
	private int replyCount;
	
	//[김예지 2023.09.20 추가]좋아요 수 카운팅
	private int likeCount;
}

