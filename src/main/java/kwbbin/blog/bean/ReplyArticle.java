package kwbbin.blog.bean;

import java.sql.Timestamp;

public class ReplyArticle {
	private Integer replyId;
	private Integer myuserId;
	private String myuserName;
	private String replyContent;
	private String logo;
	private Timestamp responseTime;
	private int replyGood;
	private Integer replyTo;
	public Integer getReplyId() {
		return replyId;
	}
	public Integer getMyuserId() {
		return myuserId;
	}
	public String getMyuserName() {
		return myuserName;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public String getLogo() {
		return logo;
	}
	public Timestamp getResponseTime() {
		return responseTime;
	}
	public int getReplyGood() {
		return replyGood;
	}
	public Integer getReplyTo() {
		return replyTo;
	}
	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}
	public void setMyuserId(Integer myuserId) {
		this.myuserId = myuserId;
	}
	public void setMyuserName(String myuserName) {
		this.myuserName = myuserName;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public void setResponseTime(Timestamp responseTime) {
		this.responseTime = responseTime;
	}
	public void setReplyGood(int replyGood) {
		this.replyGood = replyGood;
	}
	public void setReplyTo(Integer replyTo) {
		this.replyTo = replyTo;
	}
	@Override
	public String toString() {
		return "ReplyArticle [replyId=" + replyId + ", myuserId=" + myuserId
				+ ", myuserName=" + myuserName + ", replyContent="
				+ replyContent + ", logo=" + logo + ", responseTime="
				+ responseTime + ", replyGood=" + replyGood + ", replyTo="
				+ replyTo + "]";
	}
	
	
}	
