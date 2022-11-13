package com.ontrip.review.vo;

import java.util.Date;

public class Review {
	
	private int revCode;
	private int plcCode;
	private int memberNo;
	private Date revDate;
	private String revText;
	private String status;
	private Date revChangeDate;
	
	public Review() {
		
	}

	public Review(int revCode, int plcCode, int memberNo, Date revDate, String revText, String status,
			Date revChangeDate) {
		super();
		this.revCode = revCode;
		this.plcCode = plcCode;
		this.memberNo = memberNo;
		this.revDate = revDate;
		this.revText = revText;
		this.status = status;
		this.revChangeDate = revChangeDate;
	}

	public int getRevCode() {
		return revCode;
	}

	public void setRevCode(int revCode) {
		this.revCode = revCode;
	}

	public int getPlcCode() {
		return plcCode;
	}

	public void setPlcCode(int plcCode) {
		this.plcCode = plcCode;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Date getRevDate() {
		return revDate;
	}

	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}

	public String getRevText() {
		return revText;
	}

	public void setRevText(String revText) {
		this.revText = revText;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getRevChangeDate() {
		return revChangeDate;
	}

	public void setRevChangeDate(Date revChangeDate) {
		this.revChangeDate = revChangeDate;
	}

	@Override
	public String toString() {
		return "Review [revCode=" + revCode + ", plcCode=" + plcCode + ", memberNo=" + memberNo + ", revDate=" + revDate
				+ ", revText=" + revText + ", status=" + status + ", revChangeDate=" + revChangeDate + "]";
	}
	

}
