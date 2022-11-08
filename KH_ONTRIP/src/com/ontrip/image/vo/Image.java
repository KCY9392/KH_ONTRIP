package com.ontrip.image.vo;

import java.util.Date;

public class Image {

    private int fNo; // 파일번호(PK) // SQL : FILE_NO // NUMBER
    private String plcCode; // 시설코드(FK) // SQL : PLC_CODE // CHAR(2)
    private int rBno; // 참조게시글번호 // SQL : FILE_NAME // VARCHAR2(20)
    private String fName; // 파일명 // SQL : FILE_NAME // VARCHAR2(20)
    private String fPath; // 저장폴더경로 // SQL : FILE_PATH // VARCHAR2(100)
    private Date uploadDate; // 업로드일 // SQL : UPLOAD_DATE // DATE(SYSDATE)
    private int fLevel; // 파일레벨 // SQL : FILE_LEVEL // NUMBER
    private String iStatus; // 삭제여부 // SQL : IMG_STATUS // VARCHAR2(1) // DEFAULT 'N'
    
    public Image() {
    	
    }

	public int getfNo() {
		return fNo;
	}

	public void setfNo(int fNo) {
		this.fNo = fNo;
	}

	public String getPlcCode() {
		return plcCode;
	}

	public void setPlcCode(String plcCode) {
		this.plcCode = plcCode;
	}

	public int getrBno() {
		return rBno;
	}

	public void setrBno(int rBno) {
		this.rBno = rBno;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getfPath() {
		return fPath;
	}

	public void setfPath(String fPath) {
		this.fPath = fPath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getfLevel() {
		return fLevel;
	}

	public void setfLevel(int fLevel) {
		this.fLevel = fLevel;
	}

	public String getiStatus() {
		return iStatus;
	}

	public void setiStatus(String iStatus) {
		this.iStatus = iStatus;
	}

	@Override
	public String toString() {
		return "Image [fNo=" + fNo + ", plcCode=" + plcCode + ", rBno=" + rBno + ", fName=" + fName + ", fPath=" + fPath
				+ ", uploadDate=" + uploadDate + ", fLevel=" + fLevel + ", iStatus=" + iStatus + "]";
	}
    
    

}
