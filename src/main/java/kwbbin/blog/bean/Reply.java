package kwbbin.blog.bean;

import java.util.Date;

public class Reply {
	private Integer id;
	private Date responseTime;
	private Integer userId;
	private int good;
	private String content;
	private Integer articleId;
	private int replyTo;
	public Reply() {
		super();
	}
	public Reply(Date responseTime, Integer userId, int good, String content,
			Integer articleId) {
		super();
		this.responseTime = responseTime;
		this.userId = userId;
		this.good = good;
		this.content = content;
		this.articleId = articleId;
		this.replyTo = replyTo;
	}
	@Override
	public String toString() {
		return "reply [id=" + id + ", responseTime=" + responseTime
				+ ", userId=" + userId + ", good=" + good + ", content="
				+ content + ", articleId=" + articleId + ", replyTo=" + replyTo
				+ "]";
	}
	
	
}
