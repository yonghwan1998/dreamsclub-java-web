package xyz.dreams.dto;


/*
이름          널?       유형             
----------- -------- -------------- 
QNA_NO      NOT NULL NUMBER         - 문의번호
MEMBER_ID   NOT NULL VARCHAR2(30)   - 회원 아이디
QNA_TITLE   NOT NULL VARCHAR2(50)   - 문의 제목
QNA_CONT    NOT NULL VARCHAR2(4000) - 문의 내용
QNA_DATE             DATE           - 문의 날짜
QNA_STATUS  NOT NULL NUMBER         - 문의 상태
QNA_YN               VARCHAR2(1)    - 답변 여부
QNA_RE_CONT          VARCHAR2(4000) - 답변 내용
QNA_RE_DATE          DATE           - 답변 날짜
GOODS_CODE  NOT NULL VARCHAR2(30)	- 상품 코드
*/

public class QnADTO {
	
	private int QnA_No;
	private String Member_ID;
	private String QnA_Title;
	
	

	
	

}
