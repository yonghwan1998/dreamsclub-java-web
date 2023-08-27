package xyz.dreams.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/*
이름                널?       유형            
----------------- -------- ------------- 
MEMBER_ID         NOT NULL VARCHAR2(30)  
MEMBER_PW         NOT NULL VARCHAR2(50)  
MEMBER_EMAIL      NOT NULL VARCHAR2(30)  
MEMBER_PHONE      NOT NULL VARCHAR2(30)  
MEMBER_NAME       NOT NULL VARCHAR2(30)  
MEMBER_PCODE               VARCHAR2(30)  
MEMBER_ADDRESS1            VARCHAR2(100) 
MEMBER_ADDRESS2            VARCHAR2(100) 
MEMBER_STATUS     NOT NULL NUMBER        
MEMBER_REG_DATE   NOT NULL DATE          
MEMBER_LAST_LOGIN NOT NULL DATE   
*/ 
@Data
public class MemberDTO {
	
	private String memberId;
	private String memberPw;
	private String memberEmail;
	private String memberPhone;
	private String memberName;
	private String memberPcode;
	private String memberAddress1;
	private String memberAddress2;
	private int memberStatus;

	//파이널 때 다시 정의함
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date memberRegDate;
	private Date memberLastLogin;
	
	
}
