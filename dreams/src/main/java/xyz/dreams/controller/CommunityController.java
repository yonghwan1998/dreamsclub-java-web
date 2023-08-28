package xyz.dreams.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String communityDetail(HttpServletRequest request, Model model) {
		
		int communtiyNo = Integer.parseInt(request.getParameter("commNo"));
		model.addAttribute("pageInfo", communityService.getPage(communtiyNo));
		
		return "community/community_detail";
	}
	
	/*게시판 글쓰기 페이지 접속*/
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String communityWrite() {
		return "community/community_write";
	}
	
	/*게시판 등록하기*/
	@RequestMapping(value = "write/add", method = RequestMethod.POST)
	public String communityWritePOST(@ModelAttribute CommunityDTO community, HttpSession session) throws Exception{
		
		//세션 아이디값 가져오기(member객체로)
		session.getAttribute("memberId");
		communityService.enrollCommunity(community);
		
		//띄워쓰기, 줄바꿈등의 개행문자를 문자처리하여 DB에 저장하기
		community.setCommCont(community.getCommCont().replaceAll("\r\n", "<br>"));
		
		System.out.println(community.toString());
		
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
	
	/*페이지 삭제*/
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String communityDeleteGET(@RequestParam("commNo") int commNo) throws Exception{
		
		communityService.deleteCommunity(commNo);
		
		return "redirect:/community";
	}

}