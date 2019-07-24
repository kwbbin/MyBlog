package kwbbin.blog.bean;

import java.util.Date;

public class Article {
	private Integer id;
	private Date postedTime;
	private String title;
	private int good;
	private String content;
	private Integer sectionId;
	private String author;
	private String logo;
	private Integer replySum;//留言数量
	private Integer reading;//阅读量
	public Article() {
		super();
	}
	public Article(Date postedTime, String title, int good, String content,
			Integer sectionId, String author, String logo) {
		super();
		this.postedTime = postedTime;
		this.title = title;
		this.good = good;
		this.content = content;
		this.sectionId = sectionId;
		this.author = author;
		this.logo = logo;
	}

	public Article(Integer id, Date postedTime, String title, int good, String content,
				   Integer sectionId, String author, String logo, Integer replySum, Integer reading) {
		this.id = id;
		this.postedTime = postedTime;
		this.title = title;
		this.good = good;
		this.content = content;
		this.sectionId = sectionId;
		this.author = author;
		this.logo = logo;
		this.replySum = replySum;
		this.reading = reading;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getPostedTime() {
		return postedTime;
	}

	public void setPostedTime(Date postedTime) {
		this.postedTime = postedTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getSectionId() {
		return sectionId;
	}

	public void setSectionId(Integer sectionId) {
		this.sectionId = sectionId;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Integer getReplySum() {
		return replySum;
	}

	public void setReplySum(Integer replySum) {
		this.replySum = replySum;
	}

	public Integer getReading() {
		return reading;
	}

	public void setReading(Integer reading) {
		this.reading = reading;
	}

	@Override
	public String toString() {
		return "Article [id=" + id + ", postedTime=" + postedTime + ", title="
				+ title + ", good=" + good + ", content=" + content
				+ ", sectionId=" + sectionId + ", author=" + author + ", logo="
				+ logo + "]";
	}
	
	
}
