package com.company.SCP.product;

import java.sql.Date;

public class productVO {
	private int pcode;
	private String pname;
	private int pprice;
	private Date pdate;
	private String ptext;
	private int sale;
	private String imgpath;
	private String imgpath2;
	@Override
	public String toString() {
		return "productVO [pcode=" + pcode + ", pname=" + pname + ", pprice=" + pprice + ", pdate=" + pdate + ", ptext="
				+ ptext + ", sale=" + sale + ", imgpath=" + imgpath + ", imgpath2=" + imgpath2 + ", category="
				+ category + "]";
	}
	private String category;
	public int getPcode() {
		return pcode;
	}
	public void setPcode(int pcode) {
		this.pcode = pcode;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public String getPtext() {
		return ptext;
	}
	public void setPtext(String ptext) {
		this.ptext = ptext;
	}
	public int getSale() {
		return sale;
	}
	public void setSale(int sale) {
		this.sale = sale;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getImgpath2() {
		return imgpath2;
	}
	public void setImgpath2(String imgpath2) {
		this.imgpath2 = imgpath2;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	
	
	
	
	
}
