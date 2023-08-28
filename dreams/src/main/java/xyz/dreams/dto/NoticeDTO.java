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
	private int noticeNo;
	private String noticeTitle;
	private String noticeCont;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date noticeDate;
	private String noticeDel;
}
