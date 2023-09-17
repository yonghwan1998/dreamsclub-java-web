package xyz.dreams.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dao.CommunityDAO;
import xyz.dreams.dao.CommunityReplyDAO;
import xyz.dreams.dao.MemberDAO;
import xyz.dreams.dto.CommunityReplyDTO;

@Service
@RequiredArgsConstructor
public class CommunityReplyServiceImpl implements CommunityReplyService{
	private final CommunityReplyDAO communityReplyDAO;
	private final CommunityDAO communityDAO;
	private final MemberDAO memberDAO;

	/*댓글 등록*/
	@Override
	public void addCommunityReply(CommunityReplyDTO reply) {
		if(memberDAO.selectMember(reply.getMemberId())==null) {
			new IllegalArgumentException("로그인 후 댓글을 작성할 수 있습니다.");
		}
		reply.setCommReCont(HtmlUtils.htmlEscape(reply.getCommReCont()));
		communityReplyDAO.insertCommunityReply(reply);
	}

	/*댓글 목록 출력*/
	@Override
	public List<CommunityReplyDTO> getCommunityReplyList(int commNo) {
		if(communityDAO.selectCommunityByCommNo(commNo)==null) {
			new IllegalArgumentException("게시글을 찾을 수 없습니다.");
		}
		return communityReplyDAO.selectCommunityReply(commNo);
	}

	/*댓글 삭제 - 김예지(2023.09.15): commReNo만 맞으면 데이터값 모두 삭제*/
	@Override
	public int deleteCommunityReply(int commReNo) {
		int result = communityReplyDAO.deleteCommunityReply(commReNo);
		return result;
	}

	/*댓글 수정 - 김예지(2023.09.17)*/
	@Override
	public void modifyCommunityReply(CommunityReplyDTO reply) {
		reply.setCommReCont(HtmlUtils.htmlEscape(reply.getCommReCont()));
		communityReplyDAO.updateCommunityReply(reply);
	}

}
