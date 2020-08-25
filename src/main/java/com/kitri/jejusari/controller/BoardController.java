package com.kitri.jejusari.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dto.NoticeDto;
import com.kitri.jejusari.dto.ReportDto;
import com.kitri.jejusari.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	// 메인 리다이렉트
	@RequestMapping(value="/")
	public String home() {
		return "redirect:main";
	}
	
	// 메인
	@RequestMapping(value="/main")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		request.setAttribute("pageNumber", 1);
		mav.addObject("request", request);
		boardService.noticeList(mav);
		boardService.newsList(mav);
		mav.setViewName("main/main.tiles");
		return mav;
	}
	
	// 사이트소개
	@RequestMapping(value="/introduce")
	public String introduce() {
		
		return "main/introduce.tiles";
	}
	
	// 뉴스리스트
	@RequestMapping(value="/news")
	public ModelAndView news() {
		ModelAndView mav=new ModelAndView();
		
		boardService.newsList(mav);
//		System.out.println(mav);
		
		return mav;
	}
	
	// 공지사항 목록
	@RequestMapping(value="/notice")
	public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) {
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		
		boardService.noticeList(mav);
		return mav;
	}
	
	// 공지사항 상세보기
	@RequestMapping(value="/notice/detail")
	public ModelAndView noticeDetail(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		boardService.noticeDetail(mav);
		
		return mav;
	}

	// 공지사항 작성 화면
	@RequestMapping(value="/notice/write")
	public ModelAndView noticeWrite(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		boardService.noticeWrite(mav);
		
		return mav;
		//return "notice/notice_write.tiles";
	}
		
	// 공지사항 작성
	@RequestMapping(value="/notice/writeOk", method=RequestMethod.POST)
	public ModelAndView noticeWriteDo(HttpServletRequest request, HttpServletResponse response, NoticeDto noticeDto) {
		ModelAndView mav = new ModelAndView();
		System.out.println("controller : " + noticeDto);
		mav.addObject("request", request);
		mav.addObject("noticeDto", noticeDto);
		
		boardService.noticeWriteOk(mav);
		
		return mav;
		//return "notice/notice_writeOk.tiles";
	}
	
	// 공지사항 수정 화면
	@RequestMapping(value="/notice/update")
	public ModelAndView noticeUpdate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		boardService.noticeUpdate(mav);
		
		return mav;
		
		//return "notice/notice_update.tiles";
	}

	// 공지사항 수정
	@RequestMapping(value="/notice/updateOk", method=RequestMethod.POST)
	public ModelAndView noticeUpdateDo(HttpServletRequest request, HttpServletResponse response, NoticeDto noticeDto) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("noticeDto", noticeDto);
		
		boardService.noticeUpdateOk(mav);
		
		return mav;
		
		//return "notice/notice_updateOk.tiles";
	}

	// 공지사항 삭제화면
	@RequestMapping(value="/notice/delete")
	public ModelAndView noticeDelete(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		boardService.noticeDelete(mav);
		
		return mav;
	}

	// 공지사항 삭제
	@RequestMapping(value="/notice/deleteOk", method=RequestMethod.POST)
	public ModelAndView noticeDeleteDo(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("request", request);
		
		boardService.noticeDeleteOk(mav);
		
		return mav;
		
		//return "notice/notice_deleteOk.tiles";
	}
	
	// 신고 작성
	@RequestMapping(value="/report/write", method = RequestMethod.GET)
	public ModelAndView report(HttpServletRequest request, HttpServletResponse response) {
		
		ModelAndView mav = new ModelAndView();
		String sales_number = request.getParameter("sales_number");
		String sales_title = request.getParameter("sales_title");
		
		mav.addObject("sales_number", sales_number);
		mav.addObject("sales_title", sales_title);
		mav.setViewName("report/report_write.empty");
		
		return mav;
	}
	
	// 신고작성 ok
	@RequestMapping(value="/report/write", method=RequestMethod.POST)
	public ModelAndView memberRegisterOk(HttpServletRequest request, HttpServletResponse response, ReportDto reportDto) {
		System.out.println( "reportDto : " + reportDto.toString());			// 넘어오는지 확인
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("reportDto", reportDto);
		mav.addObject("request",request);
		boardService.reportWriteOk(mav);   // controller의 함수명과 같게 하는게 좋다.
		
		mav.setViewName("report/report_writeOk");
		
	    return mav;
	}
	
	// 신고 관리자
		@RequestMapping(value="/report/admin")
		public ModelAndView reportAdmin(HttpServletRequest request, HttpServletResponse response) {
			  ModelAndView mav = new ModelAndView();

			   mav.addObject("request", request);
			   
				boardService.getReportList(mav);
				
				return mav;
		}
			
			
	// 신고 및 매물 삭제
	@RequestMapping(value = "/report/delete") /* method = RequestMethod.GET */ 
	public ModelAndView deleteReport(HttpServletRequest request, HttpServletResponse response) {
		   ModelAndView mav = new ModelAndView();
			  
		   mav.addObject("request", request);
			  
		   boardService.AdDelete(mav); 
			  
		   return mav;
	}
		  
		 
	// 신고 상세 확인
	@RequestMapping(value="/report/detail", method = RequestMethod.GET)
	public ModelAndView reportDetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("request", request);

		boardService.ReportDetail(mav);

		return mav;
	}

	@RequestMapping(value="/report/update",method=RequestMethod.GET)
	public ModelAndView reportUpdate(HttpServletRequest request, HttpServletResponse response, ReportDto reportDto) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);

		int check = boardService.reportUpdate(mav);

		System.out.println("controller:"+check);
		return mav;
	}
}
