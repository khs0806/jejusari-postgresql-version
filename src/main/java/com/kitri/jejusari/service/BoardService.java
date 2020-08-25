package com.kitri.jejusari.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

public interface BoardService {
	
	
	public void reportWriteOk(ModelAndView mav);
	
	// DB테스트
	public List<String> testDB();

	public void newsList(ModelAndView mav);
	
	//공지사항 게시판 리스트
		public void noticeList(ModelAndView mav);
		
		//공지사항 게시판 읽기
		public void noticeDetail(ModelAndView mav); 
		
		//공지사항 게시판 작성
		public void noticeWrite(ModelAndView mav);
		
		//공지사항 게시판 작성 완료 - 하는중
		public void noticeWriteOk(ModelAndView mav);
		
		//공지사항 삭제
		public void noticeDelete(ModelAndView mav);
		public void noticeDeleteOk(ModelAndView mav);
		
		//공지사항 수정
		
		//기존의 공지사항 게시판 내용 뿌리기
		public void noticeUpdate(ModelAndView mav);
		
		//공지사항 수정 완료
		public void noticeUpdateOk(ModelAndView mav);
		
		//신고내역리스트
		public void getReportList(ModelAndView mav);
		
		//신고 및 매물 삭제
		public void AdDelete(ModelAndView mav); 
		
		//신고 상세 보기
		public void ReportDetail(ModelAndView mav);
		
		//신고처리 업데이트
		public int reportUpdate(ModelAndView mav);
	
}
