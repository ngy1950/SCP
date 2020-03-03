package namgiyun.home.recommend.domain;

public class Recommend {
	private int num;
	private String img;
	private String name;
	private String info;
	private String x;
	private String y;
	private String reason;
	private String userId;
	private int hotel_num;
	
	public Recommend(){}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getUserId() {
		return userId;
	}
 
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getHotel_num() {
		return hotel_num;
	}

	public void setHotel_num(int hotel_num) {
		this.hotel_num = hotel_num;
	}
	
	@Override
	public String toString() {
		return "payment [num=" + num + ", img=" + img
				+ ", name=" + name + ", info=" + info + ", x="
				+ x + ", y=" + y + ", reason=" + reason + ", userId=" 
				+ userId + ", hotel_num=" + hotel_num + "]";
	}
}
