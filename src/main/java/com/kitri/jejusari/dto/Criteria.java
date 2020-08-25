package com.kitri.jejusari.dto;

public class Criteria {
	private int pageNumber; // 페이지 번호
	private int boardSize; // 페이지당 게시글 갯수
	private int startRow; // 페이지 한 행의 첫번째 게시물 rowNum
	private int endRow; // 페이지 한 행의 마지막 게시물 rowNum
	
	
	public Criteria() { //디폴트 생성자 
		this.pageNumber = 1; // 페이지 1 로 초기화
		this.boardSize = 10; // 페이지당 게시글 10개
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) { // 페이지 번호 set
		if (pageNumber <= 0) {
			this.pageNumber = 1;
		}
		this.pageNumber = pageNumber;
	}

	public int getBoardSize() {
		return boardSize;
	}

	public void setBoardSize(int boardSize) { // 페이지당 게시물 갯수 set
		if (boardSize <= 0 || boardSize > 100)
			this.boardSize = 10;
		this.boardSize = boardSize;
	}
	
	public int getPageStart() { 
		return (this.pageNumber - 1) * boardSize;
	}
	
	public int getStartRow() {
		startRow = ((pageNumber - 1) * boardSize) + 1;
		return startRow;
	}

	public int getEndRow() {
		endRow = startRow + boardSize - 1;
		return endRow;
	}
	
	@Override
	public String toString() {
		return "Criteria [pageNumber=" + pageNumber + ", boardSize=" + boardSize + ", startRow=" + startRow + ", endRow=" + endRow
				+ "]";
	}
	
}
