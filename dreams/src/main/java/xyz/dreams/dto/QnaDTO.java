package xyz.dreams.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

/*
이름          널?       유형             
----------- -------- -------------- 
QNA_NO      NOT NULL NUMBER         	- 문의번호
MEMBER_ID   NOT NULL VARCHAR2(30)   	- 회원 아이디
QNA_TITLE   NOT NULL VARCHAR2(50)   	- 문의 제목
QNA_CONT    NOT NULL VARCHAR2(4000) 	- 문의 내용
QNA_DATE             DATE           	- 문의 날짜
QNA_STATUS  NOT NULL NUMBER         	- 문의 상태
QNA_YN               VARCHAR2(1)    	- 답변 여부
QNA_RE_CONT          VARCHAR2(4000) 	- 답변 내용
QNA_RE_DATE          DATE          		- 답변 날짜
GOODS_CODE  NOT NULL VARCHAR2(30)		- 상품 코드
*/

@Data
public class QnaDTO {
	
	private int qnaNo;			//문의번호
	private String memberId;	//회원 아이디 (이거 어캐가져옴?)
	private String qnaTitle;	//문의 제목
	private String qnaCont;		//문의 내용
	
//	@DateTimeFormat(pattern="yyyy-MM-dd")
	private String qnaDate;		//문의 날짜
	
	// 1아무나 9관리자와 작성자만
	private int qnaStatus;		//문의 상태 (비밀글 여부)
	
	// N답변준비중 Y답변완료 
	private String qnaYn;		//답변 여부
	private String qnaReCont;	//답변 내용
	
	private Date qnaReDate;		//답변 날짜
	private String goodsCode;	//상품 코드
	
	
	
	

	
	

}
