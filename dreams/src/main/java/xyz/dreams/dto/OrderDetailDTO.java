package xyz.dreams.dto;

import lombok.Data;

/*         
--------------- -------- ------------- 
ORDER_DETAIL_NO NOT NULL NUMBER        
ORDER_ID        NOT NULL VARCHAR2(30)  
GOODS_CODE      NOT NULL VARCHAR2(100) 
CART_QUANTITY   NOT NULL NUMBER    
 */

@Data
public class OrderDetailDTO {
    private int orderDetailNo;		// 시퀸스
    private String orderId;         // 주문 번호
    private String memberId;        // 회원 ID (Member 테이블의 PK)
    private String cartNo;          // 장바구니 ID (Cart 테이블의 PK)
    private String memberName;      // 회원 이름 (Member 테이블의 필드)
    private String goodsCode;   	// 장바구니의 상품 코드 (Cart 테이블의 필드)
    private int cartQuantity;       // 장바구니의 수량 (Cart 테이블의 필드)
    private double orderPrice;      // 주문 가격
}
