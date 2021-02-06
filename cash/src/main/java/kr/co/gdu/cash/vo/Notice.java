package kr.co.gdu.cash.vo;

import java.util.List;

public class Notice {
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private List<Noticefile> noticefileList;
	private List<Comment> commentList;
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
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
	public List<Noticefile> getNoticefileList() {
		return noticefileList;
	}
	public void setNoticefileList(List<Noticefile> noticefileList) {
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
		return "Notice [noticeId=" + noticeId + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", noticeDate=" + noticeDate + ", noticefileList=" + noticefileList + ", commentList=" + commentList
				+ "]";
	}
}
