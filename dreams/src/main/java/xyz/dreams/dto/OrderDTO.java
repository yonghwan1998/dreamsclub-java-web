package xyz.dreams.dto;

import java.util.Date;

import lombok.Data;

/*
이름              널? 유형            
--------------- -- ------------- 
IMP_UID	VARCHAR2(100 BYTE)
MERCHANT_UID	VARCHAR2(100 BYTE)
GOODS_CODE	VARCHAR2(100 BYTE)
GOODS_PRICE	NUMBER(10,0)
GOODS_COUNT	NUMBER(2,0)
GOODS_INFO	VARCHAR2(500 BYTE)
MEMBER_ID	VARCHAR2(30 BYTE)
MEMBER_NAME	VARCHAR2(30 BYTE)
MEMBER_EMAIL	VARCHAR2(30 BYTE)
MEMBER_PHONE	VARCHAR2(30 BYTE)
MEMBER_PCODE	VARCHAR2(30 BYTE)
MEMBER_ADDRESS1	VARCHAR2(100 BYTE)
MEMBER_ADDRESS2	VARCHAR2(100 BYTE)
PAY_DATE	DATE
DELIVER_MSG	VARCHAR2(300 BYTE)
STATUS	VARCHAR2(20 BYTE) 
 */

@Data
public class OrderDTO {
	
	private String impUid;
	private String merchantUid;
	private String goodsCode;
	private long goodsPrice;
	private int goodsCount;
	private String memberId;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private String memberPcode;
	private String memberAddress1;
	private String memberAddress2;
	private Date payDate;
	private String deliverMsg;
	private String status;
	
	private String memberNewPcode;
	private String memberNewAddress1;
	private String memberNewAddress2;
	int newSelected;
	private String goodsImg; //마이페이지 주문목록 이미지 출력 
}
