package kr.co.gdu.cash.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NoticeForm {
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private List<MultipartFile> noticefileList;
	private List<Comment> commentList;
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	public List<MultipartFile> getNoticefileList() {
		return noticefileList;
	}
	public void setNoticefileList(List<MultipartFile> noticefileList) {
		this.noticefileList = noticefileList;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	@Override
	public String toString() {
		return "NoticeForm [noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent + ", noticeDate="
				+ noticeDate + ", noticefileList=" + noticefileList + ", commentList=" + commentList + "]";
	}
}
