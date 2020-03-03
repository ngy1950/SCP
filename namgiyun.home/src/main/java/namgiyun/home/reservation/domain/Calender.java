package namgiyun.home.reservation.domain;

public class Calender {
	
	private String resvCheckIn;
	private String resvCheckOut;
	private String resvName;
	private String resvPhone;
	
	public String getResvCheckIn() {
		return resvCheckIn;
	}
	public void setResvCheckIn(String resvCheckIn) {
		this.resvCheckIn = resvCheckIn;
	}
	public String getResvChekOut() {
		return resvCheckOut;
	}
	public void setResvChekOut(String resvChekOut) {
		this.resvCheckOut = resvChekOut;
	}
	public String getResvCheckOut() {
		return resvCheckOut;
	}
	public void setResvCheckOut(String resvCheckOut) {
		this.resvCheckOut = resvCheckOut;
	}
	public String getResvName() {
		return resvName;
	}
	public void setResvName(String resvName) {
		this.resvName = resvName;
	}
	public String getResvPhone() {
		return resvPhone;
	}
	public void setResvPhone(String resvPhone) {
		this.resvPhone = resvPhone;
	}
	
	@Override
	public String toString() {
		return "Calender [resvCheckIn=" + resvCheckIn + ", resvChekOut="
				+ resvCheckOut + "]";
	}
	
	
}
