package com.company.SCP.pay;

public class payVO {
   private String payCode;
   private String payPrice;
   private String payDate;
   private String payNum;
   private String id;
   private String pcode;
   
   public String getPayCode() {
      return payCode;
   }
   public void setPayCode(String payCode) {
      this.payCode = payCode;
   }
   public String getPayPrice() {
      return payPrice;
   }
   public void setPayPrice(String payPrice) {
      this.payPrice = payPrice;
   }
   public String getPayDate() {
      return payDate;
   }
   public void setPayDate(String payDate) {
      this.payDate = payDate;
   }
   public String getPayNum() {
      return payNum;
   }
   public void setPayNum(String payNum) {
      this.payNum = payNum;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPcode() {
      return pcode;
   }
   public void setPcode(String pcode) {
      this.pcode = pcode;
   }
   
   @Override
   public String toString() {
      return "payVO [payCode=" + payCode + ", payPrice=" + payPrice + ", payDate=" + payDate + ", payNum=" + payNum
            + ", id=" + id + ", pcode=" + pcode + "]";
   }      
}