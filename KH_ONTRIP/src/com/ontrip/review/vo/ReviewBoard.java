package com.ontrip.review.vo;

import java.sql.Date;

public class ReviewBoard {


    private int revCode ;
    private String plcName ;
    private String memName ;
    private Date rnDate ;
    private String category;

    public ReviewBoard() {

    }

    public ReviewBoard(int revCode, String plcName, String memName, Date rnDate, String category) {
        this.revCode = revCode;
        this.plcName = plcName;
        this.memName = memName;
        this.rnDate = rnDate;
        this.category = category;
    }

    public int getRevCode() {
        return revCode;
    }

    public void setRevCode(int revCode) {
        this.revCode = revCode;
    }

    public String getPlcName() {
        return plcName;
    }

    public void setPlcName(String plcName) {
        this.plcName = plcName;
    }

    public String getMemName() {
        return memName;
    }

    public void setMemName(String memName) {
        this.memName = memName;
    }

    public Date getRnDate() {
        return rnDate;
    }

    public void setRnDate(Date rnDate) {
        this.rnDate = rnDate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public String toString() {
        return "ReviewBoard{" +
                "revCode=" + revCode +
                ", plcName='" + plcName + '\'' +
                ", memName='" + memName + '\'' +
                ", rnDate=" + rnDate +
                ", category='" + category + '\'' +
                '}';
    }
}
