package kr.co.gdu.cash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CommentService;
import kr.co.gdu.cash.vo.Comment;

@Controller
public class CommentController {
	@Autowired CommentService commentService;
	
	@PostMapping("/admin/addComment")
	public String addComment(Comment comment,
							@RequestParam(value="currentPage") int currentPage) {
		commentService.addComment(comment);
		return "redirect:/admin/noticeOne/"+comment.getNoticeId()+"/"+currentPage;
	}
	
	@GetMapping("/admin/removeComment")
	public String removeComment(@RequestParam(value="commentId") int commentId,
								@RequestParam(value="noticeId") int noticeId) {
		commentService.removeComment(commentId);
		return "redirect:/admin/noticeOne/"+noticeId+"/1";
	}
	
	@PostMapping("/admin/updateComment")
	public String updateComment(Comment comment,
								@RequestParam(value="currentPage") int currentPage) {
		commentService.updateComment(comment);
		return "redirect:/admin/noticeOne/"+comment.getNoticeId()+"/"+currentPage;
	}
}
