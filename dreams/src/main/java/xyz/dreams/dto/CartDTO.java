package xyz.dreams.dto;

import lombok.Data;

/*
이름            널?       유형           
------------- -------- ------------ 
CART_NO       NOT NULL VARCHAR2(50) 
MEMBER_ID     NOT NULL VARCHAR2(30) 
CART_QUANTITY          NUMBER        => 상품수량
GOODS_CODE    NOT NULL VARCHAR2(30) 
*/

@Data
public class CartDTO {
	private String cartNo;
	private String memberId;
	private int cartQuantity;
	private String goodsCode;
	
	//Goods 속성 (조인필요)
	private int goodsPrice;
	
	//추가(테이블에는 없음)
	private int totalPrice; //굿즈 하나 가격
	private int orderPrice; //총 주문금액
	
	
}
