package com.ontrip.payment.vo;

public class Payment {

    private int card_No; // 카드 후원 번호 // SQL : CARD_NO // NUMBER
    private String company; // 카드사 // SQL : COMPANY // VARCHAR2(100)
    private String card_Num; // 카드번호 // SQL : CARD_NUM // VARCHAR2(100)
    private String validity; // 카드유효기간 // SQL : VALIDITY // DATE
    
    public Payment() {
    	
    }

	public int getCard_No() {
		return card_No;
	}

	public void setCard_No(int card_No) {
		this.card_No = card_No;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getCard_Num() {
		return card_Num;
	}

	public void setCard_Num(String card_Num) {
		this.card_Num = card_Num;
	}

	public String getValidity() {
		return validity;
	}

	public void setValidity(String validity) {
		this.validity = validity;
	}

	public Payment(int card_No, String company, String card_Num, String validity) {
		super();
		this.card_No = card_No;
		this.company = company;
		this.card_Num = card_Num;
		this.validity = validity;
	}

	@Override
	public String toString() {
		return "Payment [card_No=" + card_No + ", company=" + company + ", card_Num=" + card_Num + ", validity="
				+ validity + "]";
	}
    
    

}
