package com.ontrip.payment.vo;

public class Bank {

    private int transfer_No; // 이체후원번호 // SQL : TRANSFER_NO // NUMBER
    private String bank; // 은행 // SQL : BANK // VARCHAR2(100)
    private String name; // 예금주명 // SQL : NAME // VARCHAR2(100)
    private String account_Number; // 계좌번호 // SQL : ACCOUNT_NUMBER // VARCHAR2(100)
    
    public Bank() {
    	
    }

	public int getTransfer_No() {
		return transfer_No;
	}

	public void setTransfer_No(int transfer_No) {
		this.transfer_No = transfer_No;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccount_Number() {
		return account_Number;
	}

	public void setAccount_Number(String account_Number) {
		this.account_Number = account_Number;
	}

	public Bank(int transfer_No, String bank, String name, String account_Number) {
		super();
		this.transfer_No = transfer_No;
		this.bank = bank;
		this.name = name;
		this.account_Number = account_Number;
	}

	@Override
	public String toString() {
		return "Bank [transfer_No=" + transfer_No + ", bank=" + bank + ", name=" + name + ", account_Number="
				+ account_Number + "]";
	}
    
    

}
