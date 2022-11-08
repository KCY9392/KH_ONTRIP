package com.ontrip.score.vo;

public class Score {
	
    private String reviewCode; // 후기코드(PK)  // SQL : REV_CODE // VARCHAR2(20)
    private int reviewStar;    // 만족도        // SQL : REV_STAR // VARCHAR2(20)
    private int review_c;      // 청결          // SQL : REV_C    // VARCHAR2(20)
    private int review_s;      // 서비스        // SQL : REV_S    // VARCHAR2(20)
    private int review_p;      // 편의          // SQL : REV_P    // VARCHAR2(20)
    
    public Score() {
    	
    }

	public String getReviewCode() {
		return reviewCode;
	}

	public void setReviewCode(String reviewCode) {
		this.reviewCode = reviewCode;
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

	public Score(String reviewCode, int reviewStar, int review_c, int review_s, int review_p) {
		super();
		this.reviewCode = reviewCode;
		this.reviewStar = reviewStar;
		this.review_c = review_c;
		this.review_s = review_s;
		this.review_p = review_p;
	}

	@Override
	public String toString() {
		return "Score [reviewCode=" + reviewCode + ", reviewStar=" + reviewStar + ", review_c=" + review_c
				+ ", review_s=" + review_s + ", review_p=" + review_p + "]";
	}
    
    
}
