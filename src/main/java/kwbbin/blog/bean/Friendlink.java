package kwbbin.blog.bean;

public class Friendlink {
	private Integer id;
	private String friendLink;
	private String name;
	public Friendlink() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Friendlink(String friendLink, String name) {
		super();
		this.friendLink = friendLink;
		this.name = name;
	}
	public Integer getId() {
		return id;
	}
	public String getFriendLink() {
		return friendLink;
	}
	public String getName() {
		return name;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setFriendLink(String friendLink) {
		this.friendLink = friendLink;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Friendlink [id=" + id + ", friendLink=" + friendLink
				+ ", name=" + name + "]";
	}
	
	
}
