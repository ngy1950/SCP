package namgiyun.home.reservation.domain;

import java.sql.*;

public class Reservation {
	private int resvNum;
	private Date resvCheckIn;
	private Date resvCheckOut;
	private int resvGuest;
	private int resvCost;
	private int hotelExtrafee;
	private String resvName;
	private String resvEmail;
	private String resvPhone;
	private String resvComment;
	private int hotelNum;
	private String resvState;
	private String payState;
	private String userId;
	private String userName;
	private String hotelName;
	private String hotelGuest;
	private String hostId;
	
	
	public Reservation(){}
	
	
	public String getHostId() {
		return hostId;
	}


	public void setHostId(String hostId) {
		this.hostId = hostId;
	}


	public int getHotelExtrafee() {
		return hotelExtrafee;
	}
	public void setHotelExtrafee(int hotelExtrafee) {
		this.hotelExtrafee = hotelExtrafee;
	}
	public String getHotelGuest() {
		return hotelGuest;
	}
	public void setHotelGuest(String hotelGuest) {
		this.hotelGuest = hotelGuest;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	public String getResvState() {
		return resvState;
	}
	public void setResvState(String resvState) {
		this.resvState = resvState;
	}
	public String getPayState() {
		return payState;
	}
	public void setPayState(String payState) {
		this.payState = payState;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getResvNum() {
		return resvNum;
	}
	public void setResvNum(int resvNum) {
		this.resvNum = resvNum;
	}
	public String getResvComment() {
		return resvComment;
	}
	public void setResvComment(String resvComment) {
		this.resvComment = resvComment;
	}
	public Date getResvCheckIn() {
		return resvCheckIn;
	}
	public void setResvCheckIn(Date resvCheckIn) {
		this.resvCheckIn = resvCheckIn;
	}
	public Date getResvCheckOut() {
		return resvCheckOut;
	}
	public void setResvCheckOut(Date resvCheckOut) {
		this.resvCheckOut = resvCheckOut;
	}
	public int getResvGuest() {
		return resvGuest;
	}
	public void setResvGuest(int resvGuest) {
		this.resvGuest = resvGuest;
	}
	public int getResvCost() {
		return resvCost;
	}
	public void setResvCost(int resvCost) {
		this.resvCost = resvCost;
	}
	public String getResvName() {
		return resvName;
	}
	public void setResvName(String resvName) {
		this.resvName = resvName;
	}
	public String getResvEmail() {
		return resvEmail;
	}
	public void setResvEmail(String resvEmail) {
		this.resvEmail = resvEmail;
	}
	public String getResvPhone() {
		return resvPhone;
	}
	public void setResvPhone(String resvPhone) {
		this.resvPhone = resvPhone;
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
		return "Reservation [resvNum=" + resvNum + ", resvCheckIn="
				+ resvCheckIn + ", resvCheckOut=" + resvCheckOut
				+ ", resvGuest=" + resvGuest + ", resvCost=" + resvCost
				+ ", hotelExtrafee=" + hotelExtrafee + ", resvName=" + resvName
				+ ", resvEmail=" + resvEmail + ", resvPhone=" + resvPhone
				+ ", resvComment=" + resvComment + ", hotelNum=" + hotelNum
				+ ", resvState=" + resvState + ", payState=" + payState
				+ ", userId=" + userId + ", userName=" + userName
				+ ", hotelName=" + hotelName + ", hotelGuest=" + hotelGuest
				+ ", hostId=" + hostId + "]";
	}
}
