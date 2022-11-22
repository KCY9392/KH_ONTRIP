package com.ontrip.question.vo;

import java.sql.Date;

public class MemberQuestionBoard {

    private int qCode;
    private String qTitle ;
    private String aContent;
    private Date qDate;
    private String memName;
    private int memNum;

    public MemberQuestionBoard() {

    }

    public MemberQuestionBoard(int qCode, String qTitle, String aContent, Date qDate, String memName, int memNum) {
        this.qCode = qCode;
        this.qTitle = qTitle;
        this.aContent = aContent;
        this.qDate = qDate;
        this.memName = memName;
        this.memNum = memNum;
    }

    public int getqCode() {
        return qCode;
    }

    public void setqCode(int qCode) {
        this.qCode = qCode;
    }

    public String getqTitle() {
        return qTitle;
    }

    public void setqTitle(String qTitle) {
        this.qTitle = qTitle;
    }

    public String getaContent() {
        return aContent;
    }

    public void setaContent(String aContent) {
        this.aContent = aContent;
    }

    public Date getqDate() {
        return qDate;
    }

    public void setqDate(Date qDate) {
        this.qDate = qDate;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public int getMemNum() {
        return memNum;
    }

    public void setMemNum(int memNum) {
        this.memNum = memNum;
    }

    @Override
    public String toString() {
        return "MemberQuestionBoard{" +
                "qCode=" + qCode +
                ", qTitle='" + qTitle + '\'' +
                ", aContent='" + aContent + '\'' +
                ", qDate=" + qDate +
                ", memName='" + memName + '\'' +
                ", memNum=" + memNum +
                '}';
    }
}
