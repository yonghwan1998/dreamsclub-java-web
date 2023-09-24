package xyz.dreams.controller;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import xyz.dreams.dto.CommunityDTO;
import xyz.dreams.dto.CommunityLikeDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.service.CommunityLikeService;
import xyz.dreams.service.CommunityService;

@RestController
@RequestMapping(value = "/like")
@RequiredArgsConstructor
@Slf4j
public class CommunityLikeController {
	private final CommunityLikeService communityLikeService;
	private final CommunityService communityService;

	/*빈하트 클릭시 하트 저장*/
	@ResponseBody
	@RequestMapping(value = "/saveHeart.do")
	public CommunityDTO save_heart(@RequestParam int commNo, HttpSession session) {
		CommunityLikeDTO to = new CommunityLikeDTO();
		
		//게시물 번호 셋팅
		to.setCommNo(commNo);
		
		//좋아요 누른 사람 memberId를 memberId로 셋팅
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String memberId = member.getMemberId();
		to.setMemberId(memberId);
		
		//+1된 하트 개수를 게시글에 담아오기 위해 설정
		CommunityDTO cto = communityLikeService.saveLike(to);
		
		//하트 총개수 담아오기
		communityService.likeCount(commNo);
		
		return cto;
	}
	
	
	/*꽉찬하트 클릭시 하트 해제*/
	@ResponseBody
	@RequestMapping(value = "/removeHeart.do")
	public CommunityDTO remove_heart(@RequestParam int commNo, HttpSession session) {
		CommunityLikeDTO to = new CommunityLikeDTO();
		
		//게시물 번호 셋팅
		to.setCommNo(commNo);
		
		//좋아요 누른 사람 memberId를 memberId로 셋팅
		MemberDTO member = (MemberDTO) session.getAttribute("member");
		String memberId = member.getMemberId();
		to.setMemberId(memberId);
		
		//-1된 하트 개수를 게시글에 담아오기 위해 설정
		CommunityDTO cto = communityLikeService.removeLike(to);
		
		//하트 총개수 담아오기
		communityService.likeCount(commNo);
		
		return cto;
	}
}
