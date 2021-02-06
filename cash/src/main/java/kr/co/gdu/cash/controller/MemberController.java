package kr.co.gdu.cash.controller;

import kr.co.gdu.cash.vo.Member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.MemberService;

@Controller(value="memberController")//value 생략가능
@Scope("singleton") //생략가능
public class MemberController {
	@Autowired private MemberService memberService;
	
	@GetMapping("/admin/insertMember")
	public String insertMember() {
		return "insertMember";
	}
	
	@PostMapping("/admin/insertMember")
	public String insertMember(Member member) {
		memberService.setInsertMember(member);
		return "redirect:/admin/index"; //memberList , 같은 아이디 존재
	}
}
