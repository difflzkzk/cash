package kr.co.gdu.cash.vo;


public class Noticefile {
	private int noticefileId;
	private int noticeId;
	private String noticefileName;
	private String noticefileType;
	private int noticefileSize;
	public int getNoticefileId() {
		return noticefileId;
	}
	public void setNoticefileId(int noticefileId) {
		this.noticefileId = noticefileId;
	}
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getNoticefileName() {
		return noticefileName;
	}
	public void setNoticefileName(String noticefileName) {
		this.noticefileName = noticefileName;
	}
	public String getNoticefileType() {
		return noticefileType;
	}
	public void setNoticefileType(String noticefileType) {
		this.noticefileType = noticefileType;
	}
	public int getNoticefileSize() {
		return noticefileSize;
	}
	public void setNoticefileSize(int noticefileSize) {
		this.noticefileSize = noticefileSize;
	}
	@Override
	public String toString() {
		return "Noticefile [noticefileId=" + noticefileId + ", noticeId=" + noticeId + ", noticefileName="
				+ noticefileName + ", noticefileType=" + noticefileType + ", noticefileSize=" + noticefileSize + "]";
	}
}
