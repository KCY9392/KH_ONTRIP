package com.ontrip.question.vo;

import java.util.Date;

public class Question {

    private int qCount;
    private String qCode;
    private String qContent;
    private String status;
    private String qTitle;
    private Date qDate;

    public Question() {
    	
    }

	public int getqCount() {
		return qCount;
	}

	public void setqCount(int qCount) {
		this.qCount = qCount;
	}

	public String getqCode() {
		return qCode;
	}

	public void setqCode(String qCode) {
		this.qCode = qCode;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
	}

	public Question(int qCount, String qCode, String qContent, String status, String qTitle, Date qDate) {
		super();
		this.qCount = qCount;
		this.qCode = qCode;
		this.qContent = qContent;
		this.status = status;
		this.qTitle = qTitle;
		this.qDate = qDate;
	}

	@Override
	public String toString() {
		return "Question [qCount=" + qCount + ", qCode=" + qCode + ", qContent=" + qContent + ", status=" + status
				+ ", qTitle=" + qTitle + ", qDate=" + qDate + "]";
	}
    
    
}
