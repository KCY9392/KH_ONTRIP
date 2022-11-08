package com.ontrip.reservation.vo;

import java.util.Date;

public class Reservation {
	
    private String rnCode; //예약 코드
    private String placeCode; // 시설 코드
    private String categoryCode; // 카테고리 코드
    private int memberNo; // 회원 번호
    private String rnName;; // 예약자 명
    private int rnAdult; // 인원(성인) 수
    private int rnChild; // 인원(어린이) 수
    private int rnCount; // 객실 수
    private String rnRoomType; // 객실타입
    private String rnPhoneNumber; // 예약자 휴대폰 번호
    private Date rnCheckIn; // 체크인 날짜
    private Date rnCheckOut; // 체크아웃 날짜
    private Date rnDate; // 예약한 날짜
    private String rnStatus; // 삭제 여부(N, Y)
    private String payment; // 결제수단
    private int price; // 결제금액
    
    public Reservation() {
    	
    }

	public String getRnCode() {
		return rnCode;
	}

	public void setRnCode(String rnCode) {
		this.rnCode = rnCode;
	}

	public String getPlaceCode() {
		return placeCode;
	}

	public void setPlaceCode(String placeCode) {
		this.placeCode = placeCode;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getRnName() {
		return rnName;
	}

	public void setRnName(String rnName) {
		this.rnName = rnName;
	}

	public int getRnAdult() {
		return rnAdult;
	}

	public void setRnAdult(int rnAdult) {
		this.rnAdult = rnAdult;
	}

	public int getRnChild() {
		return rnChild;
	}

	public void setRnChild(int rnChild) {
		this.rnChild = rnChild;
	}

	public int getRnCount() {
		return rnCount;
	}

	public void setRnCount(int rnCount) {
		this.rnCount = rnCount;
	}

	public String getRnRoomType() {
		return rnRoomType;
	}

	public void setRnRoomType(String rnRoomType) {
		this.rnRoomType = rnRoomType;
	}

	public String getRnPhoneNumber() {
		return rnPhoneNumber;
	}

	public void setRnPhoneNumber(String rnPhoneNumber) {
		this.rnPhoneNumber = rnPhoneNumber;
	}

	public Date getRnCheckIn() {
		return rnCheckIn;
	}

	public void setRnCheckIn(Date rnCheckIn) {
		this.rnCheckIn = rnCheckIn;
	}

	public Date getRnCheckOut() {
		return rnCheckOut;
	}

	public void setRnCheckOut(Date rnCheckOut) {
		this.rnCheckOut = rnCheckOut;
	}

	public Date getRnDate() {
		return rnDate;
	}

	public void setRnDate(Date rnDate) {
		this.rnDate = rnDate;
	}

	public String getRnStatus() {
		return rnStatus;
	}

	public void setRnStatus(String rnStatus) {
		this.rnStatus = rnStatus;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Reservation(String rnCode, String placeCode, String categoryCode, int memberNo, String rnName, int rnAdult,
			int rnChild, int rnCount, String rnRoomType, String rnPhoneNumber, Date rnCheckIn, Date rnCheckOut,
			Date rnDate, String rnStatus, String payment, int price) {
		super();
		this.rnCode = rnCode;
		this.placeCode = placeCode;
		this.categoryCode = categoryCode;
		this.memberNo = memberNo;
		this.rnName = rnName;
		this.rnAdult = rnAdult;
		this.rnChild = rnChild;
		this.rnCount = rnCount;
		this.rnRoomType = rnRoomType;
		this.rnPhoneNumber = rnPhoneNumber;
		this.rnCheckIn = rnCheckIn;
		this.rnCheckOut = rnCheckOut;
		this.rnDate = rnDate;
		this.rnStatus = rnStatus;
		this.payment = payment;
		this.price = price;
	}

	@Override
	public String toString() {
		return "Reservation [rnCode=" + rnCode + ", placeCode=" + placeCode + ", categoryCode=" + categoryCode
				+ ", memberNo=" + memberNo + ", rnName=" + rnName + ", rnAdult=" + rnAdult + ", rnChild=" + rnChild
				+ ", rnCount=" + rnCount + ", rnRoomType=" + rnRoomType + ", rnPhoneNumber=" + rnPhoneNumber
				+ ", rnCheckIn=" + rnCheckIn + ", rnCheckOut=" + rnCheckOut + ", rnDate=" + rnDate + ", rnStatus="
				+ rnStatus + ", payment=" + payment + ", price=" + price + "]";
	}
    
    
}
