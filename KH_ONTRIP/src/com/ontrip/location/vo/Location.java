package com.ontrip.location.vo;

public class Location {
	
    private String localCode; // 지역코드(PK) // SQL : LOCAL_CODE // VARCHAR2(20)
    private String localName; // 지역이름     // SQL : LOCAL_NAME // VARCHAR2(20)
    
    public Location() {
    	
    }

	public String getLocalCode() {
		return localCode;
	}

	public void setLocalCode(String localCode) {
		this.localCode = localCode;
	}

	public String getLocalName() {
		return localName;
	}

	public void setLocalName(String localName) {
		this.localName = localName;
	}

	public Location(String localCode, String localName) {
		super();
		this.localCode = localCode;
		this.localName = localName;
	}

	@Override
	public String toString() {
		return "Location [localCode=" + localCode + ", localName=" + localName + "]";
	}
    
    
}
