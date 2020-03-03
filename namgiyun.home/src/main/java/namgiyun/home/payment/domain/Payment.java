package namgiyun.home.payment.domain;

public class Payment {
	private int resvNum;
	private String payType;
	private String payLastName;
	private String payFirstName;
	private String payNum;
	private String payCvv;
	private String payMonth;
	private String payYear;
	private String payAddress;
	private String payCountry;
	
	
	public int getResvNum() {
		return resvNum;
	}
	public void setResvNum(int resvNum) {
		this.resvNum = resvNum;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public String getPayLastName() {
		return payLastName;
	}
	public void setPayLastName(String payLastName) {
		this.payLastName = payLastName;
	}
	public String getPayFirstName() {
		return payFirstName;
	}
	public void setPayFirstName(String payFirstName) {
		this.payFirstName = payFirstName;
	}
	public String getPayNum() {
		return payNum;
	}
	public void setPayNum(String payNum) {
		this.payNum = payNum;
	}
	public String getPayCvv() {
		return payCvv;
	}
	public void setPayCvv(String payCvv) {
		this.payCvv = payCvv;
	}
	public String getPayMonth() {
		return payMonth;
	}
	public void setPayMonth(String payMonth) {
		this.payMonth = payMonth;
	}
	public String getPayYear() {
		return payYear;
	}
	public void setPayYear(String payYear) {
		this.payYear = payYear;
	}
	public String getPayAddress() {
		return payAddress;
	}
	public void setPayAddress(String payAddress) {
		this.payAddress = payAddress;
	}
	public String getPayCountry() {
		return payCountry;
	}
	public void setPayCountry(String payCountry) {
		this.payCountry = payCountry;
	}
	
	
	@Override
	public String toString() {
		return "Payment [resvNum=" + resvNum + ", payType=" + payType
				+ ", payLastName=" + payLastName + ", payFirstName="
				+ payFirstName + ", payNum=" + payNum + ", payCvv=" + payCvv
				+ ", payMonth=" + payMonth + ", payYear=" + payYear
				+ ", payAddress=" + payAddress + ", payCountry=" + payCountry
				+ "]";
	}
}
