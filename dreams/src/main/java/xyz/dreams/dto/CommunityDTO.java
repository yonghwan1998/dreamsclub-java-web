package xyz.dreams.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/*
이름          널?       유형             
----------- -------- -------------- 
COMM_NO     NOT NULL NUMBER         //게시판 번호
MEMBER_ID   NOT NULL VARCHAR2(50)   //글쓴이
COMM_TITLE  NOT NULL VARCHAR2(300)  //게시판 제목
COMM_DATE            DATE           //작성날짜
COMM_IMG             VARCHAR2(4000) //첨가 이미지
COMM_DEL             VARCHAR2(1)    //삭제유무
COMM_HIT             NUMBER         //조회수
REPLY_COUNT          NUMBER(38)     댓글 수 카운팅
COMM_CONT            CLOB           //게시판 내용(이미지가 글 안에 들어가 내용이 크기 때문에 CLOB타입 사용)
LIKE_COUNT           NUMBER    		//좋아요 수 카운팅
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
	private int replyCount; //[김예지 2023.09.17 추가]댓글 수 카운팅
	private int likeCount;  //[김예지 2023.09.23 추가]좋아요 수 카운팅
	
	//[김예지 2023.09.23 추가] 현재 사용자가 좋아요 누른건지 아닌지 확인
	private int likeNo;
}

