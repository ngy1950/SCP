package namgiyun.home.review.domain;

import java.sql.*;

public class Review {
	private int revNum;
	private String revName;
	private String revContent;
	private Date revRegdate;
	private int revStar;
	private String userId;
	private String userName;
	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	private int hotelNum;
	
	public Review(){}

	public int getRevNum() {
		return revNum;
	}

	public void setRevNum(int revNum) {
		this.revNum = revNum;
	}

	public String getRevName() {
		return revName;
	}

	public void setRevName(String revName) {
		this.revName = revName;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public Date getRevRegdate() {
		return revRegdate;
	}

	public void setRevRegdate(Date revRegdate) {
		this.revRegdate = revRegdate;
	}

	public int getRevStar() {
		return revStar;
	}

	public void setRevStar(int revStar) {
		this.revStar = revStar;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getHotelNum() {
		return hotelNum;
	}

	public void setHotelNum(int hotelNum) {
		this.hotelNum = hotelNum;
	}

	@Override
	public String toString() {
		return "Review [revNum=" + revNum + ", revName=" + revName
				+ ", revContent=" + revContent + ", revRegdate=" + revRegdate
				+ ", revStar=" + revStar + ", userId=" + userId + ", userName="
				+ userName + ", hotelNum=" + hotelNum + "]";
	}


	
}
