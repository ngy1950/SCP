package namgiyun.home.customerservice.domain;

public class CustomerService {
	private int custNum;
	private String custName;
	private String custContent;
	private String custRegDate;
	private int custCount;
	private String userId;
	
	public CustomerService() {}
	
	public CustomerService(String custName, String custContent, String userId){
		this.custName = custName;
		this.custContent = custContent;
		this.userId = userId;
	}
	
	
	
	public int getCustNum() {
		return custNum;
	}
	public void setCustNum(int custNum) {
		this.custNum = custNum;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustContent() {
		return custContent;
	}
	public void setCustContent(String custContent) {
		this.custContent = custContent;
	}
	public String getCustRegDate() {
		return custRegDate;
	}
	public void setCustRegDate(String custRegDate) {
		this.custRegDate = custRegDate;
	}
	public int getCustCount() {
		return custCount;
	}
	public void setCustCount(int custCount) {
		this.custCount = custCount;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
