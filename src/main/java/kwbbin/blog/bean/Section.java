package kwbbin.blog.bean;

public class Section {
	private Integer id;
	private String title;
	private  Integer zoneId;
	private String logo;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getZoneId() {
		return zoneId;
	}

	public void setZoneId(Integer zoneId) {
		this.zoneId = zoneId;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Section(String title, Integer zoneId, String logo) {
		super();
		this.title = title;
		this.zoneId = zoneId;
		this.logo = logo;
	}

	public Section(Integer id, String title, Integer zoneId, String logo) {
		this.id = id;
		this.title = title;
		this.zoneId = zoneId;
		this.logo = logo;
	}

	public Section() {
		super();
	}
	
	
}
