package com.kitri.jejusari.dto;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Repository;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Repository
public class PageMaker {
	
	private int totalCount; // 게시글 총 갯수
	private int startPage; // 10개의 페이지중 첫번째
	private int endPage; // 10개의 페이지중 마지막
	private boolean prev; // 페이지 이전 버튼
	private boolean next; // 페이지 다음 버튼
	private int displayPageNum = 5;
	private Criteria cri; // 페이지 정보 객체
	
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	
	public Criteria getCri() {
		return cri;
	}
	// tempEndPage = pageCount
	// totalCount = count
	// displayPageNum == 
	private void calcData() { // 페이지 데이터 처리
		// 1~10 페이지는 endPage가 10으로 고정되고 11~20 페이지는 endPage가 20으로 고정되는 방식
		endPage = (int) (Math.ceil(cri.getPageNumber() / (double)displayPageNum) * displayPageNum);
		// startPage는 매 첫번째 페이지
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getBoardSize()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage; // 마지막 게시물이 있는 페이지가 endPage로 다시 할당해준다.
		}
		prev = startPage == 1 ? false : true; // 첫번째 페이지가 1이면 false를 반환하여 이전버튼이 사라지게 한다.
		next = endPage * cri.getBoardSize() >= totalCount ? false : true; // 마지막페이지의 게시글이 10개 이하면 false를 반환.
	}
	
	public String makeQuery(int pageNumber) { // 원하는 페이지로 페이지 쿼리문을 날려준다.
		UriComponents uriComponents =
		UriComponentsBuilder.newInstance()
						    .queryParam("pageNumber", pageNumber) // page번호를 파라미터값으로 날려준다.
							.queryParam("boardSize", cri.getBoardSize()) // page당 게시글 갯수를 파라미터값으로 날려준다.
							.build();
		   
		return uriComponents.toUriString();
	}
	
	public String makeSearch(int pageNumber)
	{
	  
	 UriComponents uriComponents =
	            UriComponentsBuilder.newInstance()
	            .queryParam("pageNumber", pageNumber)
	            .queryParam("boardSize", cri.getBoardSize())
	            .queryParam("sales_category_type", ((SalesDto)cri).getSales_category_type())
	            .queryParam("sales_category_rent", ((SalesDto)cri).getSales_category_rent())
	            .queryParam("sales_address", ((SalesDto)cri).getSales_address())
	            .replaceQueryParam("sales_option", ((SalesDto)cri).getSales_option())
	            .build(); 
	    return uriComponents.toUriString();  
	}

	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) { 
			return "";
		}
		 
		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch(UnsupportedEncodingException e) { 
			return ""; 
		}
	}
}
