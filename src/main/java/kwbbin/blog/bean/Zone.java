package kwbbin.blog.bean;

public class Zone {
	private Integer id;
	private String title;
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
	public Zone() {
		super();
	}
	public Zone(String title) {
		super();
		this.title = title;
	}
	@Override
	public String toString() {
		return "zone [id=" + id + ", title=" + title + "]";
	}
	
	
}
