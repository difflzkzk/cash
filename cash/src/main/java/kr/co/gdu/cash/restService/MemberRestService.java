package kr.co.gdu.cash.restService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restMapper.MemberRestMapper;

@Service
@Transactional
public class MemberRestService {
	@Autowired private MemberRestMapper memberRestMapper;
	
	//회원 추가할 때 db에 아이디가 있는지 없는지 체크
	public String checkMemberId(String id) {
		return memberRestMapper.selectMemberId(id);
	}
	//회원 추가할 때 db에 패스워드가 있는지 없는지 체크
	public String checkMemberPw(String pw) {
		return memberRestMapper.selectMemberPw(pw);
	}
}
