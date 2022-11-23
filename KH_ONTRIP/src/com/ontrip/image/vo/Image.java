package com.ontrip.image.vo;

import java.util.Date;

public class Image {

    private int fileNo; // 파일번호(PK) // SQL : FILE_NO // NUMBER
    private int plcCode; // 시설코드(FK) // SQL : PLC_CODE // CHAR(2)
    private String originName;
    private String changeName;
    private String filePath; // 저장폴더경로 // SQL : FILE_PATH // VARCHAR2(100)
    private Date uploadDate; // 업로드일 // SQL : UPLOAD_DATE // DATE(SYSDATE)
    private int fileLevel; // 파일레벨 // SQL : FILE_LEVEL // NUMBER
    private String iStatus; // 삭제여부 // SQL : IMG_STATUS // VARCHAR2(1) // DEFAULT 'N'
    private String localCode;
    private String categoryCode;
    private String dareaCode;
    
    public Image() {
    	
    }

	public Image(int fileNo, int plcCode, String originName, String changeName, String filePath, Date uploadDate,
			int fileLevel, String iStatus, String localCode, String categoryCode, String dareaCode) {
		super();
		this.fileNo = fileNo;
		this.plcCode = plcCode;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.iStatus = iStatus;
		this.localCode = localCode;
		this.categoryCode = categoryCode;
		this.dareaCode = dareaCode;
	}

	public Image(String filePath, String originName) {
		super();
		this.originName = originName;
		this.filePath = filePath;
	}
	
	

	public Image(String filePath, String changeName, int fileNo) {
		super();
		this.filePath = filePath;
		this.changeName = changeName;
		this.fileNo = fileNo;
	}
	
	public Image(int fileNo , String filePath , String changeName) {
		super();
		this.fileNo = fileNo;
		this.filePath = filePath;
		this.changeName = changeName;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getPlcCode() {
		return plcCode;
	}

	public void setPlcCode(int plcCode) {
		this.plcCode = plcCode;
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

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public String getiStatus() {
		return iStatus;
	}

	public void setiStatus(String iStatus) {
		this.iStatus = iStatus;
	}

	public String getLocalCode() {
		return localCode;
	}

	public void setLocalCode(String localCode) {
		this.localCode = localCode;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	
	

	public String getDareaCode() {
		return dareaCode;
	}

	public void setDareaCode(String dareaCode) {
		this.dareaCode = dareaCode;
	}

	@Override
	public String toString() {
		return "Image [fileNo=" + fileNo + ", plcCode=" + plcCode + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel
				+ ", iStatus=" + iStatus + ", localCode=" + localCode + ", categoryCode=" + categoryCode
				+ ", dareaCode=" + dareaCode + "]";
	}

	
	
    
    

}
