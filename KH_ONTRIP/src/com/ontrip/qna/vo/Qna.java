package com.ontrip.qna.vo;

public class Qna {

    private String qaQuestion;
    private String qaCode;
    private String qaAnswer;

    public Qna() {
    	
    }

	public String getQaQuestion() {
		return qaQuestion;
	}

	public void setQaQuestion(String qaQuestion) {
		this.qaQuestion = qaQuestion;
	}

	public String getQaCode() {
		return qaCode;
	}

	public void setQaCode(String qaCode) {
		this.qaCode = qaCode;
	}

	public String getQaAnswer() {
		return qaAnswer;
	}

	public void setQaAnswer(String qaAnswer) {
		this.qaAnswer = qaAnswer;
	}

	public Qna(String qaQuestion, String qaCode, String qaAnswer) {
		super();
		this.qaQuestion = qaQuestion;
		this.qaCode = qaCode;
		this.qaAnswer = qaAnswer;
	}

	@Override
	public String toString() {
		return "Qna [qaQuestion=" + qaQuestion + ", qaCode=" + qaCode + ", qaAnswer=" + qaAnswer + "]";
	}
    
    

}
