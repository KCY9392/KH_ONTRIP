package com.ontrip.question.vo;

import java.sql.Date;

public class Question {

    private Integer qCode;
	// 성우  , Integer타입 변경
	private int memNo;
	private String qTitle;
	private String qContent;
	private Date qDate;
	private String aContent;
	private Integer qCount;
	private String status;

    public Question() {
    	
    }

	public Question(Integer qCode, int memNo, String qTitle, String qContent, Date qDate, String aContent, Integer qCount, String status) {
		this.qCode = qCode;
		this.memNo = memNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qDate = qDate;
		this.aContent = aContent;
		this.qCount = qCount;
		this.status = status;
	}


	public Integer getqCode() {
		return qCode;
	}

	public void setqCode(Integer qCode) {
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

	public Integer getqCount() {
		return qCount;
	}

	public void setqCount(Integer qCount) {
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
