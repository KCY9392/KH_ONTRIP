package com.ontrip.review.vo;

import java.sql.Date;

public class Review {
	
	private int revCode;
	private int plcCode;
	private String memberId;
	private String memberName;
	private int memberNo;
	private java.sql.Date revDate;
	private String revText;
	private String status;
	private java.sql.Date revChangeDate;
	private String categoryName;
	private String placeName;
	private int reviewStar;
	private int review_c;      
    private int review_s;      
    private int review_p;


	public Review() {

	}
	public Review(int revCode, int plcCode, int memberNo, Date revDate, String revText, String status, Date revChangeDate, String categoryName) {
		this.revCode = revCode;
		this.plcCode = plcCode;
		this.memberNo = memberNo;
		this.revDate = revDate;
		this.revText = revText;
		this.status = status;
		this.revChangeDate = revChangeDate;
		this.categoryName = categoryName;
	}
	
	public Review(int revCode , String placeName , Date revDate, String memberName) {
		super();
		this.revCode = revCode;
		this.memberName = memberName;
		this.revDate = revDate;
		this.placeName = placeName;
	}
	public Review(int revCode, int plcCode, Date revDate, String memberName) {
		super();
		this.revCode = revCode;
		this.plcCode = plcCode;
		this.memberName = memberName;
		this.revDate = revDate;
	}
	
	public Review(String placeName , Date revDate , String memberName , int reviewStar , int review_c , int review_s , int review_p , String revText) {
		super();
		this.memberName = memberName;
		this.revDate = revDate;
		this.revText = revText;
		this.placeName = placeName;
		this.reviewStar = reviewStar;
		this.review_c = review_c;
		this.review_s = review_s;
		this.review_p = review_p;
	}
	
	public Review(String revText , int revCode) {
		super();
		this.revText = revText;
		this.revCode = revCode;
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
	
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}
	public int getReview_c() {
		return review_c;
	}
	public void setReview_c(int review_c) {
		this.review_c = review_c;
	}
	public int getReview_s() {
		return review_s;
	}
	public void setReview_s(int review_s) {
		this.review_s = review_s;
	}
	public int getReview_p() {
		return review_p;
	}
	public void setReview_p(int review_p) {
		this.review_p = review_p;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public void setPlcCode(int plcCode) {
		this.plcCode = plcCode;
	}

	public int getMemberNo() {
		return memberNo;
	}
	
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
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

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	@Override
	public String toString() {
		return "Review{" +
				"revCode=" + revCode +
				", plcCode=" + plcCode +
				", memberNo=" + memberNo +
				", revDate=" + revDate +
				", revText='" + revText + '\'' +
				", status='" + status + '\'' +
				", revChangeDate=" + revChangeDate +
				", categoryName='" + categoryName + '\'' +
				'}';
	}
}
