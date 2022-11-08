package com.ontrip.heart.vo;

import java.util.Date;

public class Heart {
	
    private int memberCode; // 회원번호 (PK) // SQL : MEM_NO2    // VARCHAR2(20)
    private int playCode;   // 시설코드 (FK) // SQL : PLC_CODE   // VARCHAR2(20)
    private Date heartDate; // 찜한날짜      // SQL : HEART_DATE // VARCHAR2(20)
    
    public Heart() {
    	
    }

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public int getPlayCode() {
		return playCode;
	}

	public void setPlayCode(int playCode) {
		this.playCode = playCode;
	}

	public Date getHeartDate() {
		return heartDate;
	}

	public void setHeartDate(Date heartDate) {
		this.heartDate = heartDate;
	}

	public Heart(int memberCode, int playCode, Date heartDate) {
		super();
		this.memberCode = memberCode;
		this.playCode = playCode;
		this.heartDate = heartDate;
	}

	@Override
	public String toString() {
		return "Heart [memberCode=" + memberCode + ", playCode=" + playCode + ", heartDate=" + heartDate + "]";
	}
    
    
}
