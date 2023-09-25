package xyz.dreams.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CommunityDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.service.CommunityService;
import xyz.dreams.util.Pager;

@Controller
@RequestMapping(value = "/community")
@RequiredArgsConstructor
public class CommunityController {
	private final CommunityService communityService;
	
	/*김예지(2023.08.28) - 게시판 글쓰기 페이지 접속*/
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String communityWrite() {
		return "community/community_write";
	}
	
	/*김예지(2023.08.28) - 게시판 글 등록하기*/
	@RequestMapping(value = "write/add", method = RequestMethod.POST)
	public String communityWritePOST(@ModelAttribute CommunityDTO community, HttpSession session) throws Exception{
		communityService.enrollCommunity(community);		
		
		//글 등록 후 방금 쓴 글을 바로 볼 수 있도록 글 조회 페이지로 이동
		return "redirect:/community/detail?commNo="+community.getCommNo()+"&pageNum=&column=&keyword=";
	}
	
	
	/*김예지(2023.09.07) - 게시판 수정 페이지 이동*/
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String communityModify(int commNo, Model model) throws Exception{
		//글 조회페이지에 있는 내용들을 그대로 수정 페이지에 담아와 수정할 수 있도록 값을 담아 pageInfo로 명명
		model.addAttribute("pageInfo", communityService.getPage(commNo));
		
		return "community/community_modify";
	}

	
	/*김예지(2023.09.07) - 게시글 수정 POST*/
	//POST요청방식이고 리다이렉트로 주소를 반환해줄 것이기 때문에 
	//RedirectAttributes의 변수 rttr에 CommunityDTO의 값을 commModify로 지정해 사용.
	@RequestMapping(value = "/modify/add", method = RequestMethod.POST)
	public String communityModifyPOST(@ModelAttribute CommunityDTO community, HttpSession session, RedirectAttributes rttr) throws Exception{
	
		communityService.modifyCommunity(community);
		rttr.addFlashAttribute("commModify", community);
		
		return "redirect:/community/detail?commNo="+community.getCommNo();
	}

	
	
	/*김예지(2023.08.30) - 게시글 삭제*/
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String communityDeleteGET(@RequestParam("commNo") int commNo, @ModelAttribute CommunityDTO communityDTO,
				HttpSession session) throws Exception{
		
		//로그인 세션 불러오기
		MemberDTO member = (MemberDTO)session.getAttribute("member");
		//DTO에 글쓴이 넣기
		communityDTO.setMemberId(member.getMemberId());
		
		communityService.deleteCommunity(commNo);
		
		return "redirect:/community";
	}
	
	
	/*김예지(2023.08.29) - 게시판 글 하나 보는 페이지 (조회) */
	/*김예지(2023.09.17) - 게시글 당 댓글 수 카운팅 추가(게시물에 들어가면 댓글수가 업데이트되어 목록화면에서도 적용되도록한다.)*/
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String communityDetail(@RequestParam int commNo, Model model) {

		communityService.updateReplyCount(commNo); //댓글 수 카운팅
		communityService.likeCount(commNo); //좋아요 수 카운트

		CommunityDTO comm = communityService.getPage(commNo);
		model.addAttribute("pageInfo",comm);
				

		return "community/community_detail";
	}
	
	
	/*김예지(2023.08.27) - 게시판 목록 페이지 접속
	 * 김예지(2023.08.30) - 게시판 목록 페이징
	 * 김예지(2023.09.12) - 제목, 내용, 아이디 검색 추가*/
	/*
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String community(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		Map<String, Object> map = communityService.getCommunityList(null);
		
		model.addAttribute("pager", map.get("pager"));
		model.addAttribute("communityList", map.get("communityList"));
		
		return "community/community_main";
		
		, method = RequestMethod.GET
		*/
	
	@RequestMapping(value = "")
	 public String community(@RequestParam Map<String, Object> map, Model model) {
		
		Map<String, Object> result = communityService.getCommunityList(map);
		
		//김예지(2023.09.25 추가) - community_main 화면 memberId 검사 및 수정
		List<CommunityDTO> communityList = (List<CommunityDTO>) result.get("communityList");
		for(CommunityDTO community : communityList) {
			String memberId = community.getMemberId();
			//memberId가 "naver" 또는 "kakao"로 시작하는 경우 첫번째 글자부터 7번째 글자까지만 출력
			if(memberId != null && (memberId.startsWith("naver")||memberId.startsWith("kakao"))) {
				community.setMemberId(memberId.substring(0,Math.min(memberId.length(), 10)));
			}
		}
				
		model.addAttribute("result", result);	//목록 출력 리스트
		model.addAttribute("search", map);	//검색
		return "community/community_main";
	}	

}