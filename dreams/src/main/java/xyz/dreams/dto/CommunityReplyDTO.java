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
	private int commReNo;
	private int commNo;
	private String commReCont;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String commReDate;
	private String memberId;
	private String commReDel;
}
