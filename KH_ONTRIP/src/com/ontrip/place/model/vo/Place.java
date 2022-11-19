package com.ontrip.place.model.vo;

import java.util.Date;

public class Place {

    private int plcCode; // 시설코드(PK) // SQL : PLC_CODE // CHAR(2)
    private String categoryCode; // 카테고리코드(FK) // SQL : CATEGORY_ID // CHAR(2)
    private String localCode; // 지역코드(FK) // SQL : LOCAL_CODE // CHAR(2)
    private String dareaCode; // 상세지역코드(FK) // SQL : DA_CODE // CHAR(3)
    private String plcName; // 시설이름 // SQL : PLC_NAME // VARCHAR2(20)
    private String plcAddress; // 시설주소 // SQL : PLC_ADDRESS // VARCHAR2(50)
    private String plcText; // 시설설명텍스트 // SQL : PLC_TEXT // VARCHAR2(100)
    private String plcBname; // 시설대표자 // SQL : PLC_BNAME // VARCHAR2(20)

	private String plcPnumber; // 시설전화번호 // SQL : PLC_PNUMBER // VARCHAR2(13)
    private Date plcDate; // 시설등록날짜 // SQL : PLC_DATE // DATE(SYSDATE)
    private float plcLa; // 시설위도 // SQL : PLC_LA // NUMBER
    private float plcLo; // 시설경도 // SQL : PLC_LO // NUMBER
    private String status; // 삭제여부 // SQL : STATUS // VARCHAR2(1) // DEFAULT 'N'
    private String dareaName;
    
    public Place() {
    	
    }

    
    
    public Place(int plcCode, String categoryCode, String localCode, String dareaCode, String plcName,
			String plcAddress, String plcText, String plcBname, String plcPnumber, Date plcDate, float plcLa,
			float plcLo, String status, String dareaName) {
		super();
		this.plcCode = plcCode;
		this.categoryCode = categoryCode;
		this.localCode = localCode;
		this.dareaCode = dareaCode;
		this.plcName = plcName;
		this.plcAddress = plcAddress;
		this.plcText = plcText;
		this.plcBname = plcBname;
		this.plcPnumber = plcPnumber;
		this.plcDate = plcDate;
		this.plcLa = plcLa;
		this.plcLo = plcLo;
		this.status = status;
		this.dareaName = dareaName;
	}



	public Place(String plcName, String plcAddress, String plcPnumber) {
    	super();
    	this.plcName = plcName;
    	this.plcAddress = plcAddress;
    	this.plcPnumber = plcPnumber;
    }


	

	public Place(int plcCode, String categoryCode, String dareaCode,
			String plcAddress, String plcText, String plcBname, String plcPnumber, float plcLa, float plcLo) {
		super();
		this.plcCode = plcCode;
		this.categoryCode = categoryCode;
		this.dareaCode = dareaCode;
		this.plcAddress = plcAddress;
		this.plcText = plcText;
		this.plcBname = plcBname;
		this.plcPnumber = plcPnumber;
		this.plcLa = plcLa;
		this.plcLo = plcLo;
	}

	public Place(String categoryCode, String plcName, String plcAddress, String plcPnumber, String dareaName) {
	      super();
	      this.categoryCode = categoryCode;
	      this.plcName = plcName;
	      this.plcAddress = plcAddress;
	      this.plcPnumber = plcPnumber;
	      this.dareaName = dareaName;
	   }

	


	public int getPlcCode() {
		return plcCode;
	}



	public void setPlcCode(int plcCode) {
		this.plcCode = plcCode;
	}



	public String getCategoryCode() {
		return categoryCode;
	}






	public String getDareaName() {
		return dareaName;
	}



	public void setDareaName(String dareaName) {
		this.dareaName = dareaName;
	}



	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}



	public String getLocalCode() {
		return localCode;
	}



	public void setLocalCode(String localCode) {
		this.localCode = localCode;
	}



	public String getDareaCode() {
		return dareaCode;
	}



	public void setDareaCode(String dareaCode) {
		this.dareaCode = dareaCode;
	}



	public String getPlcName() {
		return plcName;
	}



	public void setPlcName(String plcName) {
		this.plcName = plcName;
	}



	public String getPlcAddress() {
		return plcAddress;
	}



	public void setPlcAddress(String plcAddress) {
		this.plcAddress = plcAddress;
	}



	public String getPlcText() {
		return plcText;
	}



	public void setPlcText(String plcText) {
		this.plcText = plcText;
	}



	public String getPlcBname() {
		return plcBname;
	}



	public void setPlcBname(String plcBname) {
		this.plcBname = plcBname;
	}



	public String getPlcPnumber() {
		return plcPnumber;
	}



	public void setPlcPnumber(String plcPnumber) {
		this.plcPnumber = plcPnumber;
	}



	public Date getPlcDate() {
		return plcDate;
	}



	public void setPlcDate(Date plcDate) {
		this.plcDate = plcDate;
	}



	public float getPlcLa() {
		return plcLa;
	}



	public void setPlcLa(float plcLa) {
		this.plcLa = plcLa;
	}



	public float getPlcLo() {
		return plcLo;
	}



	public void setPlcLo(float plcLo) {
		this.plcLo = plcLo;
	}



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	@Override
	public String toString() {
		return "Place [plcCode=" + plcCode + ", categoryCode=" + categoryCode + ", localCode=" + localCode
				+ ", dareaCode=" + dareaCode + ", plcName=" + plcName + ", plcAddress=" + plcAddress + ", plcText="
				+ plcText + ", plcBname=" + plcBname + ", plcPnumber=" + plcPnumber + ", plcDate=" + plcDate
				+ ", plcLa=" + plcLa + ", plcLo=" + plcLo + ", status=" + status + ", dareaName=" + dareaName + "]";
	}
}