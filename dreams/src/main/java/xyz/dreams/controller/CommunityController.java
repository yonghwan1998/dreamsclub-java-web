package xyz.dreams.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CommunityDTO;
import xyz.dreams.service.CommunityService;

@Controller
@RequestMapping(value = "/community")
@RequiredArgsConstructor
public class CommunityController {
	private final CommunityService communityService;

	/*게시판 목록 페이지 접속*/
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String community(Model model) {
		List<CommunityDTO> cList = communityService.getList();
		model.addAttribute("CommunityList", communityService.getList());
		
		return "community/community_main";
	}
	
	
	/*게시판 글 하나 보는 페이지 (조회)*/
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String community_detail(HttpServletRequest request, Model model) {
		
		int communtiyNo = Integer.parseInt(request.getParameter("commNo"));
		model.addAttribute("pageInfo", communityService.getPage(communtiyNo));
		
		return "community/community_detail";
	}
	
	/*게시판 글쓰기 페이지 접속*/
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String community_write() {
		return "community/community_write";
	}
	
	/*게시판 등록하기*/
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String communityWritePOST(CommunityDTO community, RedirectAttributes rttr) {
				
		communityService.enrollCommunity(community);
		
		//등록성공 경고창 구현
		rttr.addFlashAttribute("result", "enroll success");
		
		return "redirect:/community";
	}
	
	/*게시판 수정 페이지 이동*/
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String communityModify(int commNo, Model model) {
		
		model.addAttribute("pageInfo", communityService.getPage(commNo));
		
		return null;
	}
	
	/*페이지 수정*/
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String communityModifyPOST(CommunityDTO community, RedirectAttributes rttr) {
		
		communityService.modifyCommunity(community);
		
		return "redirect:/community";
	}
}