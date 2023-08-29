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
    private String orderId;         // 주문 번호 (Order 테이블의 PK)
    
	/* View로부터 전달받을 값 */
    private String goodsCode;   	// 상품명 (Goods 테이블의 PK)
    private int goodsCount;			// 상품 수량

	/* DB로부터 꺼내올 값 */
	private String memberName;		// 회원 이름
    private int goodsPrice;			// 상품 가격
	private String goodsImage;		// 상품 이미지
}
