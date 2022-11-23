package com.ontrip.score.vo;

public class Score {
	
	private int scoreCode;
    private int reviewCode; // 후기코드(PK)  // SQL : REV_CODE // VARCHAR2(20)
    private double reviewStar;    // 만족도        // SQL : REV_STAR // VARCHAR2(20)
    private double review_c;      // 청결          // SQL : REV_C    // VARCHAR2(20)
    private double review_s;      // 서비스        // SQL : REV_S    // VARCHAR2(20)
    private double review_p;      // 편의          // SQL : REV_P    // VARCHAR2(20)
    private String memberId;
    private int memberNo;
    
    public Score() {
    	
    }

	public int getScoreCode() {
		return scoreCode;
	}

	public void setScoreCode(int scoreCode) {
		this.scoreCode = scoreCode;
	}

	public int getReviewCode() {
		return reviewCode;
	}

	public void setReviewCode(int reviewCode) {
		this.reviewCode = reviewCode;
	}

	public double getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(double reviewStar) {
		this.reviewStar = reviewStar;
	}

	public double getReview_c() {
		return review_c;
	}

	public void setReview_c(double review_c) {
		this.review_c = review_c;
	}

	public double getReview_s() {
		return review_s;
	}

	public void setReview_s(double review_s) {
		this.review_s = review_s;
	}

	public double getReview_p() {
		return review_p;
	}

	public void setReview_p(double review_p) {
		this.review_p = review_p;
	}
	

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public Score(int scoreCode, int reviewCode, double reviewStar, double review_c, double review_s, double review_p) {
		super();
		this.scoreCode = scoreCode;
		this.reviewCode = reviewCode;
		this.reviewStar = reviewStar;
		this.review_c = review_c;
		this.review_s = review_s;
		this.review_p = review_p;
	}
	
	public Score(double reviewStar , double review_c , double review_s , double review_p , String memberId) {
		super();
		this.reviewStar = reviewStar;
		this.review_c = review_c;
		this.review_s = review_s;
		this.review_p = review_p;
		this.memberId = memberId;
	}
	
	public Score(double reviewStar , double review_c , double review_s , double review_p) {
		super();
		this.reviewStar = reviewStar;
		this.review_c = review_c;
		this.review_s = review_s;
		this.review_p = review_p;
	}
	
	public Score(double reviewStar , double review_c , double review_s , double review_p , int reviewCode) {
		super();
		this.reviewStar = reviewStar;
		this.review_c = review_c;
		this.review_s = review_s;
		this.review_p = review_p;
		this.reviewCode = reviewCode;
	}
	
	@Override
	public String toString() {
		return "Score [scoreCode=" + scoreCode + ", reviewCode=" + reviewCode + ", reviewStar=" + reviewStar
				+ ", review_c=" + review_c + ", review_s=" + review_s + ", review_p=" + review_p + ", memberId="
				+ memberId + "]";
	}
	
	

	
    
}
