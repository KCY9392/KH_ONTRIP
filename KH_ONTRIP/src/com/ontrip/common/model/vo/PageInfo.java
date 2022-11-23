package com.ontrip.common.model.vo;

public class PageInfo {
	
	private int listCount; // 현재 총 게시글 갯수
	private int currentPage; // 현재 페이지(즉 , 사용자가 요청한 페이지)
	private int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대 갯수
	private int boardLimit; // 한 페이지에 보여질 게시글의 최대 갯수 (몇 개 단위씩)
	private int maxPage; // 가장 마지막 페이지가 몇번 페이지 인지(총 페이지 수)
	private int startPage; // 페이지 하단에 보여질 페이징 바의 시작수
	private int endPage; // 페이지 하단에 보여질 페이징 바의 끝수
	private int memberNo;
	private int revCode;
	
	public PageInfo() {
		super();
	}

	public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage, int memberNo, int revCode) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.memberNo = memberNo;
		this.revCode = revCode;
	}

	public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getBoardLimit() {
		return boardLimit;
	}

	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
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

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getRevCode() {
		return revCode;
	}

	public void setRevCode(int revCode) {
		this.revCode = revCode;
	}

	@Override
	public String toString() {
		return "PageInfo [listCount=" + listCount + ", currentPage=" + currentPage + ", pageLimit=" + pageLimit
				+ ", boardLimit=" + boardLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + ", memberNo=" + memberNo + ", revCode=" + revCode + "]";
	}

}