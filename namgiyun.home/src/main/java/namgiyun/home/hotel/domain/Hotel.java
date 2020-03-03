package namgiyun.home.hotel.domain;

import java.sql.Date;

public class Hotel {
	private int hotelNum;
	private int guest;
	private String bedRoom;
	private String bed;
	private String bathRoom;
	private String account;
	private String post;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private String hotelName;
	private String userId;
	private String hotelImg1;
	private String hotelImg2;
	private String hotelImg3;
	private int hotelCost;
	private int extraFee;
	private String rule;
	private boolean wifi;
	private boolean lounge;
	private boolean bathtub;
	private boolean fitness;
	private boolean parking;
	private boolean pool;
	private boolean tv;
	private boolean breakfast;
	private String etc;
	private String userName;
	private String resv_checkin = "19/12/17"; 
	private String resv_checkout = "19/12/17";

	public Hotel() {
	}
	public int getHotelNum() {
		return hotelNum;
	}

	public void setHotelNum(int hotelNum) {
		this.hotelNum = hotelNum;
	}
	public int getGuest() {
		return guest;
	}
	public void setGuest(int guest) {
		this.guest = guest;
	}
	public String getBedRoom() {
		return bedRoom;
	}
	public void setBedRoom(String bedRoom) {
		this.bedRoom = bedRoom;
	}
	public String getBed() {
		return bed;
	}
	public void setBed(String bed) {
		this.bed = bed;
	}
	public String getBathRoom() {
		return bathRoom;
	}
	public void setBathRoom(String bathRoom) {
		this.bathRoom = bathRoom;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getExtraAddress() {
		return extraAddress;
	}
	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getHotelName() {
		return hotelName;
	}
	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getHotelImg1() {
		return hotelImg1;
	}
	public void setHotelImg1(String hotelImg1) {
		this.hotelImg1 = hotelImg1;
	}
	public String getHotelImg2() {
		return hotelImg2;
	}
	public void setHotelImg2(String hotelImg2) {
		this.hotelImg2 = hotelImg2;
	}
	public String getHotelImg3() {
		return hotelImg3;
	}
	public void setHotelImg3(String hotelImg3) {
		this.hotelImg3 = hotelImg3;
	}
	public int getHotelCost() {
		return hotelCost;
	}
	public void setHotelCost(int hotelCost) {
		this.hotelCost = hotelCost;
	}
	public int getExtraFee() {
		return extraFee;
	}
	public void setExtraFee(int extraFee) {
		this.extraFee = extraFee;
	}
	public String getRule() {
		return rule;
	}
	public void setRule(String rule) {
		this.rule = rule;
	}
	public boolean isWifi() {
		return wifi;
	}
	public void setWifi(boolean wifi) {
		this.wifi = wifi;
	}
	public boolean isLounge() {
		return lounge;
	}
	public void setLounge(boolean lounge) {
		this.lounge = lounge;
	}
	public boolean isBathtub() {
		return bathtub;
	}
	public void setBathtub(boolean bathtub) {
		this.bathtub = bathtub;
	}
	public boolean isFitness() {
		return fitness;
	}
	public void setFitness(boolean fitness) {
		this.fitness = fitness;
	}
	public boolean isParking() {
		return parking;
	}
	public void setParking(boolean parking) {
		this.parking = parking;
	}
	public boolean isPool() {
		return pool;
	}
	public void setPool(boolean pool) {
		this.pool = pool;
	}
	public boolean isTv() {
		return tv;
	}
	public void setTv(boolean tv) {
		this.tv = tv;
	}
	public boolean isBreakfast() {
		return breakfast;
	}
	public void setBreakfast(boolean breakfast) {
		this.breakfast = breakfast;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getResv_checkin() {
		return resv_checkin;
	}
	public void setResv_checkin(String resv_checkin) {
		this.resv_checkin = resv_checkin;
	}
	public String getResv_checkout() {
		return resv_checkout;
	}
	public void setResv_checkout(String resv_checkout) {
		this.resv_checkout = resv_checkout;
	}
	@Override
	public String toString() {
		return "Hotel [hotelNum=" + hotelNum + ", guest=" + guest
				+ ", bedRoom=" + bedRoom + ", bed=" + bed + ", bathRoom="
				+ bathRoom + ", account=" + account + ", post=" + post
				+ ", address=" + address + ", detailAddress=" + detailAddress
				+ ", extraAddress=" + extraAddress + ", hotelName=" + hotelName
				+ ", userId=" + userId + ", hotelImg1=" + hotelImg1
				+ ", hotelImg2=" + hotelImg2 + ", hotelImg3=" + hotelImg3
				+ ", hotelCost=" + hotelCost + ", extraFee=" + extraFee
				+ ", rule=" + rule + ", wifi=" + wifi + ", lounge=" + lounge
				+ ", bathtub=" + bathtub + ", fitness=" + fitness
				+ ", parking=" + parking + ", pool=" + pool + ", tv=" + tv
				+ ", breakfast=" + breakfast + ", etc=" + etc + ", userName="
				+ userName + ", resv_checkin=" + resv_checkin
				+ ", resv_checkout=" + resv_checkout + "]";
	}
}