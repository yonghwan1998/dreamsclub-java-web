package xyz.dreams.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.util.HtmlUtils;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.NoticeDAO;
import xyz.dreams.dto.NoticeDTO;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {
	private final NoticeDAO noticeDAO;
	private final SqlSession sqlsession;
	
	//이소영 : 공지사항 등록
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void enrollNotice(NoticeDTO notice) {
		//notice.setNoticeTitle(HtmlUtils.htmlEscape(notice.getNoticeTitle()));
	    //notice.setNoticeCont(HtmlUtils.htmlEscape(notice.getNoticeCont()));
		noticeDAO.enrollNotice(notice);
		
	}
	
	//이소영 : 공지사항 목록 보기
	@Transactional(rollbackFor = Exception.class)
	@Override
	public List<NoticeDTO> getList() {
		List<NoticeDTO> noticeList = noticeDAO.getList();
		return noticeDAO.getList();
	}
	
	//이소영 : 공지사항 글 조회
	@Transactional(rollbackFor = Exception.class)
	@Override
	public NoticeDTO getPage(int noticeNo) {
		
		return noticeDAO.getPage(noticeNo);
	}
	
	//이소영 : 공지사항 글 수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void modifyNotice(NoticeDTO notice) {
		
		noticeDAO.modifyNotice(notice);
	}
	
	//이소영 : 공지사항 글 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteNotice(int noticeNo) {
		noticeDAO.deleteNotice(noticeNo);
		
	}

}
