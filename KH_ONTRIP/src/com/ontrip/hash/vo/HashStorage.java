package com.ontrip.hash.vo;

public class HashStorage {
	
    private String plcCode; // 시설 코드
    private int hashNo; // 해시 코드
    
    public HashStorage() {
    	
    }

	public String getPlcCode() {
		return plcCode;
	}

	public void setPlcCode(String plcCode) {
		this.plcCode = plcCode;
	}

	public int getHashNo() {
		return hashNo;
	}

	public void setHashNo(int hashNo) {
		this.hashNo = hashNo;
	}

	public HashStorage(String plcCode, int hashNo) {
		super();
		this.plcCode = plcCode;
		this.hashNo = hashNo;
	}

	@Override
	public String toString() {
		return "HashStorage [plcCode=" + plcCode + ", hashNo=" + hashNo + "]";
	}
    
    
}
