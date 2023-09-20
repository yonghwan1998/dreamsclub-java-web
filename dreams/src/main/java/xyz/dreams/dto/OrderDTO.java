package xyz.dreams.dto;

import java.util.Date;

import lombok.Data;

/*
이름              널? 유형            
--------------- -- ------------- 
ORDER_ID           VARCHAR2(40)  
ORDER_SEQ_NUM      NUMBER(8)     
GOODS_CODE         VARCHAR2(100) 
GOODS_PRICE        NUMBER(10)    
ORDER_QTY          NUMBER(2)     
GOODS_STOCK        NUMBER        
GOODS_INFO         VARCHAR2(500) 
SELECTED_OPT       VARCHAR2(100) 
MEMEBER_ID         VARCHAR2(30)  
MEMBER_NAME        VARCHAR2(30)  
MEMBER_EMAIL       VARCHAR2(30)  
MEMBER_PHONE       VARCHAR2(30)  
MEMBER_PCODE       VARCHAR2(30)  
MEMBER_ADDRESS1    VARCHAR2(100) 
MEMBER_ADDRESS2    VARCHAR2(100) 
ORDER_DATE         DATE          
DELIVER_MSG        VARCHAR2(300) 
ORDER_STATUS       NUMBER(2)     
TOTAL_AMOUNT       NUMBER(8)     
CAL_INFO           VARCHAR2(20)  
 */

@Data
public class OrderDTO {
	private int orderId;
	private String goodsCode;
	private int goodsPrice;
	private int goodsCount;
	private int goodsStock;
	private String goodsInfo;
	private String goodsImage;
	private String goodsSize;
	private String memberId;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private String memberPcode;
	private String memberAddress1;
	private String memberAddress2;
	private Date orderDate;
	private String deliverMsg;
	private int orderStatus;
	private int totalAmount;
	private String calInfo;
}
