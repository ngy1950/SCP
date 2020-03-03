package com.company.SCP.pdetail;

public class pdetailVO {
	@Override
	public String toString() {
		return "pdetailVO [pcode=" + pcode + ", poption=" + poption + ", price=" + price + ", pname=" + pname
				+ ", size=" + size + ", color=" + color + ", margin=" + margin + ", info1=" + info1 + ", info2=" + info2
				+ ", info3=" + info3 + ", info4=" + info4 + ", info5=" + info5 + "]";
	}
	private int pcode;
	private int poption;
	private int price;
	private String pname;
	private String size;
	private String color;
	private int margin;
	private String info1;
	private String info2;
	private String info3;
	private String info4;
	private String info5;
	
	public int getPcode() {return pcode;}
	public void setPcode(int pcode) {this.pcode = pcode;}
	
	public int getPoption() {return poption;}
	public void setPoption(int poption) {this.poption = poption;}
	
	public int getPrice() {return price;}
	public void setPrice(int pprice) {this.price = pprice;}
	
	public String getPname() {return pname;}
	public void setPname(String pname) {this.pname = pname;}
	
	public String getSize() {return size;}
	public void setSize(String size) {this.size = size;}
	
	public String getColor() {return color;}
	public void setColor(String color) {this.color = color;}
	
	public int getMargin() {return margin;}
	public void setMargin(int margin) {this.margin = margin;}
	
	public String getInfo1() {return info1;}
	public void setInfo1(String info1) {this.info1 = info1;}
	
	public String getInfo2() {return info2;}
	public void setInfo2(String info2) {this.info2 = info2;}
	
	public String getInfo3() {return info3;}
	public void setInfo3(String info3) {this.info3 = info3;}
	
	public String getInfo4() {return info4;}
	public void setInfo4(String info4) {this.info4 = info4;}
	
	public String getInfo5() {return info5;}
	public void setInfo5(String info5) {this.info5 = info5;}
}
