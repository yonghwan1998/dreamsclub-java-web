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
	private String cartNo; //장바구니 번호
	private String memberId; //회원 아이디
	private int cartQuantity; //굿즈 개수
	private String goodsCode; //굿즈 코드
	
	//Goods 속성 (조인필요)
	private int goodsPrice; //굿즈 가격
	private String goodsImage; //굿즈 이미지
	private int goodsName; //굿즈 이름 (테이블에 없음)
	
	//추가(테이블에는 없음)
	private int totalPrice; //굿즈 하나 가격
	private int orderPrice; //총 주문금액
	
	
}
