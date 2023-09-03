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
import org.springframework.web.util.HtmlUtils;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CommunityDTO;
import xyz.dreams.dto.MemberDTO;
import xyz.dreams.service.CommunityService;

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
	
	/*게시판 글 등록하기*/
	@RequestMapping(value = "write/add", method = RequestMethod.POST)
	public String communityWritePOST(@ModelAttribute CommunityDTO community, HttpSession session) throws Exception{
		communityService.enrollCommunity(community);
		
		return "redirect:/community";
	}
	
	
	/*게시판 수정 페이지 이동*/
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String communityModify(int commNo, Model model) throws Exception{
		model.addAttribute("pageInfo", communityService.getPage(commNo));
		
		return "community/community_modify";
	}
	
	/*페이지 수정 POST*/
	@RequestMapping(value = "/modify/add", method = RequestMethod.POST)
	public String communityModifyPOST(@ModelAttribute CommunityDTO community, HttpSession session) throws Exception{

		communityService.modifyCommunity(community);
		
		return "redirect:/community";
	}
	
	
	/*페이지 삭제*/
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
	
	
	/*게시판 글 하나 보는 페이지 (조회)*/
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String communityDetail(@RequestParam int commNo, Model model) {
		model.addAttribute("pageInfo",communityService.getPage(commNo));

		return "community/community_detail";
	}
	
	
	/*게시판 목록 페이지 접속*/
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String community(@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		Map<String, Object> map = communityService.getCommunityList(pageNum);
		
		model.addAttribute("pager", map.get("pager"));
		model.addAttribute("communityList", map.get("communityList"));
		
		return "community/community_main";
	}

}