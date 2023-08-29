package xyz.dreams.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/*
이름           널?       유형             
------------ -------- -------------- 
NOTICE_NO    NOT NULL NUMBER         
NOTICE_TITLE NOT NULL VARCHAR2(50)   
NOTICE_CONT  NOT NULL VARCHAR2(4000) 
NOTICE_DATE           DATE           
NOTICE_DEL   NOT NULL VARCHAR2(1)
*/
	
@Data
public class NoticeDTO {
	private int noticeNo; 		//공지사항 번호
	private String noticeTitle; //공지사항 제목
	private String noticeCont;	//공지사항 내용
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date noticeDate;	//공지사항 작성날짜
	private String noticeDel;	//공지사항 삭제
}
