package xyz.dreams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.NoticeDTO;
import xyz.dreams.mapper.NoticeMapper;

@Repository
@RequiredArgsConstructor
public class NoticeDAOImpl implements NoticeDAO {
	private final SqlSession sqlSession;

	@Override
	public int enrollNotice(NoticeDTO notice) {
		return sqlSession.getMapper(NoticeMapper.class).enrollNotice(notice);
	}

	@Override
	public List<NoticeDTO> getList() {
		return sqlSession.getMapper(NoticeMapper.class).getList();
	}

	@Override
	public NoticeDTO getPage(int noticeNo) {
		return sqlSession.getMapper(NoticeMapper.class).getPage(noticeNo);
	}

	@Override
	public int modifyNotice(NoticeDTO notice) {
		return sqlSession.getMapper(NoticeMapper.class).modifyNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return sqlSession.getMapper(NoticeMapper.class).deleteNotice(noticeNo);
	}

}
