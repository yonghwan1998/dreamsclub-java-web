package xyz.dreams.controller;

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
	
	/*게시판 글쓰기 페이지 접속*/
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String communityWrite() {
		return "community/community_write";
	}
	
	/*게시판 글 등록하기 - 김예지(2023.08.20)*/
	@RequestMapping(value = "write/add", method = RequestMethod.POST)
	public String communityWritePOST(@ModelAttribute CommunityDTO community, HttpSession session) throws Exception{
		communityService.enrollCommunity(community);		
		
		return "redirect:/community/detail?commNo="+community.getCommNo()+"&pageNum=&column=&keyword=";
	}
	
	
	/*게시판 수정 페이지 이동 - 김예지(2023.08.20)*/
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String communityModify(int commNo, Model model) throws Exception{
		model.addAttribute("pageInfo", communityService.getPage(commNo));
		
		return "community/community_modify";
	}

	
	/*페이지 수정 POST - 김예지(2023.09.07)*/
	//POST요청방식이고 리다이렉트로 주소를 반환해줄 것이기 때문에 
	//RedirectAttributes의 변수 rttr에 CommunityDTO의 값을 commModify로 지정해 사용.
	@RequestMapping(value = "/modify/add", method = RequestMethod.POST)
	public String communityModifyPOST(@ModelAttribute CommunityDTO community, HttpSession session, RedirectAttributes rttr) throws Exception{
	
		communityService.modifyCommunity(community);
		rttr.addFlashAttribute("commModify", community);
		
		return "redirect:/community/detail?commNo="+community.getCommNo();
	}

	
	
	/*페이지 삭제 - 김예지(2023.08.)*/
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
	
	
	/*김예지(2023.08.23)게시판 글 하나 보는 페이지 (조회)*/
	/*김예지(2023.09.17)- 게시글 당 댓글 수 카운팅 추가(게시물에 들어가면 댓글수가 업데이트되어 목록화면에서도 적용되도록한다.)*/
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String communityDetail(@RequestParam int commNo, Model model) {

		communityService.updateReplyCount(commNo); //댓글 수 카운팅

		CommunityDTO comm = communityService.getPage(commNo);
		model.addAttribute("pageInfo",comm);
				

		return "community/community_detail";
	}
	
	
	/*게시판 목록 페이지 접속*/
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
				
		model.addAttribute("result", communityService.getCommunityList(map));
		model.addAttribute("search", map);
		return "community/community_main";
	}	

}