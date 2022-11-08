package com.ontrip.member.model.vo;

import java.util.Date;

public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String Gender;
	private String Phone;
	private Date BirthDate;
	private boolean Unregisiter;
	private Date EnrollDate;
	private Date ModifyDate;
	
	public Member() {
		
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getGender() {
		return Gender;
	}

	public void setGender(String gender) {
		Gender = gender;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public Date getBirthDate() {
		return BirthDate;
	}

	public void setBirthDate(Date birthDate) {
		BirthDate = birthDate;
	}

	public boolean isUnregisiter() {
		return Unregisiter;
	}

	public void setUnregisiter(boolean unregisiter) {
		Unregisiter = unregisiter;
	}

	public Date getEnrollDate() {
		return EnrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		EnrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return ModifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		ModifyDate = modifyDate;
	}

	public Member(int memberNo, String memberId, String memberPwd, String memberName, String gender, String phone,
			Date birthDate, boolean unregisiter, Date enrollDate, Date modifyDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		Gender = gender;
		Phone = phone;
		BirthDate = birthDate;
		Unregisiter = unregisiter;
		EnrollDate = enrollDate;
		ModifyDate = modifyDate;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
				+ memberName + ", Gender=" + Gender + ", Phone=" + Phone + ", BirthDate=" + BirthDate + ", Unregisiter="
				+ Unregisiter + ", EnrollDate=" + EnrollDate + ", ModifyDate=" + ModifyDate + "]";
	}
	


}
