package com.ontrip.price.vo;

public class Price {
    private String rnCode;
    private String pRoomType;
    private int price;
    
    public Price() {
    	
    }

	public String getRnCode() {
		return rnCode;
	}

	public void setRnCode(String rnCode) {
		this.rnCode = rnCode;
	}

	public String getpRoomType() {
		return pRoomType;
	}

	public void setpRoomType(String pRoomType) {
		this.pRoomType = pRoomType;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Price(String rnCode, String pRoomType, int price) {
		super();
		this.rnCode = rnCode;
		this.pRoomType = pRoomType;
		this.price = price;
	}

	@Override
	public String toString() {
		return "Price [rnCode=" + rnCode + ", pRoomType=" + pRoomType + ", price=" + price + "]";
	}
    
    
}
