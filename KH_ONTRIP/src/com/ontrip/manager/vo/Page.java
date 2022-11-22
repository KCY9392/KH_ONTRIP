package com.ontrip.manager.vo;


public class Page {

    private int startPage ; //게시글 회면 첫번째 번호
    private int endPage;  //게시글 회면  마지막 번호

    private boolean prev , next;

    private int pageNum; //현재 조회하는 페이지번호
    private int amount ; // 회면 (게시글) 데이터수
    private int total; //전체게시글수

    public Page(int pageNum, int amount, int total) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.total = total;

        this.endPage = (int)Math.ceil(this.pageNum * 0.25) * 4 ;

        this.startPage = this.endPage - 4 + 1;

        int realEnd = (int) Math.ceil(this.total / (double) this.amount);


        if (this.endPage > realEnd) {
            this.endPage = realEnd;
        }

        this.prev = this.startPage > 1;


        this.next = this.endPage < realEnd;


        System.out.println("시작페이지 : " +this.startPage +", 끝페이지:"+ this.endPage);


    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public void setPrev(boolean prev) {
        this.prev = prev;
    }

    public boolean isNext() {
        return next;
    }

    public void setNext(boolean next) {
        this.next = next;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Page{" +
                "startPage=" + startPage +
                ", endPage=" + endPage +
                ", prev=" + prev +
                ", next=" + next +
                ", pageNum=" + pageNum +
                ", amount=" + amount +
                ", total=" + total +
                '}';
    }
}
