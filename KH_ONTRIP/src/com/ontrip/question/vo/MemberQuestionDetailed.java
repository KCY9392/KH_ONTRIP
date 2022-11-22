package com.ontrip.question.vo;

public class MemberQuestionDetailed {

    private Integer qCode;
    private String qTitle;
    private String qContent;
    private String aContent;

    public MemberQuestionDetailed() {

    }

    public MemberQuestionDetailed(Integer qCode, String qTitle, String qContent, String aContent) {
        this.qCode = qCode;
        this.qTitle = qTitle;
        this.qContent = qContent;
        this.aContent = aContent;
    }

    public Integer getqCode() {
        return qCode;
    }

    public void setqCode(Integer qCode) {
        this.qCode = qCode;
    }

    public String getqTitle() {
        return qTitle;
    }

    public void setqTitle(String qTitle) {
        this.qTitle = qTitle;
    }

    public String getqContent() {
        return qContent;
    }

    public void setqContent(String qContent) {
        this.qContent = qContent;
    }

    public String getaContent() {
        return aContent;
    }

    public void setaContent(String aContent) {
        this.aContent = aContent;
    }

    @Override
    public String toString() {
        return "MemberQuestionDetailed{" +
                "qCode=" + qCode +
                ", qTitle='" + qTitle + '\'' +
                ", qContent='" + qContent + '\'' +
                ", aContent='" + aContent + '\'' +
                '}';
    }
}
