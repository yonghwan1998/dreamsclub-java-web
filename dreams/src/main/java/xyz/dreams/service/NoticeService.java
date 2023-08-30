package xyz.dreams.service;

import java.util.List;

import xyz.dreams.dto.NoticeDTO;

public interface NoticeService {

	//공지사항 등록
	void enrollNotice(NoticeDTO notice);
	
	//공지사항 목록
	List<NoticeDTO> getList();
	
	//공지사항 글 하나 보기(조회)
	NoticeDTO getPage(int noticeNo);
	
	//공지사항 글 수정
	void modifyNotice(NoticeDTO notice);
	
	//공지사항 삭제 - 삭제 성공시 1반환, 실패시 0반환
	void deleteNotice(int noticeNo);
}
