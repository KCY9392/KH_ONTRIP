package com.ontrip.reservation.vo;

import java.sql.Date;

public class Reservation {
	
    private Integer rnCode; //예약 코드
    private int placeCode; // 시설 코드
    private int memberNo; // 회원 번호
    private String rnName;; // 예약자 명
    private int rnAdult; // 인원(성인) 수
    private int rnChild; // 인원(어린이) 수
    private int rnCount; // 객실 수
    private String rnRoomType; // 객실타입
    private String rnPhoneNumber; // 예약자 휴대폰 번호
    private java.sql.Date rnCheckIn; // 체크인 날짜
    private java.sql.Date rnCheckOut; // 체크아웃 날짜
    private java.sql.Date rnDate; // 예약한 날짜
    private String rnStatus; // 삭제 여부(N, Y)

	//결제수단 , 결제정보 , 카테고리코드  삭제

    public Reservation() {
    }
	public Reservation(Integer rnCode, int placeCode, int memberNo, String rnName, int rnAdult, int rnChild, int rnCount, String rnRoomType, String rnPhoneNumber, Date rnCheckIn, Date rnCheckOut, Date rnDate, String rnStatus) {
		this.rnCode = rnCode;
		this.placeCode = placeCode;
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
	}

	public Integer getRnCode() {
		return rnCode;
	}

	public void setRnCode(Integer rnCode) {
		this.rnCode = rnCode;
	}

	public int getPlaceCode() {
		return placeCode;
	}

	public void setPlaceCode(int placeCode) {
		this.placeCode = placeCode;
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

	@Override
	public String toString() {
		return "Reservation{" +
				"rnCode=" + rnCode +
				", placeCode=" + placeCode +
				", memberNo=" + memberNo +
				", rnName='" + rnName + '\'' +
				", rnAdult=" + rnAdult +
				", rnChild=" + rnChild +
				", rnCount=" + rnCount +
				", rnRoomType='" + rnRoomType + '\'' +
				", rnPhoneNumber='" + rnPhoneNumber + '\'' +
				", rnCheckIn=" + rnCheckIn +
				", rnCheckOut=" + rnCheckOut +
				", rnDate=" + rnDate +
				", rnStatus='" + rnStatus + '\'' +
				'}';
	}
}
