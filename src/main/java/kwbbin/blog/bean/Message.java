package kwbbin.blog.bean;

import java.util.Date;

public class Message {
	private Integer id;
	private String content;
	private Date responseTime;
	private Integer userId;
	private String userName;
	private int good;
	private int answerToMessage;
	private int answerToUser;
	public Message(String content, Date responseTime, Integer userId, int good,
			int answerToMessage, int answerToUser) {
		super();
		this.content = content;
		this.responseTime = responseTime;
		this.userId = userId;
		this.good = good;
		this.answerToMessage = answerToMessage;
		this.answerToUser = answerToUser;
	}

	public Message(Integer id, String content, Date responseTime, Integer userId,int good, int answerToMessage, int answerToUser) {
		this.id = id;
		this.content = content;
		this.responseTime = responseTime;
		this.userId = userId;
		this.good = good;
		this.answerToMessage = answerToMessage;
		this.answerToUser = answerToUser;
	}

	public Message(String content, Date responseTime, Integer userId) {
		this.content = content;
		this.responseTime = responseTime;
		this.userId = userId;
	}

	public Message() {
		super();
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getId() {
		return id;
	}
	public String getContent() {
		return content;
	}
	public Date getResponseTime() {
		return responseTime;
	}
	public Integer getUserId() {
		return userId;
	}
	public int getGood() {
		return good;
	}
	public int getAnswerToMessage() {
		return answerToMessage;
	}
	public int getAnswerToUser() {
		return answerToUser;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setResponseTime(Date responseTime) {
		this.responseTime = responseTime;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public void setAnswerToMessage(int answerToMessage) {
		this.answerToMessage = answerToMessage;
	}
	public void setAnswerToUser(int answerToUser) {
		this.answerToUser = answerToUser;
	}

	@Override
	public String toString() {
		return "Message{" +
				"id=" + id +
				", content='" + content + '\'' +
				", responseTime=" + responseTime +
				", userId=" + userId +
				", userName='" + userName + '\'' +
				", good=" + good +
				", answerToMessage=" + answerToMessage +
				", answerToUser=" + answerToUser +
				'}';
	}
}
