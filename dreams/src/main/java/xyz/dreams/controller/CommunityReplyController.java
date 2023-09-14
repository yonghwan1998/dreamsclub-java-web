package xyz.dreams.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import xyz.dreams.dto.CommunityReplyDTO;
import xyz.dreams.service.CommunityReplyService;

@RestController
@RequiredArgsConstructor
@RequestMapping("/reply")
public class CommunityReplyController {
	private final CommunityReplyService communityReplyService;
	
	/*댓글 등록*/
	@PostMapping("/register")
	public String register(@RequestBody CommunityReplyDTO reply) {
		System.out.println("****************************");
		System.out.println(reply);
		System.out.println("****************************");
		communityReplyService.addCommunityReply(reply);
		return "success";
	}
	
	/*댓글 출력 목록*/
	@GetMapping("/list/{commNo}")
	public List<CommunityReplyDTO> list(@PathVariable int commNo) throws Exception{
		return communityReplyService.getCommunityReplyList(commNo);
	}
	
	/*댓글 수정*/
	
	
	/*댓글 삭제*/
	
	
}
