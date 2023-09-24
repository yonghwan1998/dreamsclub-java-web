package xyz.dreams.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.util.HtmlUtils;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.CommunityDAO;
import xyz.dreams.dto.CommunityDTO;
import xyz.dreams.util.Pager;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService{
	private final CommunityDAO communityDAO;

	/*김예지(2023.08.28) - 게시판 글 등록하기*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void enrollCommunity(CommunityDTO community) {
		//community.setCommTitle(HtmlUtils.htmlEscape(community.getCommTitle()));
		//community.setCommCont(HtmlUtils.htmlEscape(community.getCommCont()));
		//community.setCommCont(community.getCommCont().replace("\r\n","<br>"));
		communityDAO.enrollCommunity(community);
	}

	
	/*김예지(2023.09.07) - 게시글 수정*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void modifyCommunity(CommunityDTO community) {
		
		//community.setCommTitle(HtmlUtils.htmlEscape(community.getCommTitle()));
		//community.setCommCont(HtmlUtils.htmlEscape(community.getCommCont()));
		communityDAO.modifyCommunity(community);
	}
	

	/*김예지(2023.08.30) - 게시글 삭제*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteCommunity(int commNo) {
		
		communityDAO.deleteCommunity(commNo);
	}
	

	/*김예지(2023.08.29) - 게시판 글 하나 보는 페이지 (조회)*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public CommunityDTO getPage(int communityNo) {
		CommunityDTO comm = communityDAO.getPage(communityNo);
		
		//김예지(2023.09.08 추가) - 조회수 증가
		communityDAO.upCountCommunity(communityNo);
		
		return communityDAO.getPage(communityNo);
	}

	
	/*김예지(2023.09.08) - 조회수 증가*/
	@Override
	public void upCountCommunity(int commNo) {
		communityDAO.upCountCommunity(commNo);
	}
	

	/*김예지(2023.08.27) - 게시판 목록 페이지 접속
	  김예지(2023.08.30) - 게시판 목록 페이징
	  김예지(2023.09.12) - 제목, 내용, 아이디 검색 추가	*/
	@Override
	public Map<String, Object> getCommunityList(Map<String, Object> map) {
		int pageNum=1; //요청 페이지번호의 선언초기화 (무조건 1부터 시작)
		if(map.get("pageNum") != null && !map.get("pageNum").equals("")) {
			pageNum=Integer.parseInt((String)map.get("pageNum"));	//pageNum 타입을 Int로 변환
		}
		int totalBoard=communityDAO.selectCommunityCount(map);
		int pageSize=10;//하나의 페이지에 출력될 게시글의 갯수 저장
		int blockSize=10;//하나의 블럭에 출력될 페이지의 갯수 저장
		
		//Pager 클래스로 객체를 생성하여 저장 - 생성자 매개변수에 페이징 처리 관련 값을 전달
		// => Pager 객체 : 페이징 처리 관련 값이 저장된 객체
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		//FileBoardDAO 클래스의 selectFileBoardList() 메소드를 호출하기 위해 매개변수에 전달하여
		//저장될 Map 객체(시작 행번호, 종료 행번호) 생성
		map.put("startRow", pager.getStartRow());
		map.put("endRow", pager.getEndRow());
		List<CommunityDTO> communityList=communityDAO.selectCommunityList(map);
		
		//Controller 클래스에게 제공되는 데이타 처리 결과값을 반환하기 위한 Map 객체 생성
		Map<String, Object> resultMap=new HashMap<String, Object>();
		resultMap.put("pager", pager);
		resultMap.put("communityList", communityList);
		
		return resultMap;
	}


	
	/*김예지(2023.09.17)- 게시글 당 댓글 수 카운팅*/
	@Override
	public void updateReplyCount(int commNo) {
		communityDAO.updateReplyCount(commNo);
	}


	/*김예지(2023.09.24) - 좋아요 수 카운트*/
	@Override
	public void likeCount(int commNo) {
		communityDAO.likeCount(commNo);
	}
	

	
}