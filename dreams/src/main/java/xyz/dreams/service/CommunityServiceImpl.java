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
	private final SqlSession sqlsession;

	/*게시판 글 등록하기*/	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void enrollCommunity(CommunityDTO community) {
		community.setCommTitle(HtmlUtils.htmlEscape(community.getCommTitle()));
		community.setCommCont(HtmlUtils.htmlEscape(community.getCommCont()));
		//community.setCommCont(community.getCommCont().replace("\r\n","<br>"));
		communityDAO.enrollCommunity(community);
	}

	
	/*게시판 글 수정하기*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void modifyCommunity(CommunityDTO community) {
		
		community.setCommTitle(HtmlUtils.htmlEscape(community.getCommTitle()));
		community.setCommCont(HtmlUtils.htmlEscape(community.getCommCont()));
		communityDAO.modifyCommunity(community);
	}
	

	/*게시판 글 삭제*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteCommunity(int commNo) {
		
		communityDAO.deleteCommunity(commNo);
	}
	

	/*게시판 글 조회(글 1개)*/
	@Transactional(rollbackFor = Exception.class)
	@Override
	public CommunityDTO getPage(int communityNo) {
		CommunityDTO comm = communityDAO.getPage(communityNo);
		
		//조회수 +1
		communityDAO.upCountCommunity(communityNo);
		
		return communityDAO.getPage(communityNo);
	}

	
	/*게시글 조회수 증가*/
	@Override
	public void upCountCommunity(int commNo) {
		communityDAO.upCountCommunity(commNo);
	}
	

	/*목록보기 + 페이징 처리*/
	@Override
	public Map<String, Object> getCommunityList(int pageNum) {
		int totalBoard=communityDAO.selectCommunityCount();
		int pageSize=10;//하나의 페이지에 출력될 게시글의 갯수 저장
		int blockSize=10;//하나의 블럭에 출력될 페이지의 갯수 저장
		
		//Pager 클래스로 객체를 생성하여 저장 - 생성자 매개변수에 페이징 처리 관련 값을 전달
		// => Pager 객체 : 페이징 처리 관련 값이 저장된 객체
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		//FileBoardDAO 클래스의 selectFileBoardList() 메소드를 호출하기 위해 매개변수에 전달하여
		//저장될 Map 객체(시작 행번호, 종료 행번호) 생성
		Map<String, Object> pageMap=new HashMap<String, Object>();
		pageMap.put("startRow", pager.getStartRow());
		pageMap.put("endRow", pager.getEndRow());
		List<CommunityDTO> communityList=communityDAO.selectCommunityList(pageMap);
		
		//Controller 클래스에게 제공되는 데이타 처리 결과값을 반환하기 위한 Map 객체 생성
		Map<String, Object> resultMap=new HashMap<String, Object>();
		resultMap.put("pager", pager);
		resultMap.put("communityList", communityList);
		
		return resultMap;
	}
	

	
}