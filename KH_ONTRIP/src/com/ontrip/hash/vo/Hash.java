package com.ontrip.hash.vo;


public class Hash {
    private int hashNo; // 해시태그 코드
    private String hashName; // 해시태그 명
	
    public Hash(int hashNo, String hashName) {
		super();
		this.hashNo = hashNo;
		this.hashName = hashName;
	}

	public int getHashNo() {
		return hashNo;
	}

	public void setHashNo(int hashNo) {
		this.hashNo = hashNo;
	}

	public String getHashName() {
		return hashName;
	}

	public void setHashName(String hashName) {
		this.hashName = hashName;
	}

	@Override
	public String toString() {
		return "Hash [hashNo=" + hashNo + ", hashName=" + hashName + "]";
	}
    
    
    
}
