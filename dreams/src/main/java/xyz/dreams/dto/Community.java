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
public class Community {
	private int commNo;
	private String memberId;
	private String commTitle;
	private String commCont;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date commDate;
	private String commImg;
	private String commDel;
	private String commHit;
}
