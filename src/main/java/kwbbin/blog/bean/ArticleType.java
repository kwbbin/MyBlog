package kwbbin.blog.bean;

public class ArticleType {
	Integer id;
	String title;
	
	public ArticleType(String title) {
		super();
		this.title = title;
	}
	
	public ArticleType() {
		super();
	}

	@Override
	public String toString() {
		return "ArticleType [id=" + id + ", title=" + title + "]";
	}

	public Integer getId() {
		return id;
	}
	public String getTitle() {
		return title;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
}
