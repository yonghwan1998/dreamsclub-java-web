package xyz.dreams.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CommunityReplyDTO;
import xyz.dreams.mapper.CommunityReplyMapper;

@Repository
@RequiredArgsConstructor
public class CommunityReplyDAOImpl implements CommunityReplyDAO {
	private final SqlSession sqlsession;

	/*김예지(2023.09.14) - 댓글 등록*/
	@Override
	public int insertCommunityReply(CommunityReplyDTO reply) {
		return sqlsession.getMapper(CommunityReplyMapper.class).insertCommunityReply(reply);
	}

	/*김예지(2023.09.13) - 댓글 목록 : 게시판 번호를 가져와서 댓글을 나열한다.*/
	@Override
	public List<CommunityReplyDTO> selectCommunityReply(int commNo) {
		return sqlsession.getMapper(CommunityReplyMapper.class).selectCommunityReply(commNo);
	}

	/*김예지(2023.09.15) - 댓글 삭제*/
	@Override
	public int deleteCommunityReply(int commReNo) {
		return sqlsession.getMapper(CommunityReplyMapper.class).deleteCommunityReply(commReNo);
	}

	/*김예지(2023.09.18) - 댓글 수정*/
	@Override
	public void updateCommunityReply(CommunityReplyDTO reply) {
		sqlsession.getMapper(CommunityReplyMapper.class).updateCommunityReply(reply);
	}

}
