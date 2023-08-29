package xyz.dreams.dao;

import java.util.List;

import xyz.dreams.dto.NoticeDTO;

public interface NoticeDAO {

	//공지사항 등록
	int enrollNotice(NoticeDTO notice);
	
	//공지사항 목록
	List<NoticeDTO> getList();
	
	//공지사항 글 하나 보기(조회)
	NoticeDTO getPage(int noticeNo);
	
	//공지사항 글 수정
	int modifyNotice(NoticeDTO notice);
	
	//공지사항 삭제 - 삭제 성공시 1반환, 실패시 0반환
	int deleteNotice(int noticeNo);
}
