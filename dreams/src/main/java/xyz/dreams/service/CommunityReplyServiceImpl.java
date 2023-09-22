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

	/*김예지(2023.09.14) - 댓글 등록*/
	@Override
	public void addCommunityReply(CommunityReplyDTO reply) {
		if(memberDAO.selectMember(reply.getMemberId())==null) {
			new IllegalArgumentException("로그인 후 댓글을 작성할 수 있습니다.");
		}
		//사용자로부터 입력 받은 데이터를 HTML 문서에 표시할 때, 
		//입력 데이터에 포함된 HTML 태그나 특수 문자를 이스케이프하여 보안 문제나 렌더링 문제를 방지하기 위해 사용
		//한마디로 사용자가 입력한 문자 그대로(특수문자포함) db에저장했다가 다시 그대로 가져나오기 위해 사용.
		reply.setCommReCont(HtmlUtils.htmlEscape(reply.getCommReCont()));
		communityReplyDAO.insertCommunityReply(reply);
	}

	/*김예지(2023.09.14) - 댓글 목록 : 게시판 번호를 가져와서 댓글을 나열한다.*/
	@Override
	public List<CommunityReplyDTO> getCommunityReplyList(int commNo) {
		//댓글테이블과 조인된 게시글 테이블의 번호가 null값인 경우 예외발생
		if(communityDAO.selectCommunityByCommNo(commNo)==null) {
			new IllegalArgumentException("게시글을 찾을 수 없습니다.");
		}
		return communityReplyDAO.selectCommunityReply(commNo);
	}

	/*김예지(2023.09.15) - 댓글 삭제 : commReNo만 맞으면 데이터값 모두 삭제*/
	@Override
	public int deleteCommunityReply(int commReNo) {
		int result = communityReplyDAO.deleteCommunityReply(commReNo);
		return result;
	}

	/*김예지(2023.09.18) - 댓글 수정*/
	@Override
	public void modifyCommunityReply(CommunityReplyDTO reply) {
		//사용자로부터 입력 받은 데이터를 HTML 문서에 표시할 때, 
		//입력 데이터에 포함된 HTML 태그나 특수 문자를 이스케이프하여 보안 문제나 렌더링 문제를 방지하기 위해 사용
		//한마디로 사용자가 입력한 문자 그대로(특수문자포함) db에저장했다가 다시 그대로 가져나오기 위해 사용.
		reply.setCommReCont(HtmlUtils.htmlEscape(reply.getCommReCont()));
		communityReplyDAO.updateCommunityReply(reply);
	}

}
