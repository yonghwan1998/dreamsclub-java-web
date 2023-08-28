package xyz.dreams.dto;

import lombok.Data;

@Data
public class GoodsDTO {
	private String goodsCode;
	private int goodsPrice;
	private String goodsInfo;
	private String goodsYn;
	private int goodsStock;
	private String goodsImage;
	
//	구매하기에서 사용할 필드
	private int goodsCount;
	private String goodsCategory;
	private String goodsSize;
}