package namgiyun.home.hotel.domain;

public class HotelList {
	private int hotelNum;
	private String bedRoom;
	private String bed;
	private String hotelName;
	private String userId;
	private String hotelImg1;
	private double star = 0.0;
	
	public HotelList() {
	}
	public int getHotelNum() {
		return hotelNum;
	}
	public void setHotelNum(int hotelNum) {
		this.hotelNum = hotelNum;
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
	public double getStar() {
		return star;
	}
	public void setStar(double star) {
		this.star = star;
	}
	@Override
	public String toString() {
		return String.format("%.2f" ,star);
	}
}
