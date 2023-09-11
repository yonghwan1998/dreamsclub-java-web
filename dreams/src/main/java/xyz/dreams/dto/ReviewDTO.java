package xyz.dreams.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ReviewDTO {
	private int revNo;
	private String memberId;
	private int orderNo;
	private String revCont;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date revDate; //작성날짜
	private String revImg;
	private int goodsStar;
	private String revDel;
	private String goodsCode;
	
}
