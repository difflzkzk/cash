package kr.co.gdu.cash.restMapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberRestMapper {
	public String selectMemberId(String id);//id 확인
	public String selectMemberPw(String pw);//pw 확인
}
