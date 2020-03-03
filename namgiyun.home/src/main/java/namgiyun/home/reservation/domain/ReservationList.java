package namgiyun.home.reservation.domain;

public class ReservationList {
	private int resvNum;
	private String resvState;
	private String payState;
	public int getResvNum() {
		return resvNum;
	}
	public void setResvNum(int resvNum) {
		this.resvNum = resvNum;
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
	
	@Override
	public String toString() {
		return "ReservationList [resvNum=" + resvNum + ", resvState="
				+ resvState + ", payState=" + payState + "]";
	}
}
