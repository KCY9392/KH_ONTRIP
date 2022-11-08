package com.ontrip.detailArea.vo;


public class DetailArea {
	
    private String dAreaCode; // 상세지역코드(PK) // SQL : DA_CODE    // VARCHAR2(20)
    private String dAreaName; // 지역코드 (FK)   // SQL : LOCAL_CODE // VARCHAR2(20)
    private String localCode; // 상세지역이름     // SQL : DA_NAME    // VARCHAR2(20)
	
    public DetailArea() {
    	
    }
    
    public DetailArea(String dAreaCode, String dAreaName, String localCode) {
		super();
		this.dAreaCode = dAreaCode;
		this.dAreaName = dAreaName;
		this.localCode = localCode;
	}


	public String getdAreaCode() {
		return dAreaCode;
	}


	public void setdAreaCode(String dAreaCode) {
		this.dAreaCode = dAreaCode;
	}


	public String getdAreaName() {
		return dAreaName;
	}


	public void setdAreaName(String dAreaName) {
		this.dAreaName = dAreaName;
	}


	public String getLocalCode() {
		return localCode;
	}


	public void setLocalCode(String localCode) {
		this.localCode = localCode;
	}


	@Override
	public String toString() {
		return "DetailArea [dAreaCode=" + dAreaCode + ", dAreaName=" + dAreaName + ", localCode=" + localCode + "]";
	}




}
