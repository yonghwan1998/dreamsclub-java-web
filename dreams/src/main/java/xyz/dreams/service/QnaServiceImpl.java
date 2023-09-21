package xyz.dreams.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.QnaDAO;
import xyz.dreams.dto.QnaDTO;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService {
	private final QnaDAO qnaDAO;
	
	/* 문의 등록하기*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void enrollQna(QnaDTO qna) {
		String[] qnaSplit = null;
		String qnaGoodsCode = qna.getGoodsCode();
		String qnaGoodsSize = qna.getGoodsSize();

		qnaSplit = qnaGoodsCode.split("-");

		qnaSplit[2] = qnaGoodsSize;

		qnaGoodsCode = qnaSplit[0] + "-" + qnaSplit[1] + "-" + qnaSplit[2];

		qna.setGoodsCode(qnaGoodsCode);

		qnaDAO.enrollQna(qna);
	}
	
	/* 수정하기 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void modifyQna(QnaDTO qna) {
		
		qna.setQnaTitle(qna.getQnaTitle());
		qna.setQnaCont(qna.getQnaCont());
		qnaDAO.modifyQna(qna);
	}
	
	/* 삭제하기 */
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteQna(int qnaNo) {
		
		qnaDAO.deleteQna(qnaNo);
	}

	
	
	
//	/* 페이징 처리 */
//	@Override
//	public Map<String, Object> getQnaList(int pageNum) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
	
	/* 오진서 9/19 - 목록보기 + 페이징 처리 */
	/*
	@Override
	public Map<String, Object> getQnaList(Map<String, Object> map) {
		int pageNum=1; //요청 페이지번호의 선언초기화 (무조건 1부터 시작)
		if(map.get("pageNum") != null && !map.get("pageNum").equals("")) {
			pageNum=Integer.parseInt((String)map.get("pageNum"));	//pageNum 타입을 Int로 변환
		}
		int totalBoard=qnaDAO.selectQnaCount();
		int pageSize=10;//하나의 페이지에 출력될 게시글의 갯수 저장
		int blockSize=10;//하나의 블럭에 출력될 페이지의 갯수 저장
		
		//Pager 클래스로 객체를 생성하여 저장 - 생성자 매개변수에 페이징 처리 관련 값을 전달
		// => Pager 객체 : 페이징 처리 관련 값이 저장된 객체
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		//FileBoardDAO 클래스의 selectFileBoardList() 메소드를 호출하기 위해 매개변수에 전달하여
		//저장될 Map 객체(시작 행번호, 종료 행번호) 생성
		map.put("startRow", pager.getStartRow());
		map.put("endRow", pager.getEndRow());
		List<QnaDTO> qnaList = qnaDAO.selectQnaList(map);
		
		//Controller 클래스에게 제공되는 데이타 처리 결과값을 반환하기 위한 Map 객체 생성
		Map<String, Object> resultMap=new HashMap<String, Object>();
		resultMap.put("pager", pager);
		resultMap.put("qnaList", qnaList);
		
		return resultMap;
	}
	*/
	
	// 9/20 오진서 - 용안선생님께서 만들래
	public List<QnaDTO> getQnaList(String goodsName) {
		return qnaDAO.selectQnaList(goodsName);
	}

}
