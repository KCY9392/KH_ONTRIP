package com.ontrip.location.vo;

public class Location {
	
    private String localCode; // 지역코드(PK) // SQL : LOCAL_CODE // VARCHAR2(20)
    private String localName; // 지역이름     // SQL : LOCAL_NAME // VARCHAR2(20)
    private String localText; // 지역설명텍스트 // SQL : LOCAL_TEXT // VARCHAR2(100)
    
	public Location() {
    	
    }

	public Location(String localName, String localText) {
		super();
		this.localName = localName;
		this.localText = localText;
	}
    
    
    
	public Location(String localCode, String localName, String localText) {
		super();
		this.localCode = localCode;
		this.localName = localName;
		this.localText = localText;
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
	
	public String getLocalText() {
		return localText;
	}

	public void setLocalText(String localText) {
		this.localText = localText;
	}




	@Override
	public String toString() {
		return "Location [localCode=" + localCode + ", localName=" + localName + ", localText=" + localText + "]";
	}

	
    
}
