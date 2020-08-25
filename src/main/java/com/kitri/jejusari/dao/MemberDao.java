package com.kitri.jejusari.dao;

import java.util.List;

import com.kitri.jejusari.dto.MemberDto;
import com.kitri.jejusari.dto.SalesImgDto;

public interface MemberDao {
	
	// 회원가입
	public int memberJoin(MemberDto memberDto);
	
	// 아이디 중복 체크
	public int member_id_check(String member_id);
	
	// 회원탈퇴
	public int member_delete(String member_id);
	
	// 회원 삭제
	public int dropMember(List<String> list);

	// 스크랩 이미지
	public List<SalesImgDto> getScrap(String member_id);
	
	// 매물 이미지
	public List<SalesImgDto> getSales(String member_id);

	// 마이페이지 카드 삭제 - 매물 번호
	public List<String> getSalesNumber(String member_id);


	public int memberCount();
	
	// 회원 리스트
	public List<String> memberList(int startRow, int endRow);


	// 임시 로그인
	public MemberDto tempLogin(MemberDto memberDto);

	
	/*
	 * // 임시 로그인 public MemberDto tempLogin(MemberDto memberDto);
	 */
	
	// 회원 수정
	public int memberUpdate(MemberDto memberDto);

}
