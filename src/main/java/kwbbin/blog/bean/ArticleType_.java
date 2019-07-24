package kwbbin.blog.bean;

public class ArticleType_ {
	int aid;
	int good;
	int articleType;
	String title;
	public int getAid() {
		return aid;
	}
	public int getGood() {
		return good;
	}
	public int getArticleType() {
		return articleType;
	}
	public String getTitle() {
		return title;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public void setArticleType(int articleType) {
		this.articleType = articleType;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public ArticleType_(int aid, int good, int articleType, String title) {
		super();
		this.aid = aid;
		this.good = good;
		this.articleType = articleType;
		this.title = title;
	}
	public ArticleType_() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ArticleType_ [aid=" + aid + ", good=" + good + ", articleType="
				+ articleType + ", title=" + title + "]";
	}
	
	
	
	
}
