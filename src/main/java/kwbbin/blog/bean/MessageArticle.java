package kwbbin.blog.bean;

import java.sql.Timestamp;


/**
 * 留言内容
 * */
public class MessageArticle {
	private int messageId;
	private int myuserId;
	private String myuserName;
	private String messageContent;
	private String logo;
	private Timestamp responseTime;
	private int messageGood;
	private int answerToMessage;
	private int answerToUser;
	public int getMessageId() {
		return messageId;
	}
	public int getMyuserId() {
		return myuserId;
	}
	public String getMyuserName() {
		return myuserName;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public String getLogo() {
		return logo;
	}
	public Timestamp getResponseTime() {
		return responseTime;
	}
	public int getMessageGood() {
		return messageGood;
	}
	public int getAnswerToMessage() {
		return answerToMessage;
	}
	public int getAnswerToUser() {
		return answerToUser;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public void setMyuserId(int myuserId) {
		this.myuserId = myuserId;
	}
	public void setMyuserName(String myuserName) {
		this.myuserName = myuserName;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public void setResponseTime(Timestamp responseTime) {
		this.responseTime = responseTime;
	}
	public void setMessageGood(int messageGood) {
		this.messageGood = messageGood;
	}
	public void setAnswerToMessage(int answerToMessage) {
		this.answerToMessage = answerToMessage;
	}
	public void setAnswerToUser(int answerToUser) {
		this.answerToUser = answerToUser;
	}
	public MessageArticle() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MessageArticle(int messageId, int myuserId, String myuserName,
			String messageContent, String logo, Timestamp responseTime,
			int messageGood, int answerToMessage, int answerToUser) {
		super();
		this.messageId = messageId;
		this.myuserId = myuserId;
		this.myuserName = myuserName;
		this.messageContent = messageContent;
		this.logo = logo;
		this.responseTime = responseTime;
		this.messageGood = messageGood;
		this.answerToMessage = answerToMessage;
		this.answerToUser = answerToUser;
	}
	@Override
	public String toString() {
		return "MessageArticle [messageId=" + messageId + ", myuserId="
				+ myuserId + ", myuserName=" + myuserName + ", messageContent="
				+ messageContent + ", logo=" + logo + ", responseTime="
				+ responseTime + ", messageGood=" + messageGood
				+ ", answerToMessage=" + answerToMessage + ", answerToUser="
				+ answerToUser + "]";
	}
	
	
}
