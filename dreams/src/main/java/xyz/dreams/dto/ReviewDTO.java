package xyz.dreams.dto;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReviewDTO {
	private int revNo;//리뷰 번호 
	private String memberId;//글쓴이 - MEMBER테이블의 외래키
	private int orderNo;//주문번호 - 주문 번호테이블의 외래키
	private String revCont;//리뷰 내용
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date revDate; //작성날짜
	private String revImg; //리뷰 사진
	private int goodsStar; //리뷰 별점
	private String revDel; //삭제 유무
	private String goodsCode; //GOODS테이블의 외래키
	
	
}
