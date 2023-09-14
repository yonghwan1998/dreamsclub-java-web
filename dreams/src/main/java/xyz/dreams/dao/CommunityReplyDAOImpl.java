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

	@Override
	public int insertCommunityReply(CommunityReplyDTO reply) {
		return sqlsession.getMapper(CommunityReplyMapper.class).insertCommunityReply(reply);
	}

	@Override
	public List<CommunityReplyDTO> selectCommunityReply(int commNo) {
		return sqlsession.getMapper(CommunityReplyMapper.class).selectCommunityReply(commNo);
	}

	@Override
	public int deleteCommunityReply(int commReNo) {
		return sqlsession.getMapper(CommunityReplyMapper.class).deleteCommunityReply(commReNo);
	}

	@Override
	public void updateCommunityReply(CommunityReplyDTO reply) {
		sqlsession.getMapper(CommunityReplyMapper.class).updateCommunityReply(reply);
	}

}
