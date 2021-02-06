package kr.co.gdu.cash.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restService.MemberRestService;

@RestController
public class MemberRestController {
	@Autowired private MemberRestService memberRestService;
	
	//아이디 중복 체크
	@PostMapping("/admin/idCheck")
	public String idCheck(@RequestParam(value="id") String id) {
		String returnId = memberRestService.checkMemberId(id);
		if(returnId==null) {
			return "yes";
		}
		return "no";
	}
	//패스워드 중복 체크
	@PostMapping("/admin/pwCheck")
	public String pwCheck(@RequestParam(value="pw") String pw) {
		String returnPw = memberRestService.checkMemberId(pw);
		if(returnPw==null) {
			return "yes";
		}
		return "no";
	}
}
