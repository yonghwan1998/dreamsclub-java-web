package xyz.dreams.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.CommunityLikeDAO;
import xyz.dreams.dto.CommunityDTO;
import xyz.dreams.dto.CommunityLikeDTO;

@Service
@RequiredArgsConstructor
public class CommunityLikeServiceImpl implements CommunityLikeService{
	private final CommunityLikeDAO communitylikeDAO;
	private final SqlSession sqlSession;

	/*좋아요 추가 - 김예지(2023.09.23)*/
	@Override
	public CommunityDTO saveLike(CommunityLikeDTO to) {
		//comunity 테이블에 해당 게시물의 좋아요 수를 +1하기 위한 to 세팅
		CommunityDTO cto = new CommunityDTO();
		cto.setCommNo(to.getCommNo());
		
		//해당 게시물의 좋아요를 +1
		sqlSession.update("insert_like_up", cto);
		
		//community_like 테이블에 추가
		int result = sqlSession.insert("insert_like_save", to);
		
		if(result == 1) {	// community_like 테이블에 새로운 좋아요 추가가 성공한다면..
			//갱신된 하트 개수를 가져옴
			cto = sqlSession.selectOne("LikeCnt", cto);
		}
		return cto;
	}

	/*좋아요 삭제 - 김예지(2023.09.23)*/
	@Override
	public CommunityDTO removeLike(CommunityLikeDTO to) {
		//comunity 테이블에 해당 게시물의 좋아요 수를 -1하기 위한 to 세팅
		CommunityDTO cto = new CommunityDTO();
		cto.setCommNo(to.getCommNo());
		
		//해당 게시물의 좋아요를 -1
		sqlSession.update("delete_like_down", cto);
		
		//community_like 테이블에 추가
		int result = sqlSession.delete("delete_like_remove", to);
		
		if(result == 1) {	// community_like 테이블에 좋아요 삭제가 성공한다면..
			//갱신된 하트 개수를 가져옴
			cto = sqlSession.selectOne("LikeCnt", cto);
		}
		
		return cto;
	}

}
