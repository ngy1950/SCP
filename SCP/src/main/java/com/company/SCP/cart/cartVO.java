package com.company.SCP.cart;

public class cartVO {
	private int pcode;
	private String id;
	private int orderNum;
	private int price;
	private int poption;
	private String pname;
	private String size;
	private String color;
	private int margin;
	private String imgpath;
	
	
	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getMargin() {
		return margin;
	}

	public void setMargin(int margin) {
		this.margin = margin;
	}

	public int getPcode() {
		return pcode;
	}

	@Override
	public String toString() {
		return "cartVO [pcode=" + pcode + ", id=" + id + ", orderNum=" + orderNum + ", price=" + price + ", poption="
				+ poption + ", pname=" + pname + ", size=" + size + ", color=" + color + ", margin=" + margin + "]";
	}

	public void setPcode(int pcode) {
		this.pcode = pcode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPoption() {
		return poption;
	}

	public void setPoption(int poption) {
		this.poption = poption;
	}

	
}
