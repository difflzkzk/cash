  
package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Notice;

@Mapper
public interface NoticeMapper {
	// index화면의 최근 5개공지를 보여주는 메서드
	List<Notice> selectLatestNoiceList();
	// 페이징 처리한 전체 공지 리스트
	List<Notice> selectNoticeListByPage(Map<String,Integer> map);
	//페이징 수정 폼
	Notice selectUpdateNotice(int noticeId);
	//총 댓글 수(댓글 페이징)
	int selectTotalComment(int noticeId);
	//공지 상세보기(댓글 페이징)
	Notice selectNoticeOne(Map<String, Integer> map);
	//공지 추가
	int addNoticeList(Notice notice);
	//공지 삭제
	int deleteNotice(int noticeId);
	int updateNotice(Notice notice);
	int totalList();
}