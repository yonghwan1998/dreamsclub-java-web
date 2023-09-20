package xyz.dreams.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	private String memberId;
	private String goodsCode;
	private int goodsCount;
	private int cartId;
	private int goodsPrice;
	private String goodsInfo;
	private String goodsImage;
	private Date cartRegDate;
}
