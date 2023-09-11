package xyz.dreams.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	private String memberId;
	private String goodsCode;
	private int cartId;
	private int cartQty;
	private Date regDate;
}
