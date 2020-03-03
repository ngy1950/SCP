package namgiyun.home.payment.domain;

import java.util.Date;

public class KaKao {
	private String tid, next_rediect_pc_url;
	private Date created_at;
	
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getNext_rediect_pc_url() {
		return next_rediect_pc_url;
	}
	public void setNext_rediect_pc_url(String next_rediect_pc_url) {
		this.next_rediect_pc_url = next_rediect_pc_url;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	
}
