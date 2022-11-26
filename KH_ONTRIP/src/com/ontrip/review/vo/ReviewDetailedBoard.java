package com.ontrip.review.vo;

import java.sql.Date;

public class ReviewDetailedBoard {

    private String plcName;
    private String memName;
    private Date revDate;
    private String revText;
    private int revStar;
    private int revC;
    private int revS;
    private int revP;
    private String categoryCode;

    public ReviewDetailedBoard() {

    }

    public ReviewDetailedBoard(String plcName, String memName, Date revDate, String revText, int revStar, int revC, int revS, int revP, String categoryCode) {
        this.plcName = plcName;
        this.memName = memName;
        this.revDate = revDate;
        this.revText = revText;
        this.revStar = revStar;
        this.revC = revC;
        this.revS = revS;
        this.revP = revP;
        this.categoryCode = categoryCode;
    }
    
    public ReviewDetailedBoard(String plcName, String memName, Date revDate, String revText, int revStar, int revC, int revS, int revP) {
        this.plcName = plcName;
        this.memName = memName;
        this.revDate = revDate;
        this.revText = revText;
        this.revStar = revStar;
        this.revC = revC;
        this.revS = revS;
        this.revP = revP;
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

    public Date getRevDate() {
        return revDate;
    }

    public void setRevDate(Date revDate) {
        this.revDate = revDate;
    }

    public String getRevText() {
        return revText;
    }

    public void setRevText(String revText) {
        this.revText = revText;
    }

    public int getRevStar() {
        return revStar;
    }

    public void setRevStar(int revStar) {
        this.revStar = revStar;
    }

    public int getRevC() {
        return revC;
    }

    public void setRevC(int revC) {
        this.revC = revC;
    }

    public int getRevS() {
        return revS;
    }

    public void setRevS(int revS) {
        this.revS = revS;
    }

    public int getRevP() {
        return revP;
    }

    public void setRevP(int revP) {
        this.revP = revP;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    @Override
    public String toString() {
        return "ReviewDetailedBoard{" +
                "plcName='" + plcName + '\'' +
                ", memName='" + memName + '\'' +
                ", revDate=" + revDate +
                ", revText='" + revText + '\'' +
                ", revStar=" + revStar +
                ", revC=" + revC +
                ", revS=" + revS +
                ", revP=" + revP +
                ", categoryCode='" + categoryCode + '\'' +
                '}';
    }
}
