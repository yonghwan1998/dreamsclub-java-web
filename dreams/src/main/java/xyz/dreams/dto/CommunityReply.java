package xyz.dreams.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class CommunityReply {
	private int commReNo;
	private int commNo;
	private String commReCont;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date commReDate;
	private String memeberId;
	private String commReDel;
}
