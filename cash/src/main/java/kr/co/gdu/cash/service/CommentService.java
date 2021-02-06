package kr.co.gdu.cash.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.vo.Comment;

@Service
@Transactional
public class CommentService {
	@Autowired CommentMapper commentMapper;
	
	//댓글 추가
	public void addComment(Comment comment) {
		comment.getCommentContent().replaceAll("(?i)<script", "&lt;script");//스크립트 방지
		commentMapper.insertComment(comment);
	}
	//댓글 삭제
	public void removeComment(int commentId) {
		commentMapper.deleteComment(commentId);
	}
	//댓글 수정
	public void updateComment(Comment comment) {
		comment.getCommentContent().replaceAll("(?i)<script", "&lt;script");
		commentMapper.updateComment(comment);
	}
}
