package com.ontrip.manager.vo;

public class Manager {

    private String mId;
    private String mPwd;
    private String mName;
    
    public Manager() {
    	
    }

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPwd() {
		return mPwd;
	}

	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public Manager(String mId, String mPwd, String mName) {
		super();
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
	}

	@Override
	public String toString() {
		return "Manager [mId=" + mId + ", mPwd=" + mPwd + ", mName=" + mName + "]";
	}
    
   

}
