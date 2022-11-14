package com.ontrip.qna.vo;

import java.sql.Date;

public class Qna {

	private Integer qaCode;
	private String qaQuestion;
	private String qaAnswer;
	private String qaCategory;
	private Date qaUploadDate;
	private Date qaChangeDate;
	private String statue;


	public Qna() {

	}


	public Qna(int qaCode, String qaQuestion, String qaAnswer, String qaCategory, Date qaUploadDate, Date qaChangeDate, String statue) {
		this.qaCode = qaCode;
		this.qaQuestion = qaQuestion;
		this.qaAnswer = qaAnswer;
		this.qaCategory = qaCategory;
		this.qaUploadDate = qaUploadDate;
		this.qaChangeDate = qaChangeDate;
		this.statue = statue;
	}


	public int getQaCode() {
		return qaCode;
	}

	public void setQaCode(int qaCode) {
		this.qaCode = qaCode;
	}

	public String getQaQuestion() {
		return qaQuestion;
	}

	public void setQaQuestion(String qaQuestion) {
		this.qaQuestion = qaQuestion;
	}

	public String getQaAnswer() {
		return qaAnswer;
	}

	public void setQaAnswer(String qaAnswer) {
		this.qaAnswer = qaAnswer;
	}

	public String getQaCategory() {
		return qaCategory;
	}

	public void setQaCategory(String qaCategory) {
		this.qaCategory = qaCategory;
	}

	public Date getQaUploadDate() {
		return qaUploadDate;
	}

	public void setQaUploadDate(Date qaUploadDate) {
		this.qaUploadDate = qaUploadDate;
	}

	public Date getQaChangeDate() {
		return qaChangeDate;
	}

	public void setQaChangeDate(Date qaChangeDate) {
		this.qaChangeDate = qaChangeDate;
	}

	public String getStatue() {
		return statue;
	}

	public void setStatue(String statue) {
		this.statue = statue;
	}

	@Override
	public String toString() {
		return "Qna{" +
				"qaCode=" + qaCode +
				", qaQuestion='" + qaQuestion + '\'' +
				", qaAnswer='" + qaAnswer + '\'' +
				", qaCategory='" + qaCategory + '\'' +
				", qaUploadDate=" + qaUploadDate +
				", qaChangeDate=" + qaChangeDate +
				", statue='" + statue + '\'' +
				'}';
	}
}
