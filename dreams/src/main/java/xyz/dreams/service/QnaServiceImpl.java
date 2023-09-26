package xyz.dreams.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.QnaDAO;
import xyz.dreams.dto.QnaDTO;
import xyz.dreams.util.Pager;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService {
	private final QnaDAO qnaDAO;
	
	/* 문의 등록하기*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public String enrollQna(QnaDTO qna) {
		
		String[] qnaSplit = null; // qnaSplit String문자열로[배열] = null
		
		// goodsCode = 모자 네 번째(name) - C(Code) - F(Size)
		// 배열		 		 		 [0]  -   [1]   -   [2]
		
		// 값을 변경해줄거니
		String qnaGoodsCode = qna.getGoodsCode(); // get GoodsCode 를 가져오고. qnaGoodsCode에 값을 넣음 // 원본
		
		//String qnaGoodsSize = null; // get GoodsSize 를 가져오고. qnaGoodsName에 값을 넣음
		String qnaGoodsSize = qna.getGoodsSize(); // get GoodsSize 를 가져오고. qnaGoodsSize에 값을 넣음

		qnaSplit = qnaGoodsCode.split("-"); // qnaGoodsCode에 .split("-")를 사용해 "-"를 나누고, qnaSlit에 저장
		//split() 함수: 문자열을 일정한 구분자로 잘라서 배열로 저장
	
		qnaSplit[2] = qnaGoodsSize; // qnaGoodsSize 에 Spblit[문자열2] 를 대입

		qnaGoodsCode = qnaSplit[0] + "-" + qnaSplit[1] + "-" + qnaSplit[2];
		// goodsName + "-" + goodsCode + "-" + goodsSize 를 qnaGoodsCode 에 다시 대입 
		// 설정했던걸 다시 합침

		qna.setGoodsCode(qnaGoodsCode);
		// set GoodsName(qnaGoodsCode) 설정완료

		qnaDAO.enrollQna(qna);
		
		return qnaSplit[0]; // goodsName을 다시 리턴. GoodsController 159번줄에서 다시 받음
	}
	
	/* 9/22 - 오진서 Q&A 답변하기 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public String addQnaReply(QnaDTO qna) {
		String qnaGoodsCode = qna.getGoodsCode();
		String[] qnaSplit = qnaGoodsCode.split("-");

		qnaDAO.addQnaReply(qna);
		
		return qnaSplit[0];
	}
	
	/* 삭제하기 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteQna(int qnaNo) {
		
		qnaDAO.deleteQna(qnaNo);
	}
	
	/* 
	- 오진서(생성) : 2023/09/19 : QnA리스트 출력
	
	- 방용환(수정) : 2023/09/23 : 페이징 처리
	*/
	@Override
	public Map<String, Object> getQnaList(int qnaPageNum, String goodsName) {
		int totalBoard = qnaDAO.selectQnaCount(goodsName);
		int pageSize = 10;// 하나의 페이지에 출력될 게시글의 갯수 저장
		int blockSize = 5;// 하나의 블럭에 출력될 페이지의 갯수 저장

		// Pager 클래스로 객체를 생성하여 저장 - 생성자 매개변수에 페이징 처리 관련 값을 전달
		// => Pager 객체 : 페이징 처리 관련 값이 저장된 객체
		Pager pager = new Pager(qnaPageNum, totalBoard, pageSize, blockSize);

		// FileBoardDAO 클래스의 selectFileBoardList() 메소드를 호출하기 위해 매개변수에 전달하여
		// 저장될 Map 객체(시작 행번호, 종료 행번호) 생성
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow", pager.getStartRow());
		map.put("endRow", pager.getEndRow());
		map.put("goodsName", goodsName);
		List<QnaDTO> qnaList = qnaDAO.selectQnaList(map);

		// Controller 클래스에게 제공되는 데이타 처리 결과값을 반환하기 위한 Map 객체 생성
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("qnaPager", pager);
		resultMap.put("qnaList", qnaList);

		return resultMap;
	}
	
	//이소영(추가) : 2023-09-21 - qna mypage list 
	public List<QnaDTO> findByMemberId(String memberId) {
		return qnaDAO.findByMemberId(memberId);
	}
}
