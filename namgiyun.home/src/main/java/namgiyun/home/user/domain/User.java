package namgiyun.home.user.domain;

import java.util.Date;


public class User {
	private String userId;
	private String userPassword;
	private String userName;
	private String phone;
	private String email;
	private String birth;
	private Date regDate;
	
	public User() {}
	
	public User(String userId){
		this.userId = userId;
	}
	
	public User(String userId, String userName,String email, Date regDate){
		this.userId = userId;
		this.userName = userName;
		this.email = email;
		this.regDate = regDate;
	}
	
	public User(String userId, String userPassword){
		this.userId = userId;
		this.userPassword = userPassword;
	}
	
	public User(String userId, String userPassword, String userName, String phone, String email, String birth){
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.birth = birth;
	}
	
	public User(String userId,  String userPassword, String userName, Date regDate, String phone, String email, String birth){
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.phone = phone;
		this.email = email;
		this.birth = birth;
		this.regDate = regDate;
	}
	
	
	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPassword=" + userPassword
				+ ", userName=" + userName + ", phone=" + phone + ", email="
				+ email + ", birth=" + birth + ", regDate=" + regDate + "]";
	}
	
	
	
	
}
