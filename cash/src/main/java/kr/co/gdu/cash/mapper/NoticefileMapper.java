package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Noticefile;

@Mapper
public interface NoticefileMapper {
	int addNoticefile(Noticefile noticefile); // 파일 추가
	int deleteNoticefileOne(int noticefileId); // 파일 삭제
	List<String> selectNoticefileName(int noticeId); // 삭제할 리스트에 첨부된 파일이름들
	int deleteNoticefile(int noticeId); // 삭제할 리스트에 첨부된 파일 정보 삭제
	
}
