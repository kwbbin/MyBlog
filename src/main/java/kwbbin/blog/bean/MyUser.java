package kwbbin.blog.bean;

import java.util.Date;

public class MyUser {
	private Integer id;
	private String name;
	private String email;
	private String telephone;
	private String logo;
	private String password;
	private String sex;
	private int type;
	private Date joinTime;
	private String userNumber;
	public Integer getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getTelephone() {
		return telephone;
	}
	public String getLogo() {
		return logo;
	}
	public String getPassword() {
		return password;
	}
	public String getSex() {
		return sex;
	}
	public int getType() {
		return type;
	}
	public Date getJoinTime() {
		return joinTime;
	}
	public String getUserNumber() {
		return userNumber;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public void setType(int type) {
		this.type = type;
	}
	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}
	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}
	public MyUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyUser(String name, String email, String telephone, String logo,
			String password, String sex, int type, Date joinTime,
			String userNumber) {
		super();
		this.name = name;
		this.email = email;
		this.telephone = telephone;
		this.logo = logo;
		this.password = password;
		this.sex = sex;
		this.type = type;
		this.joinTime = joinTime;
		this.userNumber = userNumber;
	}
	@Override
	public String toString() {
		return "MyUser [id=" + id + ", name=" + name + ", email=" + email
				+ ", telephone=" + telephone + ", logo=" + logo + ", password="
				+ password + ", sex=" + sex + ", type=" + type + ", joinTime="
				+ joinTime + ", userNumber=" + userNumber + "]";
	}
	
	
	
}
