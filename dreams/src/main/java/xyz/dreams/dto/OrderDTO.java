package xyz.dreams.dto;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/*
------------------- -------- ------------- 
ORDER_ID            NOT NULL VARCHAR2(30)  
MEMBER_ID           NOT NULL VARCHAR2(30)  
GOODS_CODE          NOT NULL VARCHAR2(30)  
ORDER_PCODE         NOT NULL VARCHAR2(100) 
ORDER_ADDRESS1      NOT NULL VARCHAR2(100) 
ORDER_ADDRESS2               VARCHAR2(100) 
ORDER_PHONE         NOT NULL VARCHAR2(50)  
ORDER_MEMO                   VARCHAR2(100) 
ORDER_DATE          NOT NULL DATE          
ORDER_STATUS        NOT NULL NUMBER        
ORDER_STATUS_CHANGE          DATE          
ORDER_QUANTITY      NOT NULL NUMBER        
ORDER_HOW                    NUMBER    	
 */

@Data
public class OrderDTO {
	private String orderId;			//주문 번호 PR
	private String memberId;		//주문 회원
	private String goodsCode;		//굿즈 정보
	private String orderPcode;		//우편 번호
	private String orderAddress1;	//기본 주소
	private String orderAddress2;	//상세 주소
	private String orderPhone;		//전화번호
	private String orderMemo;		//배송 메모
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date orderDate;			//주문 날짜
	private int orderStatus;		//주문상태 - 관리자
	private Date orderStatusChange;	//주문상태 변경일 - 관리자
	private int orderQuantity;		//주문 수량(안쓸듯)
	private int orderHow;			//결제 수단(final)
}
