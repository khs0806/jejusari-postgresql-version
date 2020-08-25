package com.kitri.jejusari.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dao.MemberDao;
import com.kitri.jejusari.dto.MemberDto;
import com.kitri.jejusari.dto.SalesImgDto;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Override
	public int memberJoin(MemberDto memberDto) {
		return memberDao.memberJoin(memberDto);
	}
	
	@Override
	public int member_id_check(String member_id) {
		return memberDao.member_id_check(member_id);
	}
	
	@Override
	public int member_delete(String member_id) {
		
		return memberDao.member_delete(member_id);
	}
	
	@Override
	public void getMemberList(ModelAndView mav) {
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String member_level = (String) session.getAttribute("member_level");

		session.getAttribute("member_level");
		//페이징
		String pageNumber=request.getParameter("pageNumber");
		System.out.println("pageNumber"+pageNumber);
		if(pageNumber == null) pageNumber = "1";
		int currentPage = Integer.parseInt(pageNumber);	//요청한 페이지
		int boardSize = 10;		// [1] start:1, end:10  [2] start:11, end:20

		int startRow = (currentPage - 1) * boardSize + 1;	//1  11 21 31
		int endRow = currentPage * boardSize;			//10 20 30 40

		//count 사용해서 글이 아예 없는경우 페이징 사라지게
		int count = memberDao.memberCount();
		List<String> memberList = null;

		if(count > 0) {
			//startRow, endRow
			memberList = memberDao.memberList(startRow, endRow);
		}

		mav.addObject("MemberList", memberList);
		System.out.println(memberList);

		mav.addObject("member_level",member_level);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);

		mav.setViewName("admin/member_admin.tiles");
	}

	@Override
	public int dropMember(List<String> list) {

	    return memberDao.dropMember(list);
	}
	
	@Override
	public void myPage(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session =(HttpSession) map.get("session");
		
		String member_id=(String) session.getAttribute("member_id");
		System.out.println("서비스-아이디 : " + member_id);
		
		List<SalesImgDto> scrapList=memberDao.getScrap(member_id);
		System.out.println("서비스-스크랩리스트 : " + scrapList);
		
		List<SalesImgDto> salesList=memberDao.getSales(member_id);
		System.out.println("서비스-세일즈리스트 : " + salesList);
		
//		SalesDto salesDto=memberDao.
		
		mav.addObject("scrapList", scrapList);
		mav.addObject("salesList", salesList);
		mav.setViewName("member/member_mypage.tiles");
	}
	
	@Override
	public MemberDto tempLogin(MemberDto memberDto) {
		return memberDao.tempLogin(memberDto);
	}
	
	@Override
	public int memberUpdate(MemberDto memberDto) {
		return memberDao.memberUpdate(memberDto);
	}
	
	@Override
	public void deleteScrap(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpSession session=request.getSession();
	}
	 
}
