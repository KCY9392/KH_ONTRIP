package com.ontrip.heart.vo;

import java.util.Date;

public class Heart {
	

	private int memberNo; // 회원번호 (PK) // SQL : MEM_NO2    // VARCHAR2(20)
    private int plcCode;   // 시설코드 (FK) // SQL : PLC_CODE   // VARCHAR2(20)
    private Date heartDate; // 찜한날짜      // SQL : HEART_DATE // VARCHAR2(20)
    private String categoryName;
    private String placeName;
    private String filePath;
    private String originName;
    private String changeName;
    public Heart() {
    	
    }

	public Heart(int memberNo, int placeCode, Date heartDate) {
		super();
		this.memberNo = memberNo;
		this.plcCode = placeCode;
		this.heartDate = heartDate;
	}


	
	public Heart(String categoryName, String placeName, Date heartDate, int placeCode, String filePath, String changeName) {
		super();
		this.categoryName = categoryName;
		this.placeName = placeName;
		this.heartDate = heartDate;
		this.plcCode = placeCode;
		this.filePath = filePath;
		this.changeName = changeName;
	}

	public Heart(int memberNo, int plcCode) {
		super();
		this.memberNo = memberNo;
		this.plcCode = plcCode;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getPlcCode() {
		return plcCode;
	}

	public void setPlcCode(int plcCode) {
		this.plcCode = plcCode;
	}

	public Date getHeartDate() {
		return heartDate;
	}

	public void setHeartDate(Date heartDate) {
		this.heartDate = heartDate;
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

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	
	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	@Override
	public String toString() {
		return "Heart [memberNo=" + memberNo + ", plcCode=" + plcCode + ", heartDate=" + heartDate + ", categoryName="
				+ categoryName + ", placeName=" + placeName + ", filePath=" + filePath + ", originName=" + originName
				+ ", changeName=" + changeName + "]";
	}


    
}
