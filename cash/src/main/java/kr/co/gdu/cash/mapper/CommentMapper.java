package kr.co.gdu.cash.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Comment;

@Mapper
public interface CommentMapper {
	int insertComment(Comment comment);//댓글 추가
	int deleteComment(int commentId);//댓글 삭제
	int updateComment(Comment comment);//댓글 수정
	int deleteCommentAll(int noticeId);//댓글 전체 삭제
}
