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

	// 굿즈마다 리뷰 개수 count 시 사용할 필드
	private int reviewCount;
	// 굿즈마다 별점을 저장할 필드
	private float goodsStar;

//	관리자 굿즈 등록 시 사용할 필드
	private String goodsYnL;
	private String goodsYnM;
	private String goodsYnS;
	private String goodsYnF;
	private int goodsStockL;
	private int goodsStockM;
	private int goodsStockS;
	private int goodsStockF;

//	관리자 굿즈 변경 시 사용할 필드
	private String noSpaceGoodsCode;

//	구매하기에서 사용할 필드
	private String goodsName;
	private int goodsCount;
	private String goodsCategory;
	private String goodsSize;
}