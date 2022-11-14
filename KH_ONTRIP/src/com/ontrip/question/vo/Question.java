package com.ontrip.question.vo;

import java.sql.Date;

public class Question {

    private int qCode;
	private int memNo;
	private String qTitle;
	private String qContent;
	private Date qDate;
	private String aContent;
	private int qCount;
	private String status;

    public Question() {
    	
    }

	public Question(int qCode, int memNo, String qTitle, String qContent, Date qDate, String aContent, int qCount, String status) {
		this.qCode = qCode;
		this.memNo = memNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.aContent = aContent;
		this.qCount = qCount;
		this.status = status;
	}

	public int getqCode() {
		return qCode;
	}

	public void setqCode(int qCode) {
		this.qCode = qCode;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public int getqCount() {
		return qCount;
	}

	public void setqCount(int qCount) {
		this.qCount = qCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Question{" +
				"qCode=" + qCode +
				", memNo=" + memNo +
				", qTitle='" + qTitle + '\'' +
				", qContent='" + qContent + '\'' +
				", qDate=" + qDate +
				", aContent='" + aContent + '\'' +
				", qCount=" + qCount +
				", status='" + status + '\'' +
				'}';
	}
}
